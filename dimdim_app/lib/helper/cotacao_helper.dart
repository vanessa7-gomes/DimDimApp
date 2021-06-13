import 'dart:convert' as json;
import 'package:http/http.dart' as http;
// ignore: unused_import
import 'package:dimdim_app/model/moeda.dart';

class CotacaoHelper {
  Future<Map> getCotacaoMoeda() async {
    var uri = Uri.https('api.hgbrasil.com', 'finance', {'key': 'SUA_ID'});
    //var uri = Uri.https('api.hgbrasil.com', 'finance');
    var response = await http.get(uri);
    return json.jsonDecode(response.body)['results']['currencies'];
  }
}
