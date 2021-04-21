import 'package:flutter/material.dart';
import 'package:flutterred/utils/app_utils.dart';

import '../data/models/todo.dart';

// ignore: must_be_immutable
class TodoItem extends StatelessWidget {
  final String heroTag;
  final Todo todo;
  final BuildContext context;

  TodoItem(this.heroTag, this.todo, this.context);
  var varTags;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            userIcon(),
            todoBody(),
          ],
        ),
      ),
    );
  }

  Widget userIcon() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      elevation: 10,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Icon(
          Icons.face,
          color: Colors.blue,
          size: 40,
        ),
      ),
    );
  }

  Widget todoBody() {
    return Flexible(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              todo.title,
              style: TextStyle(fontSize: 16),
            ),
            Divider(),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.done),
              title: Text(AppStrings.completed),
              trailing: Switch(
                onChanged: (bool value) => {},
                value: todo.completed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
