import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
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
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Hero(
                      tag: 'logo',
                      child: Container(
                        // margin: EdgeInsets.only(top: 60),
                        height: _deviceHeight * .15,
                        width: _deviceWidth * .20,
                        child: Image(
                          image: AssetImage('assets/images/telewise-logo-dark.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
          ],
        ),
      ),
    );
  }
}
