import 'package:http/http.dart' as http;
import 'package:carpark_jsonapp/Carparks.dart';

class HttpService {
  static const String url =
      'http://datamall2.mytransport.sg/ltaodataservice/CarParkAvailabilityv2';
  static Future<List<Value>> getCarparks() async {
    try {
      final response = await http.get(url, headers: {
        'AccountKey': 'qG329yMeR/CviH5B1qnRNA==',
        'accept': 'application/json'
      });
      if (response.statusCode == 200) {
        final Carparks cp = carparksFromJson(response.body);
        return cp.value;
      } else {
        return List<Value>();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return List<Value>();
    }
  } //getCarparks
} //HttpServic
