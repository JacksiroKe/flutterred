import 'package:flutter/material.dart';
import 'package:anisi_controls/anisi_controls.dart';

import '../../data/base/event_object.dart';
import '../../data/models/todo.dart';
import '../../services/app_futures.dart';
import '../../utils/api_utils.dart';
import '../../utils/app_utils.dart';
import '../../utils/colors.dart';
import '../../widgets/todo_item.dart';

class ResponsePage extends StatefulWidget {
  @override
  createState() => ResponsePageState();
}

class ResponsePageState extends State<ResponsePage> {
  final globalKey = GlobalKey<ScaffoldState>();
  AsLoader loader = AsLoader.setUp(ColorUtils.primaryColor);
  AsInformer notice = AsInformer.setUp(3, AppStrings.nothing, Colors.red,
      Colors.transparent, ColorUtils.white, 10);
  List<Todo> todos = [];

  final ScrollController myScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => initBuild(context));
  }

  /// Method to run anything that needs to be run immediately after Widget build
  void initBuild(BuildContext context) async {
    requestData();
  }

  /// Method to request data either from the db or server
  void requestData() async {
    loader.showWidget();

    if (todos.length > 0) todos.clear();

    EventObject eventObject;
    eventObject = await getTodos('5');

    switch (eventObject.id) {
      case EventConstants.requestSuccessful:
        {
          setState(() {
            loader.hideWidget();
            todos = Todo.fromData(eventObject.object);
            if (todos.length == 0)
              notice.showWidget();
            else
              notice.hideWidget();
          });
        }
        break;

      case EventConstants.requestUnsuccessful:
        {
          setState(() {
            showDialog(
                context: context, builder: (context) => noInternetDialog());
            notice.showWidget();
            loader.hideWidget();
          });
        }
        break;

      case EventConstants.noInternetConnection:
        {
          setState(() {
            showDialog(
                context: context, builder: (context) => noInternetDialog());
            notice.showWidget();
            loader.hideWidget();
          });
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      body: SafeArea(
        child: mainBody(),
      ),
    );
  }

  /// The whole widget making up the screen area
  Widget mainBody() {
    return Container(
      child: Stack(
        children: <Widget>[
          listView(),
          Container(
            height: 200,
            child: notice,
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            height: 200,
            child: Center(
              child: loader,
            ),
          ),
        ],
      ),
    );
  }

  Widget listView() {
    return Container(
      decoration: BoxDecoration(color: Colors.grey),
      child: ListView.builder(
        controller: myScrollController,
        padding: EdgeInsets.zero,
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoItem('TodoIndex_' + todos[index].id.toString(), todos[index], context);
        },
      ),
    );
  }

  Widget noInternetDialog() {
    return AlertDialog(
      title: Text(
        ApiStrings.noInternetConnection,
        style: TextStyle(color: ColorUtils.primaryColor, fontSize: 25),
      ),
      content: Text(
        ApiStrings.noInternetConnection,
        style: TextStyle(fontSize: 20),
      ),
      actions: <Widget>[
        Container(
          margin: EdgeInsets.all(5),
          child: FlatButton(
            child: Text(AppStrings.okayGotIt, style: TextStyle(fontSize: 20)),
            color: ColorUtils.primaryColor,
            textColor: ColorUtils.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          child: FlatButton(
            child: Text(AppStrings.retry, style: TextStyle(fontSize: 20)),
            color: ColorUtils.primaryColor,
            textColor: ColorUtils.white,
            onPressed: () {
              Navigator.pop(context);
              todos = [];
              requestData();
            },
          ),
        ),
      ],
    );
  }
}
