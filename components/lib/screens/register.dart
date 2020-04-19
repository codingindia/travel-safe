import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gender_selection/gender_selection.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
      ),
      body: Form(
        key: _formKey,
        autovalidate: true,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.person,color: Colors.blue,),
                hintText: 'Enter your full name',
                labelText: 'Full Name',
              ),
            inputFormatters: [new LengthLimitingTextInputFormatter(30)],
            validator: (value) {
                  if (value.isEmpty) {
                    return 'This field is compulsory.';
                  }
                  return null;
                },
            
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.phone,color: Colors.blue,),
                hintText: 'Enter your phone number',
                labelText: 'Phone',

              ),
              keyboardType: TextInputType.phone,
                validator: (value) {
                if (value.isEmpty) {
                  return 'This field is compulsory.';
                }
                return null;
              },
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Enter chosen password',
                labelText: 'Password',
              ),
            inputFormatters: [new LengthLimitingTextInputFormatter(30)],
              validator: (value) {
                if (value.isEmpty) {
                  return 'This field is compulsory.';
                }
                return null;
              },
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Re enter chosen password',
                labelText: 'Re enter Password',
              ),
            inputFormatters: [new LengthLimitingTextInputFormatter(30)],
            validator: (value) {
                  if (value.isEmpty) {
                    return 'This field is compulsory.';
                  }
                  return null;
                },
            ), 
            SizedBox(height: 30,),
            Builder(
              builder: (context) => RaisedButton(
              elevation: 10,
              child: Text("Register",style: TextStyle(fontSize: 20),),
              padding: const EdgeInsets.all(14),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                if(_formKey.currentState.validate()){
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Form Submitted!"),
                    ),
                    );
                }
              }
            ),),
            SizedBox(height: 60,),
          ],
        ),
      )
    );
  }
}