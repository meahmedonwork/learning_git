import 'dart:convert';

import 'package:http/http.dart';

abstract class DecoderJson{

  Future<dynamic> responseDecoder(Response response) async {
    final body = await jsonDecode(response.body);
    return body;
  }
}