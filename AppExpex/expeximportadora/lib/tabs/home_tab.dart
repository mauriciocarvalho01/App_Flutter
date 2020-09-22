import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expeximportadora/datas/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final PageController ctrl = PageController();

  var queryResultSet = [];
  var tempSearchData = [];

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchData = [];
      });
    }
    var captitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1) {
      SearchService().SearchByName(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; i++) {
          queryResultSet.add(docs.documents[i].data);
        }
      });
    } else {
      tempSearchData = [];
      queryResultSet.forEach((element) {
        if (element['title'].startsWith(captitalizedValue)) {
          setState(() {
            tempSearchData.add(element);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
          child:
              new Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            new FadeInImage.memoryNetwork(
              fadeInCurve: Curves.bounceInOut,
              fadeInDuration: const Duration(seconds: 1),
              placeholder: kTransparentImage,
              image:
                  'https://firebasestorage.googleapis.com/v0/b/expex-importadora-eada4.appspot.com/o/home%2FServices_Importation.jpg?alt=media&token=b06197a4-a21b-4001-9d2c-01b603160a9eflutter build appbundle',
              fit: BoxFit.cover,
            ),
          ]),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(63, 30, 144, 255),
                Color.fromARGB(255, 135, 206, 235)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        );
    return Stack(

      children: <Widget>[
        _buildBodyBack(),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Novidades'),
                centerTitle: true,
              ),
            ),
            /*código certo começa aqui*/
            FutureBuilder<QuerySnapshot>(
              future: Firestore.instance
                  .collection("home")
                  .orderBy("pos")
                  .getDocuments(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200.0,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  );
                else
                  return SliverStaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3,
                    staggeredTiles: snapshot.data.documents.map((doc) {
                      return StaggeredTile.count(doc.data["x"], doc.data["y"]);
                    }).toList(),
                    children: snapshot.data.documents.map((doc) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(10, 30, 144, 255),
                              Color.fromARGB(73, 135, 206, 235)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Container(
                                child: ClipRRect(
                                  clipBehavior: Clip.antiAlias,
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: GestureDetector(
                                    onTap: () => {
                                      if (doc.data["cod"].toString() ==  "www.expex.com.br"){
                                        launch('https://www.expex.com.br/'),
                                      }else{
                                        launch("https://expex.com.br/?product=${doc.data["cod"]}")
                                      }
                                    },
                                    child: FadeInImage.memoryNetwork(
                                      fadeInDuration:
                                          const Duration(seconds: 1),
                                      placeholder: kTransparentImage,
                                      image: doc.data["image"],
                                      height: double.infinity,
                                      width: double.infinity,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: 1.0,
                                child: GestureDetector(
                                  onTap: () => {
                                    if (doc.data["cod"].toString() ==  "www.expex.com.br"){
                                      launch("http://www.expex.com.br/"),
                                    }else{
                                        launch("http://expex.com.br/?product=${doc.data["cod"]}"),
                                    }
                                  },
                                  child: Chip(
                                      avatar: CircleAvatar(
                                        backgroundColor: Colors.grey.shade800,
                                        child: Text(
                                          doc.data["cod"][0].toString(),
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      label: Text(
                                        doc.data["cod"].toString(),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      backgroundColor:
                                      Color.fromARGB(240, 135, 206, 235),
                                    ),

                                )
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  );
              },
            ),

          ],
        ),
      ],

    );

  }

}
