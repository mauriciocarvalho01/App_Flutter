import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expeximportadora/models/user_model.dart';
import 'package:expeximportadora/screens/login.dart';
import 'package:expeximportadora/tiles/drawer_tile.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CustomDrawer extends StatelessWidget {

    final PageController pageController;

    CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {

    Widget _buildDrawerBack() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255,203,236,241),
            Colors.white
          ],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
        ),
      ),
    );
    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child:
                      Container(
                        child: CircleAvatar(
                          radius: 40.0,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage("https://expex.com.br/wp-content/uploads/2020/06/Sem-Título-1.png"),
                      ),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: ScopedModelDescendant <UserModel>(
                          builder: (context, child, model){
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Olá, ${!model.isLoggedIn() ? "" : model.userData["name"].split(" ")[0]}",
                                    style: TextStyle(fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 5.0,),
                                  GestureDetector(
                                    child: Text(
                                      !model.isLoggedIn() ?
                                           "Entre ou cadastre-se >" :
                                           "Sair",
                                        style: TextStyle(
                                            color: Theme.of(context).primaryColor,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                        )
                                    ),
                                    onTap: (){
                                      if(!model.isLoggedIn())
                                        Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) => LoginScreen()),
                                        );
                                      else
                                        model.signOut();
                                    },
                                  )
                                ]
                            );
                          },
                      ),
                    ),
                  ]
                )
              ),
              Divider(),
              DrawerTile(Icons.home, "Inicio", pageController, 0),
              DrawerTile(Icons.list, "Produtos", pageController, 1),
              DrawerTile(Icons.location_on, "Vendedores", pageController, 2),
            ]
          )
        ],
      ),
    );
  }
}


/*FutureBuilder<QuerySnapshot>(
future: Firestore.instance
    .collection("home").orderBy("pos").getDocuments(),
builder: (context, snapshot){
if(!snapshot.hasData)
return SliverToBoxAdapter(
child: Container(
height: 200.0,
alignment: Alignment.center,
child: CircularProgressIndicator(
valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
),
),
);
else return SliverStaggeredGrid.count(
crossAxisCount: 2,
mainAxisSpacing: 12.0,
crossAxisSpacing: 12.0,

staggeredTiles: snapshot.data.documents.map(
(doc){
return StaggeredTile.count(doc.data["x"], doc.data["y"]);
}
).toList(),
children: snapshot.data.documents.map(
(doc){
return FadeInImage.memoryNetwork(
placeholder: kTransparentImage,
image: doc.data["image"],
fit: BoxFit.cover,
);
}
).toList(),
);
},
),*/
