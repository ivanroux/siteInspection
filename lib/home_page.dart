import 'package:flutter/material.dart';

import 'ContactUs.dart';
import 'got_page.dart';
import 'home-page2.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Home", Icons.home),
    new DrawerItem("Assessment", Icons.business),
    new DrawerItem("Contact Us", Icons.phone)
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new DogApp();
      case 1:
        return new GotPage();
      case 2:
        return new ContactUs();

      default:
        return new Text("Error");
    }
  }
  
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        new ListTile(
          leading: new Icon(d.icon),
          title: new Text(d.title),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        )
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            SizedBox(height: 20,),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/logo.PNG'),
                radius: 70,
              ),
            ),
            //new UserAccountsDrawerHeader(
            //    accountName: new Text("Fire Protection App", textScaleFactor: 2.0, ), accountEmail: null),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex), backgroundColor: Colors.amber,
    );
  }
}

