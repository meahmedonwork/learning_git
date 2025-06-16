import 'package:flutter_crud_ops/service/urlValidator.dart';
import 'package:http/http.dart' as http;

class WebService {

  UrlValidator urlValidator;
  WebService(this.urlValidator);


  Future<http.Response> getRequest(Uri url, Map<String, String>? headers) async {
    final response = await http.get(url, headers: headers);
    return response;
  }

  Future<http.Response> postRequest(Uri url, Map<String, String>? headers, Map<String, String> body) async {
    final response = await http.post(url, headers: headers, body: body);
    return response;
  }

  Future<http.Response> putRequest(Uri url, Map<String, String>? headers, Map<String, String> body) async {
    final response = await http.put(url, headers: headers, body: body);
    return response;

  }

  Future<http.Response> deleteRequest(String id, Uri url, Map<String, String>? headers) async {
    final response = await http.delete(url, headers: headers);
    return response;
  }

}
