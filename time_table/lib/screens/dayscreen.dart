import 'package:flutter/material.dart';
import 'package:time_table/screens/time_table.dart';

class DayScreen extends StatelessWidget {
  var weekdays = ["monday", "tuesday", "wednesday", "thursday", "friday"];
  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('AlertDialog Title'),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text('This is a demo alert dialog.'),
                  Text('Would you like to confirm this message?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Confirm'),
                onPressed: () {
                  print('Confirmed');
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (ctx, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) =>
                        TimeTable("siddhartha", weekdays[index])));
              },
              child: Container(
                height: 250,
                child: Card(
                  child: Text(
                    weekdays[index],
                    style: const TextStyle(color: Colors.white),
                  ),
                  color: Colors.black,
                ),
              ),
            );
          }),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.exit_to_app,
          ),
          onPressed: () {},
        ),
        title: const Text("Days"),
      ),
    );
  }
}
