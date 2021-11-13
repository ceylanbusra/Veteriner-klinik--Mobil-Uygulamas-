import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:veterinary_project/Hastalar_admin.dart';
import 'package:veterinary_project/hesap_ayarlari.dart';
import 'package:veterinary_project/kullanicilar.dart';
import 'package:veterinary_project/randevular_Admin.dart';
//import 'package:veterinary_project/Components/drawer.dart';

class AdminAnasayfa extends StatefulWidget {
  AdminAnasayfa({Key key}) : super(key: key);

  @override
  _AdminAnasayfaState createState() => _AdminAnasayfaState();
}

class _AdminAnasayfaState extends State<AdminAnasayfa> {
  @override
  Widget build(BuildContext context) {
    List anasayfaListesi = [
      'Randevular',
      'Hastalar',
      'Kullanıcılar',
      'Profilim',
    ];
    List resimUrl = [
      'lib/Assets/Image/takvim.png',
      'lib/Assets/Image/kedi.png',
      'lib/Assets/Image/kullanicilar.png',
      'lib/Assets/Image/hesapAyari.png',
    ];

    Future<void> _signOut() async {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: _signOut, icon: Icon(Icons.logout))],
        title: Text(
          "Ana Sayfa",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 30,
                mainAxisSpacing: 60),
            itemCount: anasayfaListesi.length,
            itemBuilder: (BuildContext ctx, index) {
              return GestureDetector(
                onTap: () {
                  // ignore: unnecessary_statements
                  anasayfaListesi[index];
                  debugPrint("index degeri $index");
                  if (index == 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RandevularAdmin()));
                  } else if (index == 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HastalarAdmin()));
                  } else if (index == 2) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Kullanicilar()));
                  } else if (index == 3) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HesapAyarlari()));
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        anasayfaListesi[index].toString(),
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      Image.asset(resimUrl[index]),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(5)),
                ),
              );
            }),
      ),
    );
  }
}
