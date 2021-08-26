import 'package:flutter/material.dart';
import 'package:rss_app/widgets/photo.dart';
import 'package:webfeed/webfeed.dart';
import 'CustomText.dart';
import 'package:rss_app/models/date_converter.dart';

class Grid extends StatefulWidget {

  RssFeed feed;

  Grid(RssFeed feed) {
    this.feed = feed;
  }

  @override
  _GridState createState() => new _GridState();
}
class _GridState extends State<Grid> {

  RssFeed feed;

  @override
  Widget build(BuildContext context) {
    return new GridView.builder(
        itemCount: widget.feed.items.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, i) {
          var item = widget.feed.items[i];
          return new Container(
              height: 100.0,
              child: new Card(
                  child: new GridTile(
                      child: new Column (
                          children: <Widget> [
                            new Row(
                              children: <Widget> [
                                new CustomText("AnimeLand", color: Colors.blue[700],
                                    textAlign: TextAlign.start, factor: 0.8),
                                new CustomText(new DateConverter().date(item.pubDate), color: Colors.redAccent, textAlign: TextAlign.end, factor: 0.8)
                              ],
                            ),
                            new CustomText(item.title, color: Colors.teal,
                                textAlign: TextAlign.center),
                            new Container(
                              height:50.0,
                                child: new Photo(feed, item)
                            )
                          ]
                      )
                  )
              )
          );
        }
    );
  }
}