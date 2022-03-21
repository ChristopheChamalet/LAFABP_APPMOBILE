import 'package:flutter/material.dart';
import 'package:la_fabrique_qui_pique/views/AppHome/app_home_view.dart';
import '../../models/signin_form_model.dart';
import '../../models/user_model.dart';
import '../../providers/auth_provider.dart';
import '../../providers/user_provider.dart';
import 'package:provider/provider.dart';


class SignInView extends StatefulWidget {
  static String routeName = '/signin';
  const SignInView({ Key? key }) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {

 final GlobalKey<FormState> key = GlobalKey<FormState>();
  late SigninForm signinForm;
  FormState get form => key.currentState!;
  bool hidePassword = true;
  String? error;
  late FocusNode _emailnode;
  late FocusNode _passwordnode;

  @override
  void initState() {
    signinForm = SigninForm(email: null, password: null);
    _emailnode = FocusNode();
    _passwordnode = FocusNode();
    super.initState();
  }

  Future<void> submitForm() async {
    if (form.validate()) {
      form.save();
      final response = await Provider.of<AuthProvider>(context, listen: false)
          .signin(signinForm);
      if (response is User) {
        Provider.of<UserProvider>(context, listen: false).updateUser(response);
        Navigator.pushNamed(context, AppHomeView.routename);
      } else {
        setState(() {
          error = response['error'];
        });
      }
    }
  }

  @override
  void dispose() {
    _emailnode.dispose();
    _passwordnode.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50 , left: 20, right: 20, bottom: 20),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
          const Text(
              'Connexion',
              style: TextStyle(
                fontSize: 22.00,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
            ),
            Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'email',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 3),
                  ),
                  TextFormField(
                    autofocus: true,
                    focusNode: _emailnode,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                         validator: (value) {
                              if(value == null || value.isEmpty) {
                                return 'remplissez une adresse email valide';
                              } else {
                                return null;
                              }
                            },
                    onSaved: (newValue) {
                      signinForm.email = newValue;
                    },
                    onFieldSubmitted: (_) =>  FocusScope.of(context).requestFocus(_passwordnode),
                          textInputAction: TextInputAction.next,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  const Text(
                    'password',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 3),
                  ),
                  TextFormField(
                    focusNode: _passwordnode,
                    obscureText: hidePassword == true ? true : false,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        suffixIcon: IconButton(
                          icon: hidePassword == true
                              ? const Icon(
                                  Icons.visibility,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.visibility_off,
                                  color: Colors.white,
                                ),
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                        )),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    onSaved: (newValue) {
                      signinForm.password = newValue;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: error != null
                        ? Text(
                            error!,
                            style: const TextStyle(
                              color: Colors.red,
                            ),
                          )
                        : null,
                  ),
                  ElevatedButton(
                                style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0)
                        )
                    )
                    ),
                  onPressed: submitForm,
                  child:  const Text(
                   'Se connecter',
                   style: TextStyle(
                    fontWeight: FontWeight.bold,
                      color: Colors.black,
                   ),
                   ),
                   ), 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}