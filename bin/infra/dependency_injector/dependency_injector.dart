typedef InstanceCreator<T> = T Function();

class DependencyInjector {
  DependencyInjector._();

  static final _instance = DependencyInjector._();

  factory DependencyInjector() => _instance;

  final _instanceMap = <Type, _InstanceGenerator<Object>>{};

  void register<T extends Object>(
    InstanceCreator<T> instance, [
    bool isSingleton = true,
  ]) =>
      _instanceMap[T] = _InstanceGenerator(instance, isSingleton);

  T get<T extends Object>() {
    final instance = _instanceMap[T]?.getInstance();

    if (instance != null && instance is T) {
      return instance;
    } else {
      throw Exception('[ERROR] -> Instance ${T.toString()} not found');
    }
  }

  call<T extends Object>() => get<T>();
}

class _InstanceGenerator<T> {
  T? _instance;
  bool _alreadyExists = false;

  final InstanceCreator<T> _instanceCreator;

  _InstanceGenerator(this._instanceCreator, bool isSingleton)
      : _alreadyExists = isSingleton;

  T? getInstance() {
    if (_alreadyExists) {
      _instance = _instanceCreator();
      _alreadyExists = false;
    }
    return _instance ?? _instanceCreator();
  }
}
