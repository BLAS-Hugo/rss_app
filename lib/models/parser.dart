import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Parser {
  final url = "https://animeland.fr/feed/";

  Future loadRss() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final feed = new RssFeed.parse(response.body);
      return feed;
    } else{
      print("error : ${response.statusCode}");
    }
  }
}