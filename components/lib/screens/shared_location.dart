import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class SharedLocation extends StatefulWidget {
  @override
  _SharedLocationState createState() => _SharedLocationState();
}

class _SharedLocationState extends State<SharedLocation> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width= MediaQuery.of(context).size.width;
    final height= MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          'Shared Location'
        ),
      ),
      body: Column(
        children: <Widget>[
          // _getAppBar(),
          SizedBox(height: height*0.02,),
          Padding(
            padding: const EdgeInsets.only(left:8.0,right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      '1h',
                      style: TextStyle(
                        color: Colors.grey
                      ),
                    ),
                    SizedBox(width: width*0.02,),
                    Icon(
                      Icons.sort
                    ),
                    SizedBox(width: width*0.02,),
                    Icon(
                      Icons.dashboard
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: height*0.005,),
          Container(
            width: width*0.95,
            child: Divider(
              color: Colors.grey,
            ),
          ),
          SizedBox(height: height*0.02,),
          ///////////You can make a list of it\\\\\\\\
          Container(
            height: height*0.11,
            child: Card(
              elevation: 3.0,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(width: 10.0,),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          shape: BoxShape.circle
                        ),
                      ),
                      SizedBox(width: 10.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            faker.person.name(),
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(width: 5.0,),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                size: 15.0,
                              ),
                              Text(
                                '34, km',
                                style: TextStyle(
                                  fontSize: 13.0
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(width: 10.0,),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getAppBar(){
    final width= MediaQuery.of(context).size.width;
    final height= MediaQuery.of(context).size.height;
    return Container(
      color: Colors.grey[200],
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: width*0.9,
            height: height*0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: Colors.white,
            ),
            child: TextField(
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0
              ),
              // controller: _searchController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.circular(6.0)
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.circular(6.0)
                ),
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                suffixIcon: Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey[400],
                    ),
                    onPressed: (){},
                  ),
                ),
                filled: true
              ),
              onSubmitted: (input){},
            ),
          ),
        ),
      ),
    );
  }
}