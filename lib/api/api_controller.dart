import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_with_api/api/api_setting.dart';

import '../model/news.dart';

class ApiController {
  Future<List<News>> homeNews({
    required String apiUri,
  }) async {
    var url = Uri.parse(apiUri);
    var response = await http.get(url);
    print('response.statusCode is ${response.statusCode}');
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse['articles'] as List;
      print('json Array is : $jsonArray');
      List<News> news = jsonArray.map((e) => News.fromJson(e)).toList();
      print(news);
      return news;
    }
    return [];
  }
}
