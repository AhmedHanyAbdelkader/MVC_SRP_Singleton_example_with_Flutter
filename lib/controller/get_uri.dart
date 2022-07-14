import 'dart:html';

class GetUrl{

  GetUrl._();
  static final getUrlInstance = GetUrl._();



  var baseUrl = "https://jsonplaceholder.typicode.com";

getUrl(key){
  var uri = baseUrl + '/' + key ;
  final url = Uri.parse(uri);
  return url;
}

}
