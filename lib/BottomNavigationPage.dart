import 'package:flutter/material.dart';


class BottomNavigationPage extends StatefulWidget {
  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {

  int currentPage = 0;
  PageOne one;
  PageTwo two;
  List<Widget> pages;
  Widget currentTab;

  @override
  void initState() {
    one = PageOne();
    two = PageTwo();

    pages = [one, two];
    currentTab = one;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation"),
      ),body: currentTab,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (int index){
                setState((){
                  currentPage = index;
                  currentTab = pages[index];
                });

        },

          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              title: Text("Home"),
              icon: Icon(Icons.home),
            ),

            BottomNavigationBarItem(
              title: Text("Setting"),
              icon: Icon(Icons.settings),
            ),

          ],

      ),
    );
  }
}


class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
    );
  }
}

