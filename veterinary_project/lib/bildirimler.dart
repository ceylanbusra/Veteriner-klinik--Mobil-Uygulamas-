import 'package:flutter/material.dart';
import 'package:veterinary_project/anaSayfa_admin.dart';

class Bildirimler extends StatefulWidget {
  Bildirimler({Key key}) : super(key: key);

  @override
  _BildirimlerState createState() => _BildirimlerState();
}

class _BildirimlerState extends State<Bildirimler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bildirimler"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "Burası şimdilik Yönetici ekranlarına gitmek için kullanılan bir ekrandır."),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AdminAnasayfa()));
                },
                child: Container(
                  width: 200,
                  height: 50,
                  color: Colors.blue,
                  child: Text("Admin Paneline gitmek için bas"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
