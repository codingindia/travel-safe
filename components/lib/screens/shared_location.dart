import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SharedLocation extends StatefulWidget {
  @override
  _SharedLocationState createState() => _SharedLocationState();
}

class _SharedLocationState extends State<SharedLocation> {

  TextEditingController _searchController;
  List<User> userList = [];
  List<String> strList = [];
  List<Widget> favouriteList = [];
  List<Widget> normalList = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    for (var i = 0; i < 100; i++) {
      var name = faker.person.name();
      userList.add(User(name, faker.company.name(), false));
    }
    for (var i = 0; i < 4; i++) {
      var name = faker.person.name();
      userList.add(User(name, faker.company.name(), true));
    }
    userList
        .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    filterList();
    searchController.addListener(() {
      filterList();
    });
    super.initState();
  }

  filterList() {
    List<User> users = [];
    users.addAll(userList);
    favouriteList = [];
    normalList = [];
    strList = [];
    if (searchController.text.isNotEmpty) {
      users.retainWhere((user) =>
          user.name
              .toLowerCase()
              .contains(searchController.text.toLowerCase()));
    }
    users.forEach((user) {
      if (user.favourite) {
        favouriteList.add(
          Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            secondaryActions: <Widget>[
              IconSlideAction(
                iconWidget: Icon(Icons.star),
                onTap: () {},
              ),
              IconSlideAction(
                iconWidget: Icon(Icons.more_horiz),
                onTap: () {},
              ),
            ],
            child: ListTile(
              leading: Stack(
                children: <Widget>[
                  CircleAvatar(
                    // backgroundImage:
                    // NetworkImage("http://placeimg.com/200/200/people"),
                  ),
                  Container(
                      height: 40,
                      width: 40,
                      child: Center(
                        child: Icon(
                          Icons.star,
                          color: Colors.yellow[100],
                        ),
                      ))
                ],
              ),
              title: Text(user.name),
              subtitle: Text(user.company),
            ),
          ),
        );
      } else {
        normalList.add(
          Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            secondaryActions: <Widget>[
              IconSlideAction(
                iconWidget: Icon(Icons.star),
                onTap: () {},
              ),
              IconSlideAction(
                iconWidget: Icon(Icons.more_horiz),
                onTap: () {},
              ),
            ],
            child: Row(
              children: <Widget>[
                Container(
                  height: 100.0,
                  width: 340.0,
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
                                  user.name,
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
                ),
                // SizedBox(width: 10.0,),
              ],
            ),
            // child: Padding(
            //   padding: const EdgeInsets.only(top:10.0,bottom: 10.0),
            //   child: Card(
            //     child: ListTile(
            //       leading: CircleAvatar(
            //         // backgroundImage:
            //         // NetworkImage("http://placeimg.com/200/200/people"),
            //       ),
            //       title: Text(user.name),
            //       subtitle: Text(user.company),
            //       trailing: Icon(
            //         Icons.star
            //       ),
            //     ),
            //   ),
            // ),
          ),
        );
        strList.add(user.name);
      }
    });

    setState(() {
      strList;
      favouriteList;
      normalList;
      strList;
    });
  }

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
      body: Column(
        children: <Widget>[
          SizedBox(height: height*0.0325,),
          _getAppBar(),
          SizedBox(height: height*0.02,),
          Padding(
            padding: const EdgeInsets.only(left:8.0,right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Matches',
                      style: TextStyle(
                        color: Colors.grey
                      ),
                    ),
                    SizedBox(width: width*0.02,),
                    Container(
                      width: width*0.05,
                      height: height*0.025,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        shape: BoxShape.circle
                      ),
                    )
                  ],
                ),
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
          Flexible(
            child: AlphabetListScrollView(
              strList: strList,
              highlightTextStyle: TextStyle(
                color: Colors.yellow,
              ),
              showPreview: true,
              itemBuilder: (context, index) {
                return normalList[index];
              },
              indexedHeight: (i) {
                return 80;
              },
              keyboardUsage: true,
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
              controller: _searchController,
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

class User {
  final String name;
  final String company;
  final bool favourite;

  User(this.name, this.company, this.favourite);
}