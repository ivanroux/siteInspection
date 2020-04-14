import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:overlay_support/overlay_support.dart';

Color mainColor = Colors.amber;
Color secColor = Colors.black;


class GotPage extends StatefulWidget {
  @override
  _GotPageState createState() => _GotPageState();
}

class _GotPageState extends State<GotPage> {
  var data;
  


  @override
  void initState() {
    super.initState();
    fetchData();
  }
  fetchData()async{
    var response = await http.get(
      "https://script.googleusercontent.com/macros/echo?user_content_key=KSuy1pirPPyDhuP0ah5RHKyc7Vj4nytj8LDUfiXy54fca0Xd6d-yiSovJkjKac8taAG6iffn0xTvWXVRZPf55O_c2y8SrvpOm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnA8-NuGnzimIftDJgZoD0cRZxErsNSh80wlLP81jgiVOx30dSXp56JrC0iAhfiBCyqV-rV9yhQ38&lib=M-uhccQMeG13jeqSOJNNHcHia-YP_fdtC");
      //print(response.body);
    data = userFromJson(response.body);
    //data = jsonDecode(response.body);
    setState(() {
    });
  }

  showGridWidget(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        itemCount: data["user"].length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 600?4 : 2,
          crossAxisSpacing: 16, 
          mainAxisSpacing: 16),
        itemBuilder: (context, index){
          var episode = data["user"][index];
          return Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)),
            child: new InkWell(
              onTap: (){
                // Navigate to second screen with data
                //Navigator.push(context, new MaterialPageRoute(builder: (context) => new DetailScreen(person: new Person(episode["image"],episode["name"],episode["original"],episode["season"]))));
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new DetailScreen(person: new Person())));
              },
              child: Container(
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.network(
                        episode["image"],
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            episode["name"],
                            //episode["guidelineText"],
                            style: TextStyle(backgroundColor: Colors.white30,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("T${episode["season"]}"),
                          decoration: BoxDecoration(
                            color: Colors.amberAccent,
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16))
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ),
          );
        },
      ),
    );
  }

  dataBody(BuildContext context){
      var body = Column(    
      children: <Widget>[
        Expanded(
          child: showGridWidget()
          ),
      ],
    );
    return body;
  }

//Floating Action Button 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    /*
      floatingActionButton: FloatingActionButton(onPressed: (){
        showSimpleNotification(Text("You have a notification"),
        background: Colors.red, 
        autoDismiss: false, 
        trailing: Builder(
          builder: (context){
            return FlatButton(
              textColor: Colors.yellow, 
              onPressed: (){
                OverlaySupportEntry.of(context).dismiss();},
                child:Text("Dismiss")
                );},));
        
      },),
      */
      backgroundColor: mainColor,
      body: data!=null
      ?dataBody(context)
      :Center(
        child:CircularProgressIndicator(),
      )
    );
  }
}

// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);


User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    List<Person> user;

    User({
        this.user,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        user: List<Person>.from(json["user"].map((x) => Person.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "user": List<dynamic>.from(user.map((x) => x.toJson())),
    };
}

class Person {
    String name;
    String image;
    List<Original> original;
    int number;
    String season;

    Person( {
        this.name,
        this.image,
        this.original,
        this.number,
        this.season,
    });

    factory Person.fromJson(Map<String, dynamic> json) => Person(
        name: json["name"],
        image: json["image"],
        original: List<Original>.from(json["original"].map((x) => Original.fromJson(x))),
        number: json["number"],
        season: json["season"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "original": List<dynamic>.from(original.map((x) => x.toJson())),
        "number": number,
        "season": season,
    };
}

class Original {
    dynamic guidlineId;
    String guidlineName;
    String guidelinePicture;
    String guidelineText;
    dynamic guidelineCompliance;
    dynamic pictureId1;
    dynamic pictureUrl1;
    dynamic pictureName1;
    String pictureCompliance1;
    dynamic pictureComment1;
    dynamic pictureGuideline1;
    dynamic pictureAlignemnt1;

    Original({
        this.guidlineId,
        this.guidlineName,
        this.guidelinePicture,
        this.guidelineText,
        this.guidelineCompliance,
        this.pictureId1,
        this.pictureUrl1,
        this.pictureName1,
        this.pictureCompliance1,
        this.pictureComment1,
        this.pictureGuideline1,
        this.pictureAlignemnt1,
    });

    factory Original.fromJson(Map<String, dynamic> json) => Original(
        guidlineId: json["guidlineID"],
        guidlineName: json["guidlineName"],
        guidelinePicture: json["guidelinePicture"],
        guidelineText: json["guidelineText"],
        guidelineCompliance: json["guidelineCompliance"],
        pictureId1: json["pictureID1"],
        pictureUrl1: json["pictureURL1"],
        pictureName1: json["pictureName1"],
        pictureCompliance1: json["pictureCompliance1"],
        pictureComment1: json["pictureComment1"],
        pictureGuideline1: json["pictureGuideline1"],
        pictureAlignemnt1: json["pictureAlignemnt1"],
    );

    Map<String, dynamic> toJson() => {
        "guidlineID": guidlineId,
        "guidlineName": guidlineName,
        "guidelinePicture": guidelinePicture,
        "guidelineText": guidelineText,
        "guidelineCompliance": guidelineCompliance,
        "pictureID1": pictureId1,
        "pictureURL1": pictureUrl1,
        "pictureName1": pictureName1,
        "pictureCompliance1": pictureCompliance1,
        "pictureComment1": pictureComment1,
        "pictureGuideline1": pictureGuideline1,
        "pictureAlignemnt1": pictureAlignemnt1,
    };
}


/*
// Data Constructor for second screen
class Person {
  final String image;
  final String name;  
  final String original;  
  final String season;

  Person(this.image, this.name, this.original, this.season);

  Person.fromMappedJson(Map<String, dynamic> json)
      : image = json['image'],
        name = json['name'],
        original = json['original'],
        season = json['season'];

  Map<String, dynamic> toJson() =>
    {
      'image': image,
      'name': name,
      'original': original,
      'season': season,
    };
}
*/
// Screen class for second screen

class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Person data
  
  final Person person;

  // In the constructor, require a Person
  DetailScreen({Key key, @required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        //title: new Text("${person.season} ${person.name}"),
        title: new Text("${person.name}"),

      ),
      body: new Container(
        child: SingleChildScrollView(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            /*
            children: <Widget>[
              Align(alignment: Alignment.topLeft, child: Text("${person.season} ${person.name}\n", style: TextStyle(fontWeight: FontWeight.bold))),
              //Align(alignment: Alignment.topLeft, child: Text("${person.name}\n", style: TextStyle(color: Colors.red))),
              Align(alignment: Alignment.topLeft, child: Text("${person.original}\n", style: TextStyle(color: Colors.black))),
            ],
            */
          ), 
        )),
      ),  
    );
  }
}

/*
class JsonParseDemo extends StatefulWidget {

  JsonParseDemo() : super();
  
  @override
  _JsonParseDemoState createState() => _JsonParseDemoState();
}

class _JsonParseDemoState extends State<JsonParseDemo> {
  List<User> _users;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getUsers().then((users){
      setState(() {
        _users = users;
        _loading = false;
      });


    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'Loading ...' : 'Users'),        
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: null == _users ? 0 : _users.length,
          itemBuilder: (context, index){
            User user = _users[index];
            return ListTile(onTap: (){},
              title: Text(user.name),
              subtitle: Text(user.email),
            );

          }),
      ),
    );
  }
}
*/