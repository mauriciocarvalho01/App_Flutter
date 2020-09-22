import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData{

  String category;
  String id;

  String title;
  String description;
  String icon;
  String check;

  List especificacao;
  List compativel;
  List images;
  List sizes;
  List ano;
  List montadora;

  ProductData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    title = snapshot.data["title"];
    description = snapshot.data["description"];
    compativel = snapshot.data["compativel"];
    images = snapshot.data["images"];
    sizes = snapshot.data["sizes"];
    icon = snapshot.data["icon"];
    montadora = snapshot.data["montadora"];
    especificacao = snapshot.data["especificacao"];
    ano = snapshot.data["ano"];
    check = snapshot.data["check"];
  }



}

