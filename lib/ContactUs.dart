import 'package:flutter/material.dart';

void main() {
 runApp(new ContactUs());
}

class ContactUs extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(debugShowCheckedModeBanner: false, theme: ThemeData(
          primaryColor: Colors.amber,
          accentColor: Colors.black,
          fontFamily: "Pacifico"
        ),
     title: 'My Dog App',
     home: Scaffold(backgroundColor: Colors.amber,
       appBar: null,
       body: Center(
         child: ListView(    
      children: <Widget>[
        SizedBox(height: 20,),
        Center(
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/ProfilePic.jpg', ),
            radius: 80,
          ),
        ),
        SizedBox(height: 20,),
        Center(child: Text("Mr. Ivan Roux", textScaleFactor: 2,)),
        Center(child: Text("Fire Protection Engineer", textScaleFactor: 1.5,)),
        SizedBox(height: 20,),
        Center(child: Text("Mobile: +27 (0) 83 689 6170", textScaleFactor: 1,)),
        Center(child: Text("Email: ivanroux435@gmail.com", textScaleFactor: 1,)),
        
      ],
    ),
       ),
     ),
   );
 }
}