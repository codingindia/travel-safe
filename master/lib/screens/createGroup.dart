import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<Widget> list = [
          TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter the group name',
                labelText: 'Group Name',
              ),
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
                hintText: 'Enter phone number of Prime Member 1',
                labelText: 'Prime Member 1',
              ),
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
                hintText: 'Enter phone number of Prime Member 2',
                labelText: 'Prime Member 2',
              ),
            validator: (value) {
                  if (value.isEmpty) {
                    return 'This field is compulsory.';
                  }
                  return null;
                },
            
            ), 
            
            
  ];

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text("Create a group"),
      ),
      body: Container(
        height: deviceHeight,
        // scrollDirection: ,
        padding: EdgeInsets.all(20),
        child: Form(
        key: _formKey,
        autovalidate: true,
        child: Column(
         
            children: <Widget>[
              Flexible(
                  child: ListView.builder(
                //  physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemBuilder: (context,index){
                    Widget widget = list.elementAt(index);
                    return widget;
                },
            itemCount: list.length,),
              ),
              SizedBox(height: 35,),
            OutlineButton(
              color: Colors.white,
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2,                
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(children: <Widget>[
                Icon(Icons.add),
                SizedBox(width: 10),
                Text("Add member"),
              ],),
              onPressed: (){
                list.add(
           TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.phone,color: Colors.blue,),
                hintText: 'Enter phone number of Member',
                labelText: 'Member',
              ),
            )
                );
                setState(() {});
              }
            ),
            SizedBox(
              height: 20
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("Create Group"),
              onPressed: (){
                  if(_formKey.currentState.validate()){
                    print("Group Created!!");
                  }
              }
            ),
          ],
        ),
          ),
        ),
    );
  }
}


/**
 * Column(
   children: <Widget>[
  ListView.builder(
  itemBuilder: (context,index){
Widget widget = list.elementAt(index);
  return widget;
},
  itemCount: list.length,),
            
],),
 */