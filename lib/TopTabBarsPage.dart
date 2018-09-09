import 'package:flutter/material.dart';


class TopTabBars extends StatefulWidget {
  @override
  _TopTabBarsState createState() => _TopTabBarsState();
}

class _TopTabBarsState extends State<TopTabBars> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: DefaultTabController(length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Tab Bars"),
              leading:  IconButton(
                icon: new Icon(Icons.arrow_back),
              onPressed: (){ Navigator.pop(context, true);}
          ),

              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.directions_transit)),
                  Tab(icon: Icon(Icons.directions_bike)),
                ],
              ),

            ),body: Container(),

          ), ),

    );
  }
}
