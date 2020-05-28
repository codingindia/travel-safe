import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travelsafe/screens/home.dart';
import 'package:travelsafe/screens/register.dart';


class LoginPage extends StatefulWidget {

    @override
    _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String phoneNo, verificationId, smsCode;
  bool codeSent = false;
  String errorMessage="";
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> verifyPhone() async{
    
    
    final PhoneCodeSent smsSent = (String verId, [int forceCodeResend]){
      this.verificationId = verId;
      smsOTPDialog(context).then((value) => print("Sign In"));
    };

    try{
      await auth.verifyPhoneNumber(
        phoneNumber: this.phoneNo, 
        timeout: const Duration(seconds: 20), 
        verificationCompleted: (AuthCredential phoneAuthCredential){
          print(phoneAuthCredential);
        }, 
        verificationFailed: (AuthException exceptio){
          print("${exceptio.message}");
        }, 
        codeSent: smsSent, 
        codeAutoRetrievalTimeout: (String verId){
          this.verificationId = verId;
        }
      );
    }
    catch(e){
      handleError(e);
    }

    
  }

  Future<bool> smsOTPDialog(BuildContext context){
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context){
        return AlertDialog(
            title: Text("Enter SMS Code"),
            content: Container(
              height: 85,
              child: Column(children: <Widget>[
                TextField(onChanged: (val){
                  this.smsCode = val;
                },),
                (
                  errorMessage != "" ?
                    Text(
                      errorMessage,
                      style: TextStyle(color: Colors.red),
                    ):Container()
                ),
              ],)
            ),
            contentPadding: EdgeInsets.all(10),
            actions: <Widget>[
              FlatButton(child: Text("Done"),
                onPressed: (){
                  auth.currentUser().then(
                    (user){
                      if(user != null){
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
                      }
                      else{
                        signIn();
                      }
                    }
                  );
                },
              )
            ],
        );
      }
    );
  }

  signIn() async{
    try{
      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId, 
        smsCode: smsCode,
      );
      final FirebaseUser user = (await auth.signInWithCredential(credential)) as FirebaseUser;
      final FirebaseUser currentUser = await auth.currentUser();
      assert(user.uid == currentUser.uid);
      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(builder:(context)=>Home()));
    }
    catch(e){
      handleError(e);
    }
  }

  handleError(PlatformException error){
    print(error);
    switch(error.code){
      case 'ERROR_INVALID_VERIFICATION_CODE':
        FocusScope.of(context).requestFocus(FocusNode());
        setState(() {
          errorMessage = "Invalid Code";
        });
        Navigator.of(context).pop();
        smsOTPDialog(context).then((value) => print("Sign In"));
        break;
      default:
      setState((){
        errorMessage = error.message;
      });
      break;
    }
  }

  Widget _displaylogo(){
      return Container(

            alignment: Alignment.center,
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                alignment: Alignment.topCenter,
                fit: BoxFit.fill, 
                image: AssetImage("assets/images/travelsafelogo.png")),
            ),
          );
  }

  Widget _displayPhoneInputField(Key formKey){
    return Theme(
      data: ThemeData(
        primaryColor: Colors.white
      ),
      child: Column(
        children: <Widget>[
            TextFormField(
              style: TextStyle(
                color: Colors.white
              ),
              onChanged: (val){
                setState(() {
                  this.phoneNo = val;
                });
              },
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
              // inputFormatters: [new LengthLimitingTextInputFormatter(10)],
              // keyboardType: TextInputType.phone,
              validator: (value){
                if(value.isEmpty){
                  return "This field is compulsory.";
                }
                else if(value.length!=13){
                  return "Enter 10 digit phone number beginning with country code (+91)";
                }
                else{
                  return null;
                }
              },
            ),
            (errorMessage != ''
                ? Text(
                    errorMessage,
                    style: TextStyle(color: Colors.red),
                  )
                : Container()),

            SizedBox(height:10),
            RaisedButton(
                elevation: 10,
                child: Text("Verify",style: TextStyle(fontSize: 20),),
                color: Colors.white,
                textColor: Colors.indigo,
                padding: const EdgeInsets.all(10),
                onPressed: (){
                  verifyPhone();
                }

            ),
            
        ],
      ), 
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
                  ), onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage())); 
                  },),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            )
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
            _displayPhoneInputField(_formKey),
            _displaySignUpRedirect(),
            // SizedBox(height: 30,width: 25,),
          ],
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          SizedBox(height: 50),
          _displaylogo(),
          _displayForm(context),
        ],
      )
        ),
      ),
        
      );
  }
}
  