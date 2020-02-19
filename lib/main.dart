import 'package:flutter/material.dart';
import './branch_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (RouteSettings settings) {
        return routes(settings);
      },
    );
  }

  Route routes(RouteSettings settings) {
    print('route name:${settings.name}');
    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (context) {
          return MyHomePage(title: 'Flutter Demo Home Page');
        },
      );
    } else {
      return MaterialPageRoute(
        builder: (context) {
          return BranchList();
        },
      );
    }
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() async {
    // setState(() {
    //   _counter++;
    // });
    final result = await Navigator.pushNamed(context, '/branchlist');
    print("Inside my home page = $result");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Text("Hello World"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
