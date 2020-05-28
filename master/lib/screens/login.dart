import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';


class LoginPage extends StatefulWidget {

    @override
    _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool _rememberme=false;

  Widget _displaylogo(){
      return Container(
            
            //padding: EdgeInsets.all(150),
            alignment: Alignment.center,
            height: 190,
            width: 190,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                alignment: Alignment.topCenter,
                fit: BoxFit.fill, 
                image: AssetImage("assets/images/travelsafelogo.png")),
            ),
          );
  }

  Widget _displayPhoneInputField(){
    return Theme(
      data: ThemeData(
        primaryColor: Colors.white
      ),
      child: TextFormField(
              style: TextStyle(
    
                color: Colors.white
              ),
              decoration: InputDecoration(
                labelText: "Phone number",
                hintText: "Enter your phone number",
                labelStyle: TextStyle(
                  color: Colors.white
                ),
                hintStyle: TextStyle(
                  color: Colors.white
                ),
                errorStyle: TextStyle(
                  color: Colors.white
                )
                
                ),
              
              cursorColor: Colors.white,
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
            ));
  }

  Widget _displayPasswordField(){
    return Theme(
      data: ThemeData(
        primaryColor: Colors.white
      ),
      
      child: TextFormField(
      style: TextStyle(
                color: Colors.white
              ),
              
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter password",
                labelStyle: TextStyle(
                  color: Colors.white
                ),
                hintStyle: TextStyle(
                  color: Colors.white
                ),
                errorStyle: TextStyle(
                  color: Colors.white
                )
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
            )
    );
  }

  Widget _displayLoginSubmitButton(BuildContext context){
    return Builder(
              builder: 
              (context) => RaisedButton(
                
                elevation: 10,
                child: Text("Login",style: TextStyle(fontSize: 20),),
                color: Colors.white,
                textColor: Colors.indigo,
                padding: const EdgeInsets.all(10),
                onPressed: (){
                  if(_formKey.currentState.validate()){
                    Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("Successfully logged in!"),),
                    );
                  }
                }
              )
            );
  }

  Widget _displaySignUpRedirect(){
    return Container(
              
              child: Row(children: <Widget>[
                Text("Don't have an account?"),
                FlatButton(textColor: Colors.black,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 20,color: Colors.white),
                  ), onPressed: () {print("Redirect to Register!");},),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            )
            );
  }

  Widget _displayRememberMe(){
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(
              unselectedWidgetColor:  Colors.white
            ),
            child: Checkbox(
              value:_rememberme,
              checkColor: Colors.white,
              activeColor: Colors.black,
              onChanged: (value){
                setState(() {
                  _rememberme=value;
                });
              }
          ),
          ),
          Text("Remember Me",style: TextStyle(color: Colors.white),),
        ],
      ),
    );
  }

  Widget _displayForm(BuildContext context){
    return Form(
        key: _formKey,
        autovalidate: true,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical:10),
          children: <Widget>[
            _displayPhoneInputField(),
            _displayPasswordField(),
            FlatButton(onPressed: (){print("Forgot Password!");}, textColor: Colors.blue, child: Text("Forgot Password?",style: TextStyle(color: Colors.white),),padding: EdgeInsets.only(right: 0.0),),
            SizedBox(height: 10),
            _displayRememberMe(),
            SizedBox(height: 10),
            _displayLoginSubmitButton(context),
            SizedBox(height: 30),
            _displaySignUpRedirect(),
            SizedBox(height: 10,width: 25,),
          ],
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomPadding: false,
      // appBar: GradientAppBar(
      //   title: Text("Login"),
        

      // ),
      body: SingleChildScrollView(
        child: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.redAccent,Colors.pink],begin: Alignment.topLeft,end: Alignment.bottomRight),
        ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
        child: Column(
        children: <Widget>[
          _displaylogo(),
          _displayForm(context),
        ],
      )

      ),  
      ),
    );
  }
}
  