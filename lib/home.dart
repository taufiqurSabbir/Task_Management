import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Tasks> tasks = [Tasks('bboob', 'des', 2)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Management'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(tasks[index].title),
              subtitle: Text(tasks[index].des),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showdiolog();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void showdiolog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add Task'),
            content: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text('Title'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      )

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        label: Text('Description'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        )

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        label: Text('Days Required'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        )

                    ),
                  ),
                ),


              ],
            ),
          );
        });
  }
}

class Tasks {
  String title, des;
  int days;
  Tasks(this.title, this.des, this.days);
}
