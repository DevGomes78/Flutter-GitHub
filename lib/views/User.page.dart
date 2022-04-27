import 'package:flutter/material.dart';
import 'package:git_hub/controller/bucar_usuario.dart';
import 'package:git_hub/controller/call_github.dart';
import 'package:git_hub/controller/user_repository.dart';
import 'package:git_hub/models/user_models.dart';
import 'package:git_hub/views/shimmer.dart';

class UserPage extends StatefulWidget {
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  bool isLoading = false;
  List<UserModel> lista = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      loadUser();
    });
  }

  Future loadUser() async {
    setState(() => isLoading = true);
    await Future.delayed(
      const Duration(seconds: 2),
    );
    GetUser().then((map) {
      setState(() {
        lista = map!;
      });
    });
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuarios'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: BuscaUsuario(),
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
          onRefresh: GetUser,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: ListView.builder(
                itemCount: isLoading ? 10 : lista.length,
                itemBuilder: (context, index) {
                  if (isLoading) {
                    return const Skeleton().buildListTile();
                  } else {
                    return buildCard(context, index);
                  }
                }),
          )),
    );
  }

  buildCard(context, index) {
    var list = lista[index];
    return Card(
      elevation: 5,
      child: ListTile(
        onTap: GitHub(userModel: list).callGithub,
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            list.owner!.avatarUrl.toString(),
          ),
        ),
        title: Text(
          list.name.toString(),
        ),
        subtitle: Text(
          list.htmlUrl.toString(),
        ),
      ),
    );
  }
}
