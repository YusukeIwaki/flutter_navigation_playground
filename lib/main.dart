import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.green,
        accentColor: Colors.deepPurpleAccent
      ),
      home: new FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('First Screen'),
      ),
      body: new Center(
        child: new FlatButton(
          child: new Text('Launch new screen'),
          onPressed: () {
            _navigateToSecondScreen(context, "hoge");
          },
        ),
      ),
    );
  }

  _navigateToSecondScreen(BuildContext context, String data) async {
    final result = await Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new SecondScreen(data: data)),
    );

    debugPrint(result);
  }
}

class SecondScreen extends StatelessWidget {
  final String data;

  SecondScreen({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Second Screen"),
      ),
      body: new Center(
        child: new FlatButton(
          onPressed: () {
            Navigator.pop(context, "OK from Secondary:$data");
          },
          child: new Text('Go back from $data!'),
        ),
      ),
    );
  }
}
