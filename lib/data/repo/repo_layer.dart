import 'package:valorantapp/data/web_services/web_services.dart';

class RepoLayer{
  final WebServices apiProvider;
  RepoLayer({required this.apiProvider});
  Future<dynamic> getAgent()async{
    return apiProvider.getAgent();
  }
}