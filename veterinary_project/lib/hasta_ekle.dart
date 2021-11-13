import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:veterinary_project/anaSayfa_admin.dart';

class HastaEkle extends StatefulWidget {
  final String Uidd;

  const HastaEkle({Key key, @required this.Uidd}) : super(key: key);
  get async {
    return this.Uidd;
  }

  @override
  _HastaEkleState createState() => _HastaEkleState();
}

class _HastaEkleState extends State<HastaEkle> {
  var girilenAd = "";
  var girilenCins = "";
  var girilenYas;
  var girilenCinsiyet = "";

  Future<void> kayitOl() {
    FirebaseFirestore.instance.collection('Hayvanlar').doc().set({
      'Ad': girilenAd,
      'Cins': girilenCins,
      'Yas': girilenYas,
      'Cinsiyet': girilenCinsiyet,
      'SahipUid': widget.Uidd,
    }).whenComplete(() => showAlertDialog(context));
    print("gelen uid " + widget.Uidd);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hasta Ekle"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(height: 30),
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
                      onChanged: (value) {
                        setState(() {
                          girilenAd = value;
                        });
                      },
                      textInputAction: TextInputAction.done,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: "Hayvanın Adı ",
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
                      onChanged: (value) {
                        setState(() {
                          girilenCins = value;
                        });
                      },
                      textInputAction: TextInputAction.done,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: "Cinsi ",
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
                      onChanged: (value) {
                        setState(() {
                          girilenCinsiyet = value;
                        });
                      },
                      textInputAction: TextInputAction.done,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: "Cinsiyeti ",
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
                      onChanged: (value) {
                        setState(() {
                          girilenYas = value;
                        });
                      },
                      textInputAction: TextInputAction.done,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: "Yaşı ",
                        hintStyle: TextStyle(),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: ElevatedButton(
                      onPressed: kayitOl,
                      child: Text("Kaydet"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = ElevatedButton(
      child: Text("Tamam"),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AdminAnasayfa()));
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
}
