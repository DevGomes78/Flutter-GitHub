import 'package:flutter/material.dart';

class BuscaUsuario extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
   return [
     IconButton(onPressed: (){
       query = '';
     }, icon: const Icon(Icons.clear),),
   ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
   return IconButton(onPressed: (){
     Navigator.pop(context);
   }, icon: const Icon(Icons.arrow_back),);
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child:  Text('Buscar Usuario'),);
  }

}