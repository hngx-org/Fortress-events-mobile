import 'dart:convert';
import 'package:http/http.dart' as http;

class CallApi {
  final String _url = "http://ec2-18-119-101-235.us-east-2.compute.amazonaws.com:3000/api/";

  Future<http.Response?> postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    
    try {
      final response = await http.post(
        Uri.parse(fullUrl),
        body: jsonEncode(data),
        headers: _setHeaders(),
      );

      return response;
    } catch (error) {
      print('Error: $error');
      return null; // Return null to indicate an error occurred
    }
  }

  Map<String, String> _setHeaders() {
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
  }
}
