import 'package:flutter/material.dart';
import 'package:la_fabrique_qui_pique/providers/auth_provider.dart';
import 'package:la_fabrique_qui_pique/views/AppHome/app_home_view.dart';
import 'package:la_fabrique_qui_pique/views/Profile/profile_view.dart';
import './providers/user_provider.dart';
import 'package:la_fabrique_qui_pique/views/404/not_found.dart';
import 'package:la_fabrique_qui_pique/views/auth/signin_view.dart';
import 'package:la_fabrique_qui_pique/views/auth/signup_view.dart';
import 'package:la_fabrique_qui_pique/views/home/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const LaFabpView());
}

class LaFabpView extends StatefulWidget {
  const LaFabpView({Key? key}) : super(key: key);

  @override
  State<LaFabpView> createState() => _LaFabpViewState();
}

class _LaFabpViewState extends State<LaFabpView> {
  final AuthProvider authProvider = AuthProvider();
  
@override
void initState() {
  authProvider.initAuth();
  super.initState();
}


  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
     providers: [
        ChangeNotifierProvider.value(value: authProvider),
        ChangeNotifierProxyProvider<AuthProvider, UserProvider>(
            create: (_) => UserProvider(),
            update: (_, authProvider, oldUserProvider) {
              oldUserProvider!.update(authProvider);
              return oldUserProvider;
            }),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'La Fabrique Qui Pique',
        theme: ThemeData(
          primaryColor:  const Color.fromARGB(255, 250, 195, 45),
          
        ),
        home: const HomeVieuw(),
        onGenerateRoute: (settings){
          if(settings.name == HomeVieuw.routename) {
            return MaterialPageRoute(builder: (_) => const HomeVieuw());
         } else if(settings.name == SignInView.routeName) {
           return MaterialPageRoute(builder: (_) => const SignInView());
          } else if(settings.name == SignUpView.routeName){
            return MaterialPageRoute(builder: (_) => const SignUpView());
          } else if(settings.name == AppHomeView.routename) {
            return MaterialPageRoute(builder: (_) => const AppHomeView());
          }else if(settings.name == ProfileView.routeName) {
            return MaterialPageRoute(builder: (_) => const ProfileView());
          } else {
            return null;
          }
        },
         onUnknownRoute: (settings) => MaterialPageRoute(builder: (_) => const NotFound()),
      ),
    );
}
}
