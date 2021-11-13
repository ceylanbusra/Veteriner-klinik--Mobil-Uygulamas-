import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AnimalsScreen extends StatefulWidget {
  @override
  _AnimalsScreenState createState() => _AnimalsScreenState();
}

class _AnimalsScreenState extends State<AnimalsScreen> {
  @override
  Widget build(BuildContext context) {
    var id = FirebaseAuth.instance.currentUser.uid;

    var hayvanId = FirebaseFirestore.instance
        .collection('Kullanicilar')
        .where('Uid', isEqualTo: id)
        .get();

    print('Gelen hayvan id neymiş bir bakalım. $hayvanId');
    print('Gelen hayvan id neymiş bir bakalım.' + hayvanId.toString());

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Hayvanlarım",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
          backgroundColor: Colors.blue,
        ),
        body: GetUserName(hayvanId.toString()));
  }
}

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('Hayvanlar');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Text("Full Name: ${data['Ad']} ${data['Cins']}");
        }

        return Text("loading");
      },
    );
  }
}
