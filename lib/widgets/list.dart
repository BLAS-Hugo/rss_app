import 'package:flutter/material.dart';
import 'package:rss_app/widgets/detail_page.dart';
import 'package:webfeed/webfeed.dart';
import 'CustomText.dart';
import 'package:rss_app/models/date_converter.dart';
import 'package:rss_app/widgets/photo.dart';

class List extends StatefulWidget {

  RssFeed feed;

  List(RssFeed feed) {
    this.feed = feed;
  }

  @override
  _ListState createState() => new _ListState();
}

class _ListState extends State<List> {

  RssFeed feed;

  @override
  Widget build(BuildContext context) {
    final size = (MediaQuery.of(context).size.width / 3.0);
    return new ListView.builder(
        itemCount: widget.feed.items.length,
        itemBuilder: (context, i) {
          RssItem item = widget.feed.items[i];
          return new Container(
              padding: EdgeInsets.all(10.0),
              height: 150.0,
              child: new Card(
                  elevation: 10.0,
                  child: new InkWell(
                    onTap: () {
                      Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) {
                        return new DetailPage(item);
                      }));
                    },
                    child: new Column(
                      children: <Widget> [
                        padding(),
                        new Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new CustomText("AnimeLand", color: Colors.blue[700], textAlign: TextAlign.start, factor: 0.8),
                          new CustomText(new DateConverter().date(item.pubDate), color: Colors.redAccent, textAlign: TextAlign.end, factor: 0.8)
                        ],
                      ),
                        padding(),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Card(
                              elevation: 7.5,
                              child: new Container(
                                width: size,
                                child: new Photo(feed, item),
                              ),
                            ),
                            new Container(
                              width: size,
                              child: CustomText(item.title, color: Colors.teal)
                            )
                          ],

                        ),
                    ]
                    )
                  )
              )
          );
        }
    );
  }

  Padding padding() {
    return new Padding(padding: EdgeInsets.only(top: 10.0));
  }
}