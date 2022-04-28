import 'package:flutter/material.dart';
import 'package:git_hub/controller/user_repository.dart';
import 'package:git_hub/models/user_models.dart';

class BuscaUsuario extends SearchDelegate {
  static search(String query) async {

  }
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
   return FutureBuilder<List<UserModel>?>(
        future: GetUser(query: query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          snapshot.data![index].owner!.avatarUrl.toString(),
                        ),
                      ),
                      title: Text( snapshot.data![index].name.toString()),
                      subtitle: Text( snapshot.data![index].htmlUrl.toString()),
                    ),
                  );
                });
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Buscar Usuario'),
    );
  }
}
