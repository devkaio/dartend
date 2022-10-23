import '../models/news_model.dart';
import 'generic_service.dart';

class NewsService implements GenericService<NewsModel> {
  final List<NewsModel> _newsList = [];
  @override
  bool delete(int id) {
    _newsList.removeWhere((element) => element.id == id);
    return true;
  }

  @override
  List<NewsModel> findAll() {
    return _newsList;
  }

  @override
  NewsModel findOne(int id) {
    return _newsList.firstWhere((element) => element.id == id);
  }

  @override
  bool save(NewsModel value) {
    final model = _newsList.firstWhere(
      (element) => element.id == value.id,
      orElse: () {
        return value;
      },
    );
    if (_newsList.contains(model)) {
      final index = _newsList.indexOf(model);
      _newsList[index] = value;
    } else {
      _newsList.add(value);
    }
    return true;
  }
}
