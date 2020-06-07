import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:t_a_s_k/networking.dart';

import 'constants.dart';
import 'round_button.dart';

class POSTScreen extends StatefulWidget {
  static const String id = 'post_screen';

  @override
  _POSTScreenState createState() => _POSTScreenState();
}

class _POSTScreenState extends State<POSTScreen> {
  var userId, title, body;
  bool isPosted = false;
  String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('POST TASK'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: ListView(
          children: <Widget>[
            Text(
              'Add Todo TASK',
              textAlign: TextAlign.center,
              style: kTextStyle,
            ),
            SizedBox(height: 15),
            InputField(
              hintText: 'Enter a userId',
              onPress: (newValue) {
                userId = newValue;
              },
            ),
            SizedBox(height: 15),
            InputField(
              hintText: 'Enter a title',
              onPress: (newValue) {
                title = newValue;
              },
            ),
            SizedBox(height: 15),
            InputField(
              hintText: 'Enter the body content',
              onPress: (newValue) {
                body = newValue;
              },
            ),
            SizedBox(height: 30),
            RoundedButton(
              text: 'POST TODO',
              colour: Colors.green,
              onPress: () async {
                data = await NetworkHelper(
                        'https://jsonplaceholder.typicode.com/posts')
                    .postData(userId, title, body);
                setState(() {
                  isPosted = true;
                });
              },
            ),
            Center(
              child: Container(
                  child: isPosted
                      ? Text(
                          'POSTED\n$data',
                          style: kTrailingTextStyle,
                        )
                      : null),
            ),
          ],
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String hintText;
  final Function onPress;
  InputField({this.hintText, this.onPress});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onPress,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}
