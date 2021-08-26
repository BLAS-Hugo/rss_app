import 'package:flutter/material.dart';
import 'package:rss_app/widgets/CustomText.dart';

class Loading extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
        child: new CustomText("Chargement en cours ...", color: Colors.teal, factor: 1.2, textAlign: TextAlign.center)
    );
  }

}