
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expeximportadora/tabs/places_tab.dart';
import 'package:expeximportadora/widgets/search_product_dialog.dart';
import 'package:flutter/material.dart';
import 'package:expeximportadora/tabs/home_tab.dart';
import 'package:expeximportadora/tabs/products_tab.dart';
import 'package:expeximportadora/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          drawer: CustomDrawer(_pageController),
          body: HomeTab(),
        floatingActionButton: GestureDetector(
          child: FloatingActionButton.extended(
            onPressed: (){
              showDialog(context: context,
                  builder: (context) => Search_Product()
              );
            },
            label: Text('Procurar'),
            icon: Icon(Icons.search),
            backgroundColor: Colors.blue,
          ),
        )
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Produtos"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: ProductsTab(),
         // floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Vendedores"),
            centerTitle: true,
          ),
          body: PlacesTab(),
          drawer: CustomDrawer(_pageController),
        ),
      ],
    );
  }
}
