import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tv_companion/screens/result_page.dart';
import '../services/recommendation_model.dart';
// import 'results_page.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({@required this.id});
  final String id;
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {

    super.initState();
    getRecommendationData(widget.id);
  }

  void getRecommendationData(String id) async {
    var recommendationData = await RecommendationModel().getRecommendation(id); //json
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ResultPage(
        recommendation: recommendationData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
