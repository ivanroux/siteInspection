import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

import 'home_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.amber,
          accentColor: Colors.black,
          fontFamily: "Pacifico"
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}