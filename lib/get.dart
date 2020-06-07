import 'package:flutter/material.dart';
import 'package:t_a_s_k/constants.dart';
import 'package:t_a_s_k/networking.dart';
import 'package:t_a_s_k/round_button.dart';

class GETScreen extends StatefulWidget {
  static const String id = 'get_screen';
  @override
  _GETScreenState createState() => _GETScreenState();
}

class _GETScreenState extends State<GETScreen> {
  var todos;
  var iD, userId, title, completed;
  TextEditingController _controller = new TextEditingController();

  void update(var data) {
    setState(() {
      title = data['title'];
      userId = data['userId'];
      iD = data['id'];
      completed = data['completed'];
    });
  }

  void getData() async {
    try {
      NetworkHelper networkHelper = new NetworkHelper(
          "https://jsonplaceholder.typicode.com/todos/$todos");
      var data = await networkHelper.getData();
      update(data);
      print(title);
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('GET TASKS'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 40),
        child: ListView(
          children: <Widget>[
            Text(
              'Enter todo task number',
              textAlign: TextAlign.center,
              style: kTextStyle,
            ),
            TextField(
              controller: _controller,
              onChanged: (newValue) {
                todos = int.parse(newValue);
              },
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Enter a number",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            RoundedButton(
                text: 'GET TODOS',
                colour: Colors.green,
                onPress: () {
                  getData();
                  FocusScope.of(context).unfocus();
                  _controller.clear();
                }),
            SizedBox(height: 20),
            Column(
              children: <Widget>[
                Text(
                  'Title',
                  style: kTextStyle,
                ),
                SizedBox(height: 10),
                Text(
                  '$title',
                  style: kTrailingTextStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            ListTile(
              leading: Text(
                'User Id',
                style: kTextStyle,
              ),
              trailing: Text('$userId', style: kTrailingTextStyle),
            ),
            ListTile(
              leading: Text(
                'Id',
                style: kTextStyle,
              ),
              trailing: Text('$iD', style: kTrailingTextStyle),
            ),
            ListTile(
              leading: Text(
                'Completion Status',
                style: kTextStyle,
              ),
              trailing: Text('$completed', style: kTrailingTextStyle),
            ),
          ],
        ),
      ),
    );
  }
}
