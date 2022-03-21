import 'package:flutter/material.dart';
import 'package:la_fabrique_qui_pique/views/home/widgets/homesignup_view.dart';

import 'widgets/homesignin_view.dart';

class HomeVieuw extends StatelessWidget {
  static String routename = '/';
  const HomeVieuw({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.00),
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:  const <Widget>[
             Image(
              image: AssetImage('assets/images/FABP_Logo.jpg'),
              fit: BoxFit.cover,
              ),
             SizedBox(
                height: 20.00,
              ),
               Text(
                 'Bienvenue sur notre application, nous allons tous vous expliquez mais avant toute chose veuillez soit vous connectez soit créez un compte ',
                 textAlign: TextAlign.center,
                 style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                 ),
               ),
               SizedBox(
                 height: 20,
               ),
              HomeSignUpView(),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'ou :',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                  ),
                    SizedBox(
                  height: 10.0,
                ),
               HomeSignInView(),
          ],
        ),
       ),
     );
  }
}