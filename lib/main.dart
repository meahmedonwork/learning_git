import 'package:flutter/material.dart';
import 'package:flutter_crud_ops/service/jsonDecoder.dart';
import 'package:flutter_crud_ops/service/parseUrl.dart';
import 'package:flutter_crud_ops/service/urlValidator.dart';
import 'package:flutter_crud_ops/service/web_service.dart';
import 'package:flutter_crud_ops/view/web_view.dart';
import 'package:flutter_crud_ops/viewmodel/web_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {

  UrlValidator urlValidator= UrlValidator as UrlValidator;
  WebService webService  = WebService(urlValidator);
  DecoderJson decoderJson= DecoderJson as DecoderJson;
  ParseUrl parseUrl= ParseUrl as ParseUrl;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WebViewModel(webService,urlValidator,parseUrl,decoderJson),
        ),
      ],
      child:  MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
//main
  @override
  Widget build(BuildContext context) {
    final String fetchUrl = 'https://jsonplaceholder.typicode.com/posts';
    return MaterialApp(
      title: 'CRUD OPS',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WebView(fetchUrl: fetchUrl),
    );
  }
}

