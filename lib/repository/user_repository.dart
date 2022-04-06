import 'dart:convert';
import 'package:git_hub/constants/service_constants.dart';
import 'package:git_hub/models/user_models.dart';
import 'package:http/http.dart' as http;

Future<List<UserModel>?> GetUser() async {
  try {
    var url = Uri.parse(ServiceUrl.BaseUrl);
    List<UserModel> lista = [];
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      result.forEach(
        (item) => lista.add(
          UserModel.fromJson(item),
        ),
      );
      return lista;
    }
  } catch (e) {
    print('Erro ao acessar a pagina');
    return null;
  }
}
