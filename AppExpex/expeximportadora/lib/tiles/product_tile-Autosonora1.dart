import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expeximportadora/datas/product_data.dart';
import 'package:expeximportadora/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class ProductTile extends StatelessWidget {
  final String type;
  final ProductData product;

  ProductTile(this.type, this.product);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ProductScreen(product)));
        },
        child: Card(
            color: type == "grid" ? null : Color.fromARGB(255, 224, 255, 255),
            child: type == "grid"
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                        AspectRatio(
                            aspectRatio: 0.8,
                            child: Image.network(
                              product.images[0],
                              fit: BoxFit.cover,
                            )),
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255,135,206,250),
                                      Color.fromARGB(100,135,206,235)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                    Divider(),
                                    Text("${product.title}",
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold))
                                  ],
                                )))
                      ])
                : Row(
                    children: <Widget>[
                      Flexible(
                        flex: 8,
                        child: Container(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 25.0,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: NetworkImage(product.icon),
                                  ),
                                  title: Text(product.montadora[0]),
                                  subtitle: Text(product.title),
                                  trailing: Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                    size: 30.0,
                                  ),
                                ),
                                Divider(),
                                SizedBox(
                                  height: 40,
                                  child: GridView(
                                    scrollDirection: Axis.horizontal,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 4.0),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      mainAxisSpacing: 8.0,
                                      childAspectRatio: 0.15,
                                    ),
                                    children: product.compativel.map((s) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                    220, 30, 144, 255),
                                                offset: Offset(1.0, 6.0),
                                                blurRadius: 40.0,
                                              ),
                                            ],
                                            color: Color.fromARGB(
                                                220, 175, 238, 238),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4.0)),
                                            border: Border.all(
                                                color: Color.fromARGB(
                                                    220, 175, 238, 238),
                                                width: 3.0)),
                                        width: 50.0,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Text(
                                          s,
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.grey[700]),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                Divider(),
                                SizedBox(
                                  height: 40.0,
                                  child: GridView(
                                    scrollDirection: Axis.horizontal,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 4.0),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      mainAxisSpacing: 8.0,
                                      childAspectRatio: 0.5,
                                    ),
                                    children: product.sizes.map((s) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 30, 144, 255),
                                                offset: Offset(1.0, 6.0),
                                                blurRadius: 40.0,
                                              ),
                                            ],
                                            color: Color.fromARGB(
                                                255, 175, 238, 238),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4.0)),
                                            border: Border.all(
                                                color: Color.fromARGB(
                                                    220, 175, 238, 238),
                                                width: 3.0)),
                                        width: 50.0,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Text(
                                          s,
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.grey[700]),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            )),
                      )
                    ],
                  )));
  }
}

/*Wrap(
                                spacing: 10.0,
                                children: <Widget>[
                                  Chip(
                                    avatar: CircleAvatar(
                                      backgroundColor: Colors.grey.shade800,
                                      child: Text(product.title[0]),
                                    ),
                                    label: Text(product.title)
                                  ),
                                  Chip(
                                    avatar: CircleAvatar(
                                      backgroundColor: Colors.grey.shade800,
                                      child: Text(product.sizes[0]),
                                    ),
                                    label: product.sizes[0] == "CH" ? Text("Chinês") : "",
                                  ),
                                  Chip(
                                    avatar: CircleAvatar(
                                      backgroundColor: Colors.grey.shade800,
                                      child: Text(product.sizes[2][0]),
                                    ),
                                    label: Text(product.sizes[2]),
                                  ),
                                ],
                              ),*/
