import 'package:flutter/material.dart';
import '../pages/page1.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class DrawerCustom extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Page 1", Icons.rss_feed),
    new DrawerItem("Page 2", Icons.local_pizza),
    new DrawerItem("Page 3", Icons.info)
  ];

  @override
  State<StatefulWidget> createState() {
    return new DrawerCustomState();
  }
}

class DrawerCustomState extends State<DrawerCustom> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new MyPage();
      case 1:
        break;
      case 2:
        break;

      default:
        return new Text("Error");
    }
  }
  
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        new ListTile(
          leading: new Icon(d.icon),
          title: new Text(d.title),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        )
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("My Name"), 
                accountEmail: new Text("myname@gmail.com"),
                currentAccountPicture: new GestureDetector(
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage("https://images.google.com/images/branding/googleg/1x/googleg_standard_color_128dp.png")
                  ),
                  onTap: () => print("This is your current account."),
                )),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
