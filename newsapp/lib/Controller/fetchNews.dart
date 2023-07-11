import 'dart:math';
import 'package:http/http.dart';
import 'dart:convert';

import '../model/newsArt.dart';

class FetchNews {
  static List sourcesId = [
    "abc-news",
    "bbc-news",
    "bbc-sport",
    "business-insider",
    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",
    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",
    "medical-news-today",
    "national-geographic",
    "news24",
    "new-scientist",
    "new-york-magazine",
    "next-big-future",
    "techcrunch",
    "techradar",
    "the-hindu",
    "the-wall-street-journal",
    "the-washington-times",
    "time",
    "usa-today",
  ];

  static Future<NewsArt> fetchNews() async {
    final random = Random();
    var sourceID = sourcesId[random.nextInt(sourcesId.length)];
    // print(sourceID);

    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=$sourceID&apiKey=bba46a4b3c594407be7c75d40d326d57"));

    Map body_data = jsonDecode(response.body);
    List articles = body_data["articles"];
    // print(articles);

    final _NewRandom = new Random();
    var myArticle = articles[_NewRandom.nextInt(articles.length)];
    //print(myArticle);

    return NewsArt.fromAPItoApp(myArticle);
  }
}
