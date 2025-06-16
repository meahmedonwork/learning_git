import 'package:http/http.dart';

abstract class UrlValidator {

  bool urlValidator(Response response) {
    final statusCode = response.statusCode;
    if (statusCode >= 200 && statusCode < 300) {
      return true;
    } else {
      throw ('Request failed"');
    }
  }
}