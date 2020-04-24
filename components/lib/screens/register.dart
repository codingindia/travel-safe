import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController fullNameInputController;
  TextEditingController emailInputController;
  TextEditingController phNoInputController;
  TextEditingController pwdInputController;
  TextEditingController confirmPwdInputController;

  @override
  void initState() {
    fullNameInputController = new TextEditingController();
    phNoInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    confirmPwdInputController = new TextEditingController();
    super.initState();
  }

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
              // Full Name TextFormField
              TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                  hintText: 'Enter your full name',
                  labelText: 'Full Name',
                ),
                controller: fullNameInputController,
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
                  icon: const Icon(
                    Icons.mail,
                    color: Colors.blue,
                  ),
                  hintText: 'Enter your E-mail id',
                  labelText: 'E-mail',
                ),
                controller: emailInputController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'This field is compulsory.';
                  }
                  return null;
                },
              ),

              // Phone no TextFormField
              TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.phone,
                    color: Colors.blue,
                  ),
                  hintText: 'Enter your phone number',
                  labelText: 'Phone',
                ),
                controller: phNoInputController,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'This field is compulsory.';
                  }
                  return null;
                },
              ),

              // Password TextFormField
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Enter chosen password',
                  labelText: 'Password',
                ),
                controller: pwdInputController,
                inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                validator: (value) {
                  if (value.isEmpty) {
                    return 'This field is compulsory.';
                  }
                  return null;
                },
              ),

              // Re Password TextFormField
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Re enter chosen password',
                  labelText: 'Re enter Password',
                ),
                controller: confirmPwdInputController,
                inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                validator: (value) {
                  if (value.isEmpty) {
                    return 'This field is compulsory.';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30,
              ),
              Builder(
                builder: (context) => RaisedButton(
                    elevation: 10,
                    child: Text(
                      "Register",
                      style: TextStyle(fontSize: 20),
                    ),
                    padding: const EdgeInsets.all(14),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        if (pwdInputController.text ==
                            confirmPwdInputController.text) {
                        } else {
                          // If 2 password field not matched
                        }
                      }
                    }),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ));
  }
}
