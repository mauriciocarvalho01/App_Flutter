import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceTile extends StatelessWidget {

  final DocumentSnapshot snapshot;

  PlaceTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            child: SizedBox(
              height: 120.0,
              child: Image.network(
                snapshot.data["image"],
                fit: BoxFit.fill,
              ),
            ),
            ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  snapshot.data["name"],
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0
                  ),
                ),
                Text(
                  snapshot.data["setor"],
                  textAlign: TextAlign.start,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
                FlatButton(
                   child: Row(
                     mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                         Text("Ver no Mapa"),
                         Icon(Icons.map, color: Theme.of(context).primaryColor,),
                       ],
                   ),
                   textColor: Colors.blue,
                   padding: EdgeInsets.zero,
                   onPressed: (){
                     launch("https://www.google.com/maps/place/Expex+Importadora/@-23.6304813,-46.5459639,21z/data=!4m5!3m4!1s0x0:0x66b1dbe8f484adab!8m2!3d-23.6304166!4d-46.5458951");
                   },
                 ),
              FlatButton(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text("Ligar"),
                      Icon(Icons.phone_android),
                    ],
                  ),
                textColor: Colors.blue,
                padding: EdgeInsets.zero,
                onPressed: (){
                  launch("tel:${snapshot.data["phone"]}");
                },
              ),
              FlatButton(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text("Whatsapp"),
                    Tab(
                      icon: Container(
                        child: Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/expex-importadora-eada4.appspot.com/o/icones%2Fwhatsapp-icone-7.png?alt=media&token=0c5e5b97-dbea-41f9-8547-7e823b1755dd',
                          ),
                        margin: EdgeInsets.all(3),
                        height: 30,
                        width: 30,
                      ),
                    )
                  ],
                ),
                textColor: Colors.blue,
                padding: EdgeInsets.zero,
                onPressed: (){
                  launch("${snapshot.data["whatsapp"]}");
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
