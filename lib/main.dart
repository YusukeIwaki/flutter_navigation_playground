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
  final String data;

  FirstScreen({Key key, this.data: "hoge"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('First Screen $data'),
      ),
      body: new Center(
        child: new FlatButton(
          child: new Text('Launch new screen'),
          onPressed: () {
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new SecondScreen(data: "->$data")),
            );
          },
        ),
      ),
    );
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
            Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new ConfirmScreen(data: "OK from Secondary:$data")));
          },
          child: new Text('Confirm $data!'),
        ),
      ),
    );
  }
}

class ConfirmScreen extends StatelessWidget {
  final String data;

  ConfirmScreen({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Second Screen"),
      ),
      body: new Center(
        child: new FlatButton(
          onPressed: () {
            Route routeToTop = new MaterialPageRoute(builder: (context) => new FirstScreen(data: "OK from Confirmation:$data"));
            Navigator.of(context)
                .pushAndRemoveUntil(routeToTop, (route) => false);
          },
          child: new Text('Go back from $data!'),
        ),
      ),
    );
  }
}
