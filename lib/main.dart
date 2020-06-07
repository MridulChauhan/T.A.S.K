import 'package:flutter/material.dart';
import 'package:t_a_s_k/get.dart';
import 'package:t_a_s_k/post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      routes: {
        GETScreen.id: (context) => GETScreen(),
        POSTScreen.id: (context) => POSTScreen(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Center(child: Text('T.A.S.K.')),
      ),
      body: Container(
        color: Colors.black54,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('GET'),
              onPressed: () {
                Navigator.pushNamed(context, GETScreen.id);
              },
            ),
            SizedBox(height: 10),
            RaisedButton(
              child: Text('POST'),
              onPressed: () {
                Navigator.pushNamed(context, POSTScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
