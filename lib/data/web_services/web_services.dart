import 'package:http/http.dart' as http;
import 'package:valorantapp/constatnt/constant.dart';
class WebServices{
  Future<dynamic>getAgent()async{
    final response=await http.get(Uri.parse(baseUrl));
    return response;
  }
}