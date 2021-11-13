import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:veterinary_project/hasta_ekle.dart';

class KullaniciEkle extends StatefulWidget {
  const KullaniciEkle({Key key}) : super(key: key);

  @override
  _KullaniciEkleState createState() => _KullaniciEkleState();
}

class _KullaniciEkleState extends State<KullaniciEkle> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  TextEditingController t4 = TextEditingController();
  TextEditingController t5 = TextEditingController();
  TextEditingController t6 = TextEditingController();

  // String uid;

  Future<void> kayitOl() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: t4.text, password: t5.text)
        .then((kullanici) {
      FirebaseFirestore.instance
          .collection("Kullanicilar")
          .doc(kullanici.user.uid)
          .set({
        // uid: kullanici.user.uid,
        'Ad': t1.text,
        'Soyad': t2.text,
        'TelNo': t3.text,
        'Email': t4.text,
        'Sifre': t5.text,
        'Yetki': t6.text,
        'Uid': kullanici.user.uid.toString(),
      }).whenComplete(() => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HastaEkle(
                        Uidd: kullanici.user.uid,
                      ))));
    }).whenComplete(
            () => AlertDialog(title: Text("Kullanıcı başarıyla eklendi")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.075,
            child: TextFormField(
              controller: t1,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              obscureText: false,
              decoration: InputDecoration(
                hintText: "Ad ",
                hintStyle: TextStyle(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.075,
            child: TextFormField(
              controller: t2,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              obscureText: false,
              decoration: InputDecoration(
                hintText: "Soyad ",
                hintStyle: TextStyle(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.075,
            child: TextFormField(
              controller: t3,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              obscureText: false,
              decoration: InputDecoration(
                hintText: "Tel No ",
                hintStyle: TextStyle(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.075,
            child: TextFormField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              obscureText: false,
              controller: t4,
              decoration: InputDecoration(
                hintText: "E Mail ",
                hintStyle: TextStyle(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.075,
            child: TextFormField(
              controller: t5,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Şifre ",
                hintStyle: TextStyle(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.075,
            child: TextFormField(
              controller: t6,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              obscureText: false,
              decoration: InputDecoration(
                hintText: "Yetkiyi   'Kullanici' veya 'Admin' olarak giriniz ",
                hintStyle: TextStyle(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.07,
            child: ElevatedButton(
              onPressed: kayitOl,
              child: Text("Kaydet"),
            ),
          )
        ],
      ),
    )));
  }
}
