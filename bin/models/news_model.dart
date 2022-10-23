// ignore_for_file: public_member_api_docs, sort_constructors_first
class NewsModel {
  final int id;
  final String title;
  final String description;
  final String body;
  final String image;
  final DateTime publishDate;
  final DateTime? updateDate;

  NewsModel(
    this.id,
    this.title,
    this.description,
    this.body,
    this.image,
    this.publishDate,
    this.updateDate,
  );

  @override
  String toString() {
    return 'NewsModel(id: $id, title: $title, description: $description, body: $body, image: $image, publishDate: $publishDate, updateDate: $updateDate)';
  }
}
