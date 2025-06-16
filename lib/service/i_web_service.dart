import 'dart:io';

abstract class IWebService {
  Future<dynamic> webRequest({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    bool isMultipart = false,
    List<File>? files,
  });
}



