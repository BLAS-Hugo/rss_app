import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';

class Photo extends StatelessWidget{

  RssFeed feed;
  RssItem item;

  Photo(RssFeed feed, RssItem item) {
    this.feed = feed;
    this.item = item;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return photo(feed, item);
  }

  Widget photo(RssFeed feed, RssItem item) {
    var enclosure = item.enclosure.url;
    if (enclosure != null) {
      return new Image.network(feed.image.url, fit: BoxFit.fill);
    } else {
      return new Image.network(enclosure, fit: BoxFit.fill);
    }
  }
}