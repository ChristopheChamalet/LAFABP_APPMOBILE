import 'package:flutter/material.dart';
import '../../auth/signin_view.dart';

class HomeSignInView extends StatelessWidget {
  const HomeSignInView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                 RoundedRectangleBorder(
                  borderRadius:  BorderRadius.circular(10.0),
                 )
               ),
              ),
              onPressed: () {
                 Navigator.pushNamed(context, SignInView.routeName);
              },
               child: const Text(
                 "Se Connecter",
                  style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 20.00,
                 ),
                 ),
             );
  }
}