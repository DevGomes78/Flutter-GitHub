import 'package:flutter/material.dart';
import 'package:git_hub/models/user_models.dart';
import 'package:git_hub/repository/user_repository.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<UserModel> lista = [];

  @override
  void initState() {
    super.initState();
    GetUser().then((map) {
      setState(() {
        lista = map!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Git Hub List'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: GetUser,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, index) {
                return buildCard(index);
              }),
        ),
      ),
    );
  }

  Card buildCard(int index) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            lista[index].owner!.avatarUrl.toString(),
          ),
        ),
        title: Text(lista[index].name.toString()),
        subtitle: Text(
          lista[index].htmlUrl.toString(),
        ),
      ),
    );
  }
}
