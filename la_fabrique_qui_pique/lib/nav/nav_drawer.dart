import 'package:flutter/material.dart';
import 'package:la_fabrique_qui_pique/views/AppHome/app_home_view.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../views/Profile/profile_view.dart';
import '../views/home/home_view.dart';


class DrawerView extends StatelessWidget {
  const DrawerView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        reverse: false,
        children: <Widget> [
           DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
              "La Fabrique Qui Pique",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black
              ),
              ),
              ],
              ),
              decoration: const BoxDecoration(
                gradient:  LinearGradient(
                  colors: [
                    Color.fromARGB(1000, 250, 168, 2),
                    Color.fromARGB(1000, 255, 236, 11),
                    Color.fromARGB(1000, 255, 196, 0),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title:  const Text('Accueil'),
            onTap: () {
              Navigator.pushNamed(context, AppHomeView.routename);
            },
          ),
          ListTile(
            leading: const Icon(Icons.cloud),
            title:  const Text('Météo'),
            onTap: () {},
          ),
            ListTile(
            leading: const Icon(Icons.book),
            title:  const Text('Cahier de Rucher'),
            onTap: () {},
          ),
            ListTile(
            leading: const Icon(Icons.calendar_month),
            title:  const Text('Extraction Mielerie'),
            onTap: () {},
          ),
             ListTile(
            leading: const Icon(Icons.verified_user),
            title:  const Text('Mon Compte'),
            onTap: () {
              Navigator.pushNamed(context, ProfileView.routeName);
            },
          ),
           ListTile(
                tileColor: Theme.of(context).primaryColor,
                title:  const Text(
                  'Deconnexion',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Provider.of<AuthProvider>(context, listen: false).signout();
                  Navigator.pushNamed(context, HomeVieuw.routename);
                },
          ),
        ],
      ),
    );
  }
}