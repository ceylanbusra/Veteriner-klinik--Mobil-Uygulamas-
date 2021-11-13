import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:veterinary_project/anaSayfa_admin.dart';
import 'package:veterinary_project/main_home.dart';
//import 'package:veterinary_project/anaSayfa_admin.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String gelenId;
  var aa;
  var gelenYetki;
  @override
  Widget build(BuildContext context) {
                         TextEditingController t1 = TextEditingController();
    TextEditingController t2 = TextEditingController();
    var firebase = FirebaseFirestore.instance.collection('Kullanicilar');

    Future<void> girisYap() async {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: t1.text, password: t2.text)
          .then((value) {
        gelenId = value.user.uid.toString();
        print("gelen Id111" + gelenId);
      });
      print("gelen Id1  " + gelenId);
      firebase.doc(gelenId).get().then((value) {
        gelenYetki = value.data()['Yetki'];
        print("gelen Id:" + gelenYetki);
      });
      print("gelen Id11." + gelenYetki);
      if (gelenYetki == "Admin") {
        return Navigator.push(
            context, MaterialPageRoute(builder: (context) => AdminAnasayfa()));
      }
      if (gelenYetki == "Kullanici") {
        return Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainHomePage()));
      }
    }

    return (Container(
      transformAlignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.blue[50].withOpacity(0.6)),
      alignment: Alignment.center,
      child: Flexible(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageWidgeti(),
            eMailTextField(t1: t1),
            parolaTextField(t2: t2),
            girisYapButonu(context, girisYap),
          ],
        ),
      ),
    ));
  }

  Container girisYapButonu(BuildContext context, Future<void> girisYap()) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height * 0.07,
      child: ElevatedButton(
        onPressed: girisYap,
        child: Text("Giriş yap"),
      ),
    );
  }
}

// ignore: camel_case_types
class parolaTextField extends StatelessWidget {
  const parolaTextField({
    Key key,
    @required this.t2,
  }) : super(key: key);

  final TextEditingController t2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height * 0.07,
      child: TextFormField(
        controller: t2,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Parola",
          hintStyle: TextStyle(),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class eMailTextField extends StatelessWidget {
  const eMailTextField({
    Key key,
    @required this.t1,
  }) : super(key: key);

  final TextEditingController t1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width * 0.87,
      height: MediaQuery.of(context).size.height * 0.07,
      child: TextFormField(
        controller: t1,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: "E-mail giriniz",
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}

class ImageWidgeti extends StatelessWidget {
  const ImageWidgeti({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.amber,
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Image(
        image: AssetImage("lib/Assets/Image/veterinary_logo.png"),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = ElevatedButton(
    child: Text("Tamam"),
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainHomePage()));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Başarılı"),
    content: Text("Evcil hayvan veri tabanına eklendi."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
