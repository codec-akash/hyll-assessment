import 'package:senior_flutter_challenge_v2/model/adventure_model.dart';
import 'package:http/http.dart' as http;
import 'package:senior_flutter_challenge_v2/repo/api_provider.dart';

class AdventureRepo {
  Future<AdventureModel> loadAdventure(int offset) async {
    const String url = "https://api.hyll.com/api/adventures/";
    var data = await ApiProvider().getCall(url, queryParams: {
      "limit": "10",
      "offset": "$offset",
    });
    AdventureModel adventure;
    if (data['error'] != null) {
      throw data['error'];
    } else {
      adventure = AdventureModel.fromJson(data['result']);
    }
    return adventure;
  }
}
