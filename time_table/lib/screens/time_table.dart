import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

class TimeTable extends StatefulWidget {
  TimeTable(this.username, this.day);
  final String username;
  final String day;
  var mep = {"monday": 0, "tuesday": 1};
  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  List schedule = [];
  var timing = {0: "8-9", 1: "9-8", 2: "1"};
  var items;
  void fetch() async {
    var db = await mongo.Db.create(
        "mongodb+srv://siddharth:Naruto2619*@cluster0.gqdbh.mongodb.net/mydb?retryWrites=true&w=majority");
    await db.open();
    mongo.DbCollection result = db.collection('customers');
    items = await result.find({"name": widget.username}).toList();
    setState(() {
      schedule = items[0]["table"][widget.mep[widget.day]][widget.day];
    });
  }

  void initState() {
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Schedule"),
      ),
      body: schedule.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: 2,
              itemBuilder: (ctx, index) {
                var subs = schedule[index].keys.elementAt(0);
                var link = schedule[index].values.elementAt(0);
                return Container(
                  height: 80,
                  child: ListTile(
                    title: Text(subs),
                    trailing: Text(link),
                  ),
                );
              }),
    );
  }
}
