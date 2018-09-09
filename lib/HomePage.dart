import 'dart:async';
import 'package:drawer_demo/BottomNavigationPage.dart';
import 'package:drawer_demo/ExpandableListPage.dart';
import 'package:drawer_demo/SliverPage.dart';
import 'package:drawer_demo/TopTabBarsPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  var scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Pages"),
      ),
      key: scaffoldKey,

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                "Drawer header...",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(color: Colors.pink),
            ),
            ListTile(
              title: Text("Item 1 Navigation Drawer.",
                  overflow: TextOverflow.ellipsis),
              leading: new Icon(Icons.home),
              subtitle: Text("Navigetion"),
              trailing: Icon(Icons.add),
              enabled: true,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Item 2.."),
              leading: new Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Item 3 ..."),
              leading: new Icon(Icons.alarm_off),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 20.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: RaisedButton(
                  child: Text("Sliver Page"),
                  onPressed: () {
                    launchSliverPage(context);
                  }),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: RaisedButton(
                  child: Text("Expandable Page"),
                  onPressed: () {
                    launchExpandableListPage(context);
                  }),
            ),

            RaisedButton(
                child: Text("Bottom navigations"),
                onPressed: () {
                  launchBottomNavigationPage(context);
                }),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: RaisedButton(
                  child: Text("Top TabsBars"),
                  onPressed: () {
                    launchTopTabBar(context);
                  }),
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(child: Text("Modal Bottom Sheet"),
                    onPressed: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (builder) {
                            return new Container(
                              color: Colors.pink,
                              child: new Center(
                                child: new Text(
                                  "Hey guys !! it is a modal bottom sheet",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          });

                    }),
                RaisedButton(child: Text("Persistent Sheet"),
                    onPressed: (){
                  _persistentBottomSheet(scaffoldKey);
                    })
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                      child: Text("SimpleDialog"),
                      onPressed: () {
                        _simpleDialogBox(context);
                      }),
                  RaisedButton(
                      child: Text("AlertDialog"),
                      onPressed: () {
                        // AlertDialog Box...
                        showDialog(
                            context: context,
                            builder: (_) => new AlertDialog(
                                  title: Text("Alert Dialog Title"),
                                  actions: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                FlatButton(onPressed: (){
                                                  Navigator.pop(context);
                                                },child: Text("Reject"),),
                                                FlatButton(onPressed: (){},child: Text("Accept"),),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                  content: Text("This is my conent for AlertDialog"),
                                ));
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void launchBottomNavigationPage(BuildContext context) {
    Navigator.of(context).push(new MaterialPageRoute<dynamic>(
      builder: (BuildContext context) {
        return BottomNavigationPage();
      },
    ));
  }

  void launchTopTabBar(BuildContext context) {
    Navigator.of(context).push(new MaterialPageRoute<dynamic>(
      builder: (BuildContext context) {
        return TopTabBars();
      },
    ));
  }

  void launchSliverPage(BuildContext context) {
    Navigator.of(context).push(new MaterialPageRoute<dynamic>(
      builder: (BuildContext context) {
        return SliverPage();
      },
    ));
  }

  //  ExpandableListPage
  void launchExpandableListPage(BuildContext context) {
    Navigator.of(context).push(new MaterialPageRoute<dynamic>(
      builder: (BuildContext context) {
        return ExpandableListPage();
      },
    ));
  }

  // Simple Dialog
  Future<Null> _simpleDialogBox(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (_) => new SimpleDialog(
            contentPadding: EdgeInsets.zero,
            children: <Widget>[
              //Image(image: AssetImage("images/img_forest.jpg"), fit: BoxFit.cover,),
              Image(
                image: AssetImage("images/loki.jpg"),
                fit: BoxFit.cover,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "I am just doing some demos of flutter, I love to do it, In listview",
                  style: TextStyle(fontSize: 16.0),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(" Cencal "),
                      ),

                      RaisedButton(
                        color: Colors.pink,
                        onPressed: () {},
                        child: Text(
                          "Done",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
    );
  }



  void _persistentBottomSheet(var scaffoldkey){
    scaffoldkey.currentState.showBottomSheet((context){
      return new Container(
        color: Colors.green,
        height: 250.0,
        child: new Center(
          child: new Text("Hey! guys , this is a persistent bottom sheet",style: TextStyle(color: Colors.white),),
        ),
      );
    });
  }
}
