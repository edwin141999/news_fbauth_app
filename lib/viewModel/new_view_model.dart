import 'package:news_fbauth_app/models/news.dart';

class NewViewModel {
  final Article article;
  NewViewModel(this.article);

  String get title => article.title;
  String get description => article.description;
  String get url => article.url;
  String get urlToImage => article.urlToImage.toString();
  String get publishedAt => article.publishedAt.toString();
  String get content => article.content;
  String get author => article.author.toString();
}
