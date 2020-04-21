import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Form(
        key: _formKey,
        autovalidate: true,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.phone,color: Colors.blue,),
                labelText: "Phone number",
                hintText: "Enter your phone number",
              ),
              inputFormatters: [new LengthLimitingTextInputFormatter(10)],
              keyboardType: TextInputType.phone,
              validator: (value){
                if(value.isEmpty){
                  return "This field is compulsory.";
                }
                else{
                  return null;
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter password",
              ),
              obscureText: true,
              inputFormatters: [new LengthLimitingTextInputFormatter(30)],
              validator: (value){
                if(value.isEmpty){
                  return "This field is compulsory.";
                }
                else{
                  return null;
                }
              },
            ),
            SizedBox(height: 30,),
            Builder(builder: 
              (context) => RaisedButton(
                elevation: 10,
                child: Text("Login",style: TextStyle(fontSize: 20),),
                color: Colors.blue,
                textColor: Colors.white,
                padding: const EdgeInsets.all(14),
                onPressed: (){
                  if(_formKey.currentState.validate()){
                    Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("Successfully logged in!"),),
                    );
                  }
                }
              )
            ),
            SizedBox(height: 60,)
          ],
        ),
      ),
    );
  }
}