import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_fbauth_app/models/news.dart';

class Newservice {
  static const apikey = 'a894b4f1d0764a5093a80512074ca845';
  Future<List<Article>> fetchNews(String country, String category) async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=$apikey'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final news = json['articles'] as List;
      return news.map((e) => Article.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
