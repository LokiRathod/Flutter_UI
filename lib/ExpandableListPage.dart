import 'package:flutter/material.dart';


class ExpandableListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Expandable List"),
      ),
      body: ExpandableList(),
    );
  }
}

class ExpandableList extends StatelessWidget {
  final list = new List.generate(20, (i) => "Item ${i+1}");
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemBuilder: (context, i) => ExpansionTile(
        title: new Text("Header ${i+1}"),
        children: list
            .map((val) => new ListTile(
          title: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: new Text(val),
          ),
        ))
            .toList(),
      ),
      itemCount: 5,
    );
  }
}

