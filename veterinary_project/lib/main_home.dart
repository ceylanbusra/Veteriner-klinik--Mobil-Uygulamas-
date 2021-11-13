// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:veterinary_project/Model/iletisim_ekrani.dart';

import 'package:veterinary_project/profilim.dart';
import 'package:veterinary_project/randecu_al2.dart';
import 'package:veterinary_project/randevu_al.dart';
import 'package:veterinary_project/tum_randevular.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List anasayfaListesi = [
      'Randevu Al',
      'Tüm Randevular',
      'Profilim',
      'İletişim',
    ];
    List resimUrlleri = [
      'lib/Assets/Image/randevuAl.png',
      'lib/Assets/Image/takvim.png',
      'lib/Assets/Image/profile.png',
      'lib/Assets/Image/megaphone.png',
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
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.blue,
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RandevuAl2()));
                  } else if (index == 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TumRandevular()));
                  } else if (index == 2) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profilim()));
                  } else if (index == 3) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IletisimEkrani()));
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        anasayfaListesi[index].toString(),
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      Image.asset(resimUrlleri[index]),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                ),
              );
            }),
      ),
    );
  }
}
