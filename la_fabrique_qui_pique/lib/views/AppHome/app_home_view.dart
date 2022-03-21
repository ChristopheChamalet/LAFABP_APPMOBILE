import 'package:flutter/material.dart';
import 'package:la_fabrique_qui_pique/nav/nav_drawer.dart';
import 'package:provider/provider.dart';
import '../../models/user_model.dart';
import '../../providers/user_provider.dart';

class AppHomeView extends StatelessWidget {
  static String routename = '/apphome';
  const AppHomeView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final User? user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
      ),
     drawer: const DrawerView(),
      body: Container(
        alignment: Alignment.center,
        child: user != null
            ? Text(
                user.username,
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}