import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class NewsModel {
  final int? id;
  final String title;
  final String description;
  final String body;
  final String image;
  final DateTime publishDate;
  final DateTime? updateDate;
  NewsModel({
    this.id,
    required this.title,
    required this.description,
    required this.body,
    required this.image,
    required this.publishDate,
    this.updateDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'body': body,
      'image': image,
      'publishDate': publishDate.millisecondsSinceEpoch,
      'updateDate': updateDate?.millisecondsSinceEpoch,
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] as String,
      description: map['description'] as String,
      body: map['body'] as String,
      image: map['image'] as String,
      publishDate:
          DateTime.fromMillisecondsSinceEpoch(map['publishDate'] as int),
      updateDate: map['updateDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updateDate'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsModel.fromJson(String source) =>
      NewsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NewsModel(id: $id, title: $title, description: $description, body: $body, image: $image, publishDate: $publishDate, updateDate: $updateDate)';
  }
}
