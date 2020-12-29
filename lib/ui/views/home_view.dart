import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:semangat/ui/shared/colors_helper.dart';


// import flutter services
import 'package:flutter/services.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int page;
  @override
  Widget build(BuildContext context) {
    // Lock Orientation Portait Only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      backgroundColor: bg_white,
        floatingActionButton: Stack(children: [
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
        backgroundColor: bluePrimary,
        child: Icon(Icons.add),
    onPressed: () {},
    )
    ]),
    ]
    ));
  }
}


