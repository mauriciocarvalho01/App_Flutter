import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
    
    
    class Search_Product extends StatelessWidget {


      final myController = TextEditingController();

      @override
      Widget build(BuildContext context) {
        return Dialog(
         child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                      title: TextField(
                        controller: myController,
                        decoration: InputDecoration(
                            hintText: 'Digite o código auxiliar'
                        ),
                        textCapitalization: TextCapitalization.characters,
                      )
                  ),
                  GestureDetector(
                    child: Chip(
                      avatar: CircleAvatar(
                        backgroundColor: Colors.grey.shade800,
                        child: Text(
                          'Ok',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      label: Text(
                        '>>>>',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor:
                      Color.fromARGB(240, 135, 206, 235),
                    ),
                    onTap: (){
                        if(myController.text !=  null){
                         return  launch("https://expex.com.br/?s=${myController.text}");
                        }else{
                       String todos = 'Todos os produtos';
                          myController.text = todos;
                          return launch("https://expex.com.br/?s=${todos}");
                        }
                    },
                  ),
                  Divider(height: 18,)
                ],

              ),
          )
        );
      }
    }
    