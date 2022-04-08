import 'package:flutter/material.dart';
import 'package:git_hub/models/user_models.dart';
import 'package:git_hub/views/User.page.dart';


class HomePage extends StatelessWidget {
  UserModel? userModel;
  HomePage ({ this.userModel});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserPage(),
    );
  }
}

