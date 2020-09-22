import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expeximportadora/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CategoryTile extends StatelessWidget {

  final DocumentSnapshot snapshot;

  CategoryTile(this.snapshot);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
   child: ListTile(
        leading: CircleAvatar(
          radius: 25.0,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(snapshot.data["icon"]),
        ),
      title: Text(snapshot.data["title"]),
      trailing: Icon(Icons.keyboard_arrow_right),


    ),
        onTap: () => launch(snapshot.data["search"])
    );
  }
}
