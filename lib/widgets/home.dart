import 'package:flutter/material.dart';
import 'dart:async';
import 'package:rss_app/models/parser.dart';
import 'package:webfeed/webfeed.dart';
import 'package:rss_app/widgets/list.dart';
import 'package:rss_app/widgets/grid.dart';
import 'package:rss_app/widgets/loading.dart';


class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  RssFeed feed;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    parse();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: new Text(widget.title),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.refresh),
                onPressed: () {
                  setState(() {
                    feed = null;
                    parse();
                  });
                })
          ],
        ),
        body: orientationChoice()
    );
  }

  Widget orientationChoice() {
    if (feed == null) {
      return new Loading();
    } else {
      var orientation = MediaQuery.of(context).orientation;
      if (orientation == Orientation.portrait) {
        return new List(feed);
      } else {
        return new Grid(feed);
      }
    }
  }

  Future<Null> parse() async{
    RssFeed received = await Parser().loadRss();
    if (received != null) {
      setState(() {
        feed = received;
      });
    }
  }
}