import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

//KULLANMADIĞIM SAYFA

class Hastalar extends StatelessWidget {
  const Hastalar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hastalar"),
        ),
        body: UserInformation());
  }
}

class UserInformation extends StatefulWidget {
  UserInformation({Key key}) : super(key: key);

  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  var firebase = FirebaseFirestore.instance.collection('Kullanicilar');

  final Stream<QuerySnapshot<Map<String, dynamic>>> _usersStream =
      FirebaseFirestore.instance
          .collection('Kullanicilar')
          .doc()
          .collection('Hayvanlar')
          .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: _usersStream,
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return new ListView(
          children: snapshot.data.docs
              .map((DocumentSnapshot<Map<String, dynamic>> document) {
            return new ListTile(
              title: new Text(document.data()['ad']),
              subtitle: new Text(document.data()['cins']),
            );
          }).toList(),
        );
      },
    );
  }
}

/*
class GetUserName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    var users2 = FirebaseFirestore.instance
        .collection('Kullanicilar')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        var uidd = doc['Uid'];
        print(doc['Uid']);
        CollectionReference users = FirebaseFirestore.instance
            .collection('Kullanicilar')
            .doc(uidd)
            .collection('Hayvanlar');
        return FutureBuilder<DocumentSnapshot>(
          future: users.doc(uidd).get(),
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
              return Text("Full Name: ${data['ad']} ${data['cins']}");
            }

            return Text("loading");
          },
        );
      });
    });
    print("uidler nelermiş bakalım " + users2.toString());
    return Text("loading");
  }
}

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  @override
  Widget build(BuildContext context) {
    // var id = FirebaseAuth.instance.currentUser.uid;

    var users2 = FirebaseFirestore.instance
        .collection('Kullanicilar')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc['Uid']);
      });
    });
    print("uidler nelermiş bakalım " + users2.toString());
    CollectionReference<Map<String, dynamic>> users = FirebaseFirestore.instance
        .collection('Kullanicilar')
        .doc(users2.toString())
        .collection('Hayvanlar');

    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: users.snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data.docs
              .map((DocumentSnapshot<Map<String, dynamic>> document) {
            return Card(
                color: Colors.lightBlue,
                elevation: 4,
                child: Container(
                  height: 150,
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Hayvanın adi: " + document.data()['ad'],
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Text(
                        "Cins: " + document.data()['cins'],
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.blueGrey),
                      ),
                      Text(
                        "Cinsiyet: " + document.data()['cinsiyet'],
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ));
          }).toList(),
        );
      },
    );
  }
}
*/
