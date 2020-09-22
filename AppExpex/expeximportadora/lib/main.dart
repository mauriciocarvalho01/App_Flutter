import 'package:expeximportadora/models/user_model.dart';
import 'package:expeximportadora/screens/home_screen.dart';
import 'package:expeximportadora/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Color.fromARGB(255, 30,144,255),
          ),
          debugShowCheckedModeBanner: false,
          home: HomeScreen()
      ),
    );
  }
}


