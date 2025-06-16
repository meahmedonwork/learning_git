abstract class ParseUrl{
  Future<Uri> urlParse(url) async {
    final parsedUrl = Uri.parse(url);
    return parsedUrl;
  }
}