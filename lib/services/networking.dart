import 'package:clima/services/clima_response.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  getData() async {
    ClimaResponse climaResponse;
    try {
      http.Response res;
      res = await http.get(url);

      climaResponse =
          ClimaResponse(statusCode: res.statusCode, response: res.body);
    } catch (e) {
      climaResponse = ClimaResponse(
          statusCode: 404, response: '{"error" : "Error in fetching data $e"}');
    }
    return climaResponse;
  }
}
