import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchApi {
  String endpoint = '';
  getGroups() async {
    var response = await http.get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data;
    } else {
      print(response.statusCode);
    }
  }
}
