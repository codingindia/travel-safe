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
            
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.calendar_today,color: Colors.blue,),
                hintText: 'Enter your date of birth',
                labelText: 'Date of birth',

              ),
              keyboardType: TextInputType.datetime,
              
            ),
            Padding(padding: EdgeInsets.all(10),
              child: Text(
                "Gender",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
                ),
              ),
            ),
            GenderSelection(
                selectedGenderIconColor: Colors.blue,
                maleText: "", //default Male
                femaleText: "", //default Female
                selectedGenderIconBackgroundColor: Colors.blue, // default red 
                checkIconAlignment: Alignment.centerRight,   // default bottomRight
                selectedGenderCheckIcon: null, // default Icons.check
                onChanged: (Gender gender){
                    print(gender);
                },
                equallyAligned: true,
                animationDuration: Duration(milliseconds: 400),
                isCircular: true, // default : true,
                isSelectedGenderIconCircular: true,
                opacityOfGradient: 0.6,
                padding: const EdgeInsets.all(3),
                size: 80, //default : 120
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.phone,color: Colors.blue,),
                hintText: 'Enter your phone number',
                labelText: 'Phone',

              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                  new WhitelistingTextInputFormatter(
                  new RegExp(r'^[()\d -]{1,15}$')),
              ],
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.email,color: Colors.blue,),
                hintText: "Enter email address",
                labelText: "Email",
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your contact address',
                labelText: 'Address Line 1',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your contact address',
                labelText: 'Address Line 2',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter city',
                labelText: 'City',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.phone,color: Colors.blue,),
                hintText: 'Enter emergency contact number',
                labelText: 'Emergency number 1',

              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
              ],
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.phone,color: Colors.blue,),
                hintText: 'Enter emergency contact number',
                labelText: 'Emergency number 2',
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
              ],
            ),
            SizedBox(height: 30,),
            RaisedButton(
              elevation: 10,
              child: Text("Register",style: TextStyle(fontSize: 20),),
              padding: const EdgeInsets.all(14),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: (){}
            ),
            SizedBox(height: 60,),
          ],
        ),
      )
    );
  }
}