class WebModel {

  final int id;
  final String title;

  WebModel({required this.id, required this.title});

  factory WebModel.fromJson(Map<String, dynamic> json)
  {
    return WebModel(id: json['id'], title: json['title']);
  }
}