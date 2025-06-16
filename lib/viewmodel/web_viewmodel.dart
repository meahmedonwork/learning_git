import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_crud_ops/service/urlValidator.dart';
import 'package:flutter_crud_ops/service/web_service.dart';

import '../model/web_model.dart';
import '../service/jsonDecoder.dart';
import '../service/parseUrl.dart';

class WebViewModel extends ChangeNotifier {

  DecoderJson decoderJson;
  WebService webService;
  UrlValidator urlValidator;
  ParseUrl parseUrl;

  WebViewModel(
    this.webService,
    this.urlValidator,
    this.parseUrl,
    this.decoderJson,
  );

  List<WebModel> items = [];

  final Map<String, String> getHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  final Map<String, String> headers = {'Content-Type': 'application/json'};

  Map<String, String> body = {};
  late String id;

  void postData(bodyData) {
    body.addAll(jsonEncode(bodyData) as Map<String, String>);
    notifyListeners();
  }

  Future getRequest(Uri url) async {
    final parsedUrl = await parseUrl.urlParse(url);
    final response = await webService.getRequest(parsedUrl, getHeaders);
    bool validator =  urlValidator.urlValidator(response);

    if (validator == true) {
      final body = decoderJson.responseDecoder(response);
      items = (body as List).map((item) => WebModel.fromJson(item)).toList();
    } else {
      throw {'Decoding Failed'};
    }
    notifyListeners();
  }

  Future postRequest(Uri url) async {
    final parsedUrl = await parseUrl.urlParse(url);
    final response = await webService.postRequest(parsedUrl, headers, body);
    bool validator =  urlValidator.urlValidator(response);

    if (validator == true) {
      final body = decoderJson.responseDecoder(response);
      items = (body as List).map((item) => WebModel.fromJson(item)).toList();
    } else {
      throw {'Decoding Failed'};
    }
    notifyListeners();
  }

  Future putRequest(Uri url) async {
    final parsedUrl = await parseUrl.urlParse(url);
    final response = await webService.putRequest(parsedUrl, headers, body);
    bool validator =  urlValidator.urlValidator(response);

    if (validator == true) {
      final body = decoderJson.responseDecoder(response);
      items = (body as List).map((item) => WebModel.fromJson(item)).toList();
    } else {
      throw {'Decoding Failed'};
    }
    notifyListeners();
  }

  Future deleteRequest(Uri url) async {
    final parsedUrl = await parseUrl.urlParse(url);
    final response = await webService.deleteRequest(id, parsedUrl, headers);
    bool validator = await urlValidator.urlValidator(response);

    if (validator == true) {
      final body = decoderJson.responseDecoder(response);
      items = (body as List).map((item) => WebModel.fromJson(item)).toList();
    } else {
      throw {'Decoding Failed'};
    }
    notifyListeners();
  }
}
