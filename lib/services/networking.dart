import 'package:http/http.dart' as http;
import 'dart:convert'; //for jsonDecode

class NetworkHelper{
  NetworkHelper({required this.url});
  final String url;

  Future getData() async{
    http.Response res = await http.get(Uri.parse(url));
    if(res.statusCode == 200){
      var data = res.body;
      return jsonDecode(data);
    }else {
      print(res.statusCode);
      print(res.reasonPhrase);
    }
  }
}