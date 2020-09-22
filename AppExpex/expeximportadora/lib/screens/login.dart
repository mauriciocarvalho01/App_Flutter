import 'package:expeximportadora/models/user_model.dart';
import 'package:expeximportadora/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _emailController = TextEditingController();
  final _passController = TextEditingController();


  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldKey,
        appBar: AppBar(
          title: Text("Entrar"),
          centerTitle: true,
          actions: <Widget>[
            FlatButton(
              child: Text("Criar Conta",
                style: TextStyle(
                    fontSize: 15.0
                ),
              ),
              textColor: Colors.white,
              onPressed: (){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context)=> SignUpScreen()),
                );
              },
            ),
          ],
        ),
        body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model){
            if(model.isLoading) {
              return Center(
                  child: CircularProgressIndicator()
              );
            }else {
              return Form(
                key: _formKey,
                child: ListView(
                  padding: EdgeInsets.all(16.0),
                  children: <Widget>[
                    TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: "E-mail",
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (text) {
                          if (text.isEmpty || !text.contains("@")) {
                            return "Email inválido";
                          } else {
                            return null;
                          }
                        }
                    ),
                    SizedBox(height: 16.0,),
                    TextFormField(
                        controller: _passController,
                        decoration: InputDecoration(
                          hintText: "Senha",
                        ),
                        obscureText: true,
                        validator: (text) {
                          if (text.isEmpty || text.length < 6) {
                            return "Senha inválida";
                          } else {
                            return null;
                          }
                        }
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () {
                          if(_emailController.text.isEmpty)
                            _scaffoldKey.currentState.showSnackBar(
                                SnackBar(
                                  content: Text("Insira seu e-mail para recuperação!"),
                                  backgroundColor: Colors.redAccent,
                                  duration: Duration(seconds: 2),
                                )
                            );
                          else{
                            model.recoverPass(_emailController.text);
                            _scaffoldKey.currentState.showSnackBar(
                                SnackBar(

                                  content: Text("Confira seu e-mail!"),
                                  backgroundColor: Theme.of(context).primaryColor,
                                  duration: Duration(seconds: 2),
                                ),
                            );
                          }
                        },
                        child: Text("Esqueci a senha",
                          textAlign: TextAlign.right,
                        ),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    SizedBox(
                      height: 44.0,
                      child: RaisedButton(
                        child: Text("Entrar",
                          style: TextStyle(fontSize: 18.0),
                        ),
                        textColor: Colors.white,
                        color: Theme
                            .of(context)
                            .primaryColor,
                        elevation: 5.0,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {

                          }
                          model.signIn(
                              email:_emailController.text,
                              pass: _passController.text,
                              onSuccess: _onSuccess,
                              onFail: _onFail
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),

    );
  }

  void _onSuccess(){
    Navigator.of(context).pop();

  }

  void _onFail(){
    print("falhou");
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Falha ao entrar!"),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        )
    );

  }
}
