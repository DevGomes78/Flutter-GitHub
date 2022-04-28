import 'dart:convert';
import 'package:git_hub/constants/service_constants.dart';
import 'package:git_hub/models/user_models.dart';
import 'package:http/http.dart' as http;

List<UserModel> lista = [];

Future<List<UserModel>?> GetUser({String? query}) async {
  try {
    var url = Uri.parse(ServiceUrl.BaseUrl);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      result.forEach((item) => lista.add(UserModel.fromJson(item)));
      if(query!.length>2){
        lista = lista
            .where((item) => item.name!.toLowerCase().contains(
          query.toLowerCase(),
        ))
            .toList();
      }
      return lista;
    }
  } catch (e) {
    print('Erro ao acessar a Pagina');
    return null;
  }
}
