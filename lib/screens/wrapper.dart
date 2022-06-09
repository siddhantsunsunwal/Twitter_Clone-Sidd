import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_clone/models/user.dart';
import 'package:twitter_clone/screens/authorization/signup.dart';
import 'package:twitter_clone/screens/main/home.dart';
import 'package:twitter_clone/screens/main/posts/add.dart';
import 'package:twitter_clone/screens/main/profile/profile.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    print(user);
    if (user == null) {
      //show auth system routes
      return SignUp(
        key: null,
      );
    }

    //show main system routes
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => const Home(),
      '/add': (context) => const Add(),
      '/profile': (context) => Profile()
    });
  }
}
