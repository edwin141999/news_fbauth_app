import 'package:flutter/cupertino.dart';
import 'package:news_fbauth_app/services/api_endpoint.dart';
import 'package:news_fbauth_app/viewModel/new_view_model.dart';

class NewsListViewModel extends ChangeNotifier {
  List<NewViewModel> news = [];
  String country = 'ar';
  String category = 'business';

  Future<void> fetchNews() async {
    final results = await Newservice().fetchNews(country, category);
    news = results.map((e) => NewViewModel(e)).toList();
    notifyListeners();
  }
}
