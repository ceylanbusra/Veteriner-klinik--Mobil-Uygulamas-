import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:veterinary_project/Model/iletisim_ekrani.dart';
import 'package:veterinary_project/animals_screen.dart';
//import 'package:veterinary_project/animals_screen.dart';
import 'package:veterinary_project/login_screen.dart';
import 'package:veterinary_project/main_home.dart';
import 'package:veterinary_project/profilim.dart';

//import 'Home_page.dart';
void main() async {
  // These two lines
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/LoginScreen': (context) => LoginScreen(),
        // '/animalsScreen': (context) => AnimalsScreen(),

        '/MainHomePageScreen': (context) => MainHomePage(),
        '/ProfilimEkrani': (context) => Profilim(),
        '/IletisimEkrani': (context) => IletisimEkrani(),
        '/AnimalsScreen': (context) => AnimalsScreen(),
      },
      theme: ThemeData(primarySwatch: Colors.blue, textTheme: TextTheme()),
      home: Govde(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Govde extends StatefulWidget {
  @override
  _GovdeState createState() => _GovdeState();
}

class _GovdeState extends State<Govde> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginScreen(),
    );
  }
}
