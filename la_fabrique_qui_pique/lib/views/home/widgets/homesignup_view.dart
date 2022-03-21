

import 'package:flutter/material.dart';

import '../../auth/signup_view.dart';

class HomeSignUpView extends StatelessWidget {
  const HomeSignUpView({ Key? key }) : super(key: key);

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
                  Navigator.pushNamed(context, SignUpView.routeName);
               },
                child: const Text(
                  "S'inscrire",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.00,
                  ),
                  ),
              );
  }
}