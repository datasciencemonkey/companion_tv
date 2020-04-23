import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final dynamic recommendation;

  const ResultPage({Key key, @required this.recommendation}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String recommendationText;
  double _deviceHeight;
  double _deviceWidth;

  void initState() {
    super.initState();
    updateUI(widget.recommendation);
  }

  void updateUI(dynamic recommendationJSON) {
    setState(() {
      if (recommendationJSON == null) {
        recommendationText = '';
        return;
      }
//      sentimentText = sentimentJSON['events']['event']['sentiment']['\$t'];
      recommendationText =
          recommendationJSON['events'][1]['event']['Recommendation'];
      print(recommendationText);
    });
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  // margin: EdgeInsets.only(top: 60),
                  height: _deviceHeight * .20,
                  width: _deviceWidth * .15,
                  child: Image(
                    image: AssetImage('assets/images/telewise-logo-dark.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Text(
                recommendationText,
                style: TextStyle(color: Colors.white),
              ),
              Expanded(
              child: Container(
                height: _deviceHeight * .50,
                width: _deviceWidth * .60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: recommendationText.toString().contains("Dora")
                        ? NetworkImage(
                            "https://m.media-amazon.com/images/M/MV5BZTE3M2I5MGYtNTYwMC00NTRmLTk5OWYtNWI0YzM0MmVmNzk0XkEyXkFqcGdeQXVyOTI2MTMwMDc@._V1_SY1000_CR0,0,666,1000_AL_.jpg")
                        : NetworkImage(
                            "https://m.media-amazon.com/images/M/MV5BMjkzYzNkNmUtMjYwYi00M2UzLWJjZjYtOGY2YzE4MGEwNjRkXkEyXkFqcGdeQXVyODIyOTEyMzY@._V1_.jpg"),
                  ),
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
              },
              color: Colors.deepOrangeAccent,
              child: Text(
                'Switch & Watch on TV',
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
      ),
    );
  }
}
