import 'package:flutter/material.dart';

import '../models/drawer_item.dart';
import '../pages/tabs/design_page.dart';
import '../pages/tabs/dictionary_page.dart';
import '../pages/tabs/response_page.dart';
import '../pages/tabs/info_page.dart';
import '../utils/app_utils.dart';

class HomePage extends StatefulWidget {
  List<DrawerItem> drawerItems = [
    DrawerItem(AppStrings.page1, Icons.info),
    DrawerItem(AppStrings.page2, Icons.settings),
    DrawerItem(AppStrings.page3, Icons.message),
    DrawerItem(AppStrings.page4, Icons.book_online),
  ];

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  getDrawerItemWidget(int pos) {
    Widget child;

    switch (pos) {
      case 0:
        child = InfoPage();
        break;

      case 1:
        child = DesignPage();
        break;

      case 2:
        child = ResponsePage();
        break;

      case 3:
        child = DictionaryPage();
        break;

      default:
        child = Text("Error");
        break;
    }

    return child;
  }

  onSelectItem(int index) {
    setState(() => selectedIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: selectedIndex != 0
            ? GestureDetector(
                onTap: () => onBackPressed(), child: Icon(Icons.arrow_back))
            : null,
        title: Text(widget.drawerItems[selectedIndex].title),
      ),
      endDrawer: navigationDrawer(),
      body: getDrawerItemWidget(selectedIndex),
    );
  }

  void onBackPressed() {
    setState(() => selectedIndex = 0);
  }

  Widget navigationDrawer() {
    List<Widget> drawerOptions = <Widget>[];

    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: Icon(d.icon),
        title: Text(d.title),
        selected: i == selectedIndex,
        onTap: () => onSelectItem(i),
      ));
    }

    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(AppStrings.userName),
            accountEmail: Text(AppStrings.userEmail),
            currentAccountPicture: CircleAvatar(
              child: FlutterLogo(
                size: 100,
              ),
              backgroundColor: Colors.white,
            ),
          ),
          Column(
            children: drawerOptions,
          )
        ],
      ),
    );
  }
}
