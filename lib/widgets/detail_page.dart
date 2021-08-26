import 'package:flutter/material.dart';
import 'package:rss_app/widgets/CustomText.dart';
import 'package:webfeed/webfeed.dart';
import 'package:rss_app/models/date_converter.dart';

class DetailPage extends StatelessWidget {

  RssItem item;

  DetailPage(RssItem item){
    this.item = item;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
          title: new Text("Détail de l'article")
      ),
      body: new Center(
        child: new Column(
          children: <Widget> [
            new CustomText(item.title, color: Colors.blue, factor: 1.5, textAlign: TextAlign.center),
            new Image.network(item.enclosure.url),
            new Row(
              children: <Widget> [
                new CustomText("AnimeLand", color: Colors.blue[700], textAlign: TextAlign.start, factor: 0.8),
                new CustomText(new DateConverter().date(item.pubDate), color: Colors.redAccent, textAlign: TextAlign.end, factor: 0.8),
              ]
            ),
            new CustomText(item.description, color: Colors.blue, factor: 0.8, textAlign: TextAlign.center)
          ],
        )
      ),
    );
  }
}