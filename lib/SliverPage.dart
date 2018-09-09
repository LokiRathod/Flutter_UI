import 'package:flutter/material.dart';

class SliverPage extends StatefulWidget {
  @override
  _SliverPageState createState() => _SliverPageState();
}

class _SliverPageState extends State<SliverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
          //  floating: true, snap: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Sliver App"),
              background: new Image(image:AssetImage("images/loki.jpg"),fit: BoxFit.fill,),
            ),
            // pinned: true
          ),
          SliverFixedExtentList(
              delegate: SliverChildListDelegate(buildTextViews(100)),
              itemExtent: 50.0)
         // SliverList(delegate: SliverChildListDelegate(buildTextViews(100)))
        ],
      ),
    );
  }
}

List buildTextViews(int count) {
  List<Widget> listOfString = List();
  for (int i = 0; i < count; i++) {
    listOfString.add(new Padding(
        padding: new EdgeInsets.all(16.0),
        child: new Text("Item number : " + i.toString(),
            style: new TextStyle(fontSize: 18.0))));
  }
  return listOfString;
}
