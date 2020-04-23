import 'networking.dart';

const hostname = 'http://ccbu-viya35.aws.sas.com';
const http_port = 31415;
//String id = '';
const esp_rec_model_url =
    '$hostname:$http_port/SASESP/events/Recommendation_Engine/cq1/Final_Recommendation';

class RecommendationModel {
  Future<dynamic> getRecommendation(String id) async {
    NetworkHelper networkHelper =
        NetworkHelper('$esp_rec_model_url?filter=in(cust_id,$id)');
    var recommendationData = await networkHelper.getData();
    print(recommendationData);
    return recommendationData;
  }
}
