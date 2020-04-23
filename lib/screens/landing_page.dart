import 'package:flutter/material.dart';
import 'package:strings/strings.dart';
import 'package:uuid/uuid.dart';

import 'loading_page.dart';

class LandingPage extends StatefulWidget {
  final String email;

  const LandingPage({Key key, this.email}) : super(key: key);
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String get _username =>
      capitalize(widget.email.substring(0, widget.email.indexOf('@')));
  String get _id => _username == "Jack" ? '10802' : '22212';
  var uuid = Uuid();
  @override
  void initState() {
    super.initState();
    print('Email is ${widget.email}');
  }

  double _deviceHeight;
  double _deviceWidth;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Currently Watching...',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 2.0,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              color: Theme.of(context).primaryColor,
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.0,
                ),
              ),
            )
          ],
        ),
        // backgroundColor:Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    // margin: EdgeInsets.only(top: 60),
                    height: _deviceHeight * .15,
                    width: _deviceWidth * .15,
                    child: Image(
                      image: AssetImage('assets/images/telewise-logo-dark.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(width: _deviceWidth * 0.05),
                Text(
                  'Hello $_username!',
                  style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(width: _deviceWidth * 0.05),
                Column(
                  children: <Widget>[
                    Text(
                      "Rate Playing Now",
                      style: TextStyle(color: Colors.white),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                            color: Theme.of(context).primaryColor,
                            icon: Icon(Icons.thumb_up),
                            tooltip: 'Increase volume by 10',
                            onPressed: () {}),
                        IconButton(
                            color: Theme.of(context).primaryColor,
                            icon: Icon(Icons.thumb_down),
                            tooltip: 'Increase volume by 10',
                            onPressed: () {}),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Text(
              'STB# - ${uuid.v1()}',
              style: TextStyle(
                color: Colors.deepOrangeAccent,
                fontSize: 10.0,
                // fontWeight: FontWeight.w600,
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(height: _deviceHeight * 0.03),
            Expanded(
              child: Container(
                height: _deviceHeight * .50,
                width: _deviceWidth * .60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: _username == "Jack"
                        ? NetworkImage(
                            "https://m.media-amazon.com/images/M/MV5BMjM1Mjg3NzU4M15BMl5BanBnXkFtZTgwNzE3ODMyMTE@._V1_.jpg")
                        : NetworkImage(
                            "https://m.media-amazon.com/images/M/MV5BMzVhNDcwZGItNGE1Yy00YzEyLTk4NTctZmMyNjI2ZDFjNjE5XkEyXkFqcGdeQXVyNzMwOTY2NTI@._V1_.jpg"),
                  ),
                ),
              ),
            ),
            SizedBox(height: _deviceHeight * 0.05),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoadingScreen(id: _id),
                  ),
                );
              },
              color: Theme.of(context).primaryColor,
              splashColor: Colors.greenAccent,
              child: Text(
                'Recommend Something Else 👍',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
            )
          ],
        ),
      ),
    );
  }
}
