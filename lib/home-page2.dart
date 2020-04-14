import 'package:flutter/material.dart';

void main() {
 runApp(new DogApp());
}

class DogApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(debugShowCheckedModeBanner: false, theme: ThemeData(
          //primaryColor: Colors.amber,
          accentColor: Colors.black,
          //fontFamily: "Pacifico"
        ),
     title: 'My Dog App',
     home: Scaffold(//backgroundColor: Colors.amber,
       appBar: null,
       body: new Container(
         decoration: new BoxDecoration(
           image: new DecorationImage(
             image: new AssetImage('assets/images/flameBW.PNG'),
               fit: BoxFit.cover
             )
          ),
         child: ListView(    
      children: <Widget>[
        SizedBox(height: 20,),
        Center(
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/logo.PNG'),
            radius: 80,
          ),
        ),
        SizedBox(height: 20,),
        Center(child: Text("Fire Protection App", textScaleFactor: 2, style: TextStyle(fontWeight: FontWeight.bold))),
        Center(child: Text("Version 1.01", textScaleFactor: 1, style: TextStyle(fontWeight: FontWeight.bold))),
        SizedBox(height: 20,),
        
      ],
    ),
       ),
     ),
   );
 }
}