import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class Profilim extends StatefulWidget {
  @override
  _ProfilimState createState() => _ProfilimState();
}

@override
class _ProfilimState extends State<Profilim> {
  var ad = "", soyad = "", email = "", telNo;
  @override
  @override
  void initState() {
    var id = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore.instance
        .collection('Kullanicilar')
        .doc(id)
        .get()
        .then((value) {
      setState(() {
        ad = value.data()['Ad'];
        soyad = value.data()['Soyad'];
        email = value.data()['Email'];
        telNo = value.data()['TelNo'];
        print(
            "gelen ad: $ad, gelen soyad: $soyad,gelen email: $email,gelen numara $telNo");
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profilim",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                color: Colors.blue[50],
              ),
              child: Text(ad),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                color: Colors.blue[50],
              ),
              child: Text(soyad),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                color: Colors.blue[50],
              ),
              child: Text(email),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                color: Colors.blue[50],
              ),
              child: Text(telNo.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
