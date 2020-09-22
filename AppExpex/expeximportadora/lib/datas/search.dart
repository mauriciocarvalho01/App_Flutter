import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService{
    SearchByName(String searchFild){
      return Firestore.instance.collection("produtos")
          .where('title',
            isEqualTo: searchFild.substring(0,1).toLowerCase())
          .getDocuments();
    }
}