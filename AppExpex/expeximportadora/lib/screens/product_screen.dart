import 'package:carousel_pro/carousel_pro.dart';
import 'package:expeximportadora/datas/product_data.dart';
import 'package:expeximportadora/tabs/products_tab.dart';
import 'package:expeximportadora/widgets/custom_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {

  final ProductData product;

  ProductScreen(this.product);




  @override
  _ProductScreenState createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {

  String sizes;

  final ProductData product;
  _ProductScreenState(this.product);

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {

    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
      ),
      body: Container(
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
        child: ListView(
          children: <Widget>[
            AspectRatio(
                aspectRatio: 0.9,
                child: Carousel(
                  images: product.images.map((url){
                    return Container(
                      height: 155,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        // color: Colors.blue,
                        image: DecorationImage(
                            image: NetworkImage(
                              url
                            ),
                            fit: BoxFit.fill,
                            repeat: ImageRepeat.noRepeat),

                      ),
                    );
                  }
                  ).toList(),
                  dotSize: 8.0,
                  dotSpacing: 8.0,
                  dotColor: Color.fromARGB(255,30,144,255),
                  dotBgColor: Colors.transparent,
                  autoplay: true,
                )
            ),
            Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 16.0,),
                    SizedBox(
                      height: 44,
                      child: RaisedButton(
                        onPressed: (){

                        },
                        child: Text("Contatar um vendedor",
                          style: TextStyle(fontSize: 18.0),
                        ),
                        color: primaryColor,
                        textColor: Colors.white,
                          elevation:5.0,
                        splashColor: Color.fromARGB(236, 0,191,255)
                      ),
                    ),
                    SizedBox(height: 16.0,),
                    Divider(),
                    Text(
                        "Montadora",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(220,25,25,112),
                        )
                    ),
                    SizedBox(height: 5.0,),
                    SizedBox(
                      height: 34.0,
                      child: GridView(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 8.0,
                            childAspectRatio: 0.15
                        ),
                        children: product.montadora.map(
                                (s){
                              return GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      sizes = s;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: Color.fromARGB(255,30,144,255),
                                            offset: Offset(1.0, 6.0),
                                            blurRadius: 40.0,
                                          ),
                                        ] ,
                                        color: Color.fromARGB(220,175,238,238),
                                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                        border: Border.all(
                                            color: Color.fromARGB(220,175,238,238),
                                            width: 3.0
                                        )
                                    ),
                                    width: 50.0,
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
                                    child: Text(s, style: TextStyle(fontSize: 16.0, color: Colors.grey[700] ),),
                                  )
                              );
                            }
                        ).toList(),
                      ),
                    ),
                    SizedBox(height: 16.0,),
                    Divider(),
                    Text(
                        "Modelo",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(220,25,25,112),
                        )
                    ),
                    SizedBox(height: 5.0,),
                    SizedBox(
                      height: 34.0,
                      child: GridView(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 8.0,
                            childAspectRatio: 0.5
                        ),
                        children: product.sizes.map(
                                (s){
                              return GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      sizes = s;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: Color.fromARGB(255,30,144,255),
                                            offset: Offset(1.0, 6.0),
                                            blurRadius: 40.0,
                                          ),
                                        ] ,
                                        color: Color.fromARGB(220,175,238,238),
                                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                        border: Border.all(
                                            color: Color.fromARGB(220,175,238,238),
                                            width: 3.0
                                        )
                                    ),
                                    width: 50.0,
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
                                    child: Text(s, style: TextStyle(fontSize: 16.0, color: Colors.grey[700] ),),
                                  )
                              );
                            }
                        ).toList(),
                      ),
                    ),
                    SizedBox(height: 16.0,),
                    Divider(),
                    Text(
                        "Aplicação",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(220,25,25,112),
                        )
                    ),
                    SizedBox(height: 5.0,),
                    SizedBox(
                      height: 34.0,
                      child: GridView(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 8.0,
                            childAspectRatio: 0.5
                        ),
                        children: product.ano.map(
                                (s){
                              return GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      sizes = s;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: Color.fromARGB(255,30,144,255),
                                            offset: Offset(1.0, 6.0),
                                            blurRadius: 40.0,
                                          ),
                                        ] ,
                                        color: Color.fromARGB(220,175,238,238),
                                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                        border: Border.all(
                                            color: Color.fromARGB(220,175,238,238),
                                            width: 3.0
                                        )
                                    ),
                                    width: 50.0,
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
                                    child: Text(s, style: TextStyle(fontSize: 16.0, color: Colors.grey[700] ),),
                                  )
                              );

                            }
                        ).toList(),
                      ),
                    ),
                    SizedBox(height: 5.0,),
                    SizedBox(height: 16.0,),
                    Divider(),
                    Text(
                        "Especificação das medidas",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(220,25,25,112),
                        )
                    ),
                    SizedBox(height: 5.0,),
                    SizedBox(
                      height: 40.0,
                      child: GridView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 8.0,
                          childAspectRatio: 0.4,
                        ),
                        children: product.especificacao.map(
                                (s){
                              return Container(
                                decoration: BoxDecoration(
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Color.fromARGB(255,30,144,255),
                                        offset: Offset(1.0, 6.0),
                                        blurRadius: 40.0,
                                      ),
                                    ] ,
                                    color: Color.fromARGB(255,175,238,238),
                                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                    border: Border.all(
                                        color: Color.fromARGB(220,175,238,238),
                                        width: 3.0
                                    )
                                ),
                                width: 50.0,
                                alignment: Alignment.center,
                                margin: EdgeInsets.fromLTRB(3, 0, 0, 0),
                                child: Text(s, style: TextStyle(fontSize: 16.0, color: Colors.grey[700] ),),
                              );
                            }
                        ).toList(),
                      ),
                    ),
                    SizedBox(height: 16.0,),
                    Divider(),
                    Text(
                        "Especificação Técnica",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(220,25,25,112),
                        )
                    ),
                    SizedBox(height: 5.0,),
                    Text(
                      product.description,
                      style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
                    ),
                    SizedBox(height: 16.0,),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
