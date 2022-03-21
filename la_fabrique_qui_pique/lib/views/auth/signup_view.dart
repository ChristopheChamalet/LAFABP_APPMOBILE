import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/signup_form_model.dart';
import '../../providers/auth_provider.dart';
import 'signin_view.dart';




class SignUpView extends StatefulWidget {
  static String routeName = '/signup';
  const SignUpView({ Key? key }) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
final GlobalKey<FormState> key = GlobalKey<FormState>();
  late SignUpForm signupForm;
  FormState? get form => key.currentState;
  late FocusNode _emailnode;
  late FocusNode _usernamenode;
  late FocusNode _passwordnode;

   @override
  void initState() {
   signupForm = SignUpForm(email: null, username: null, password: null);
    _emailnode = FocusNode();
    _usernamenode = FocusNode();
    _passwordnode = FocusNode();
    super.initState();
  }

  Future<void> submitForm() async {
    if(form!.validate()) {
      form!.save();
      final error = await Provider.of<AuthProvider>(context, listen: false)
          .signup(signupForm);
      if (error == null) {
        Navigator.pushNamed(context, SignInView.routeName);
      }
    }
  }

  @override
  void dispose() {
    _emailnode.dispose();
    _usernamenode.dispose();
    _passwordnode.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top : 50.0, left: 20.0, right: 20.0, bottom: 20.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:  <Widget> [
                   const Text(
              'Inscription ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.00,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              ),
               const SizedBox(
                height: 20,
              ),
              Form(
                key: key,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget> [
                      const Text(
                        'email',
                        style: TextStyle(
                          color:  Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                          const SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          autofocus: true,
                          focusNode: _emailnode,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'email',
                            fillColor: Colors.white,
                            filled: true,
                            hoverColor: Colors.black,
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
                          onSaved: (newValue) {signupForm.email = newValue;},
                          onFieldSubmitted: (_) =>  FocusScope.of(context).requestFocus(_usernamenode),
                          textInputAction: TextInputAction.next,
                        ),
                           const SizedBox(
                          height: 15.0,
                        ),
                         const Text(
                        'Username',
                        style: TextStyle(
                          color:  Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          focusNode: _usernamenode,
                          decoration: const InputDecoration(
                            hintText: 'Username',
                            fillColor: Colors.white,
                            filled: true,
                            hoverColor: Colors.purple,
                            ),
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                             validator: (value) {
                              if(value == null || value.isEmpty) {
                                return 'remplissez un username';
                              } else {
                                return null;
                              }
                            },
                          onSaved: (newValue) {signupForm.username = newValue;},
                          onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_passwordnode),
                          textInputAction: TextInputAction.next,
                        ),
                         const SizedBox(
                          height: 30.0,
                        ),
                         const Text(
                        'Password',
                        style: TextStyle(
                          color:  Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                          const SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          focusNode: _passwordnode,
                          decoration: const InputDecoration(
                            hintText: 'password',
                            fillColor: Colors.white,
                            filled: true,
                            hoverColor: Colors.purple,
                            ),
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                             validator: (value) {
                              if(value == null || value.isEmpty) {
                                return 'remplissez un password';
                              } else {
                                return null;
                              }
                            },
                          onSaved: (newValue) {signupForm.password = newValue;},
                        ),
               const SizedBox(
                          height: 15.0,
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
                  onPressed:  submitForm,
                  child:  const Text(
                   'Inscription',
                   style: TextStyle(
                    fontWeight: FontWeight.bold,
                      color: Colors.black,
                   ),
                   ),
                   ),  
                  ],
                  ),
                ),
                ), 
          ],
        ),
      ),
    );
  }
}