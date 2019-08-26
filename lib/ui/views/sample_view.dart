import 'package:flutter/material.dart';
import 'package:hwablog/core/services/base/base_api.dart';
import 'package:hwablog/core/services/base/todo.dart';

class SampleView extends StatefulWidget {
  SampleView({Key key}) : super(key: key);

  _SampleViewState createState() => _SampleViewState();
}

class _SampleViewState extends State<SampleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text("oke"),
          onPressed: () async {
            var manager = ApiManager.instance().baseHttp;
            var result = await manager
                .get<Todo>("https://jsonplaceholder.typicode.com/todos/1");
            print(result);
          },
        ),
      ),
    );
  }
}
