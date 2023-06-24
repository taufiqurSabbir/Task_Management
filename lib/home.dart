import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController des = TextEditingController();
  TextEditingController days = TextEditingController();


  List<Tasks> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Management'),
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
        child: const Icon(Icons.add),
      ),
    );
  }

  void showdiolog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Add Task'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: title,
                    decoration: InputDecoration(
                      label: const Text('Title'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      )

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: des,
                    decoration: InputDecoration(
                        label: const Text('Description'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        )

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: days,
                    decoration: InputDecoration(
                        label: const Text('Days Required'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        )

                    ),
                  ),
                ),


              ],
            ),
            actions: [
              TextButton(onPressed: (){
                if(title.text.trim().isNotEmpty && des.text.trim().isNotEmpty && days.text.trim().isNotEmpty){
                  tasks.add(Tasks(title.text.trim(), des.text.trim(),days.text.trim()));
                  setState(() {
                  });
                  title.clear();
                  des.clear();
                  days.clear();
                  Navigator.pop(context);
                }
              }, child: const Text('Save'))
            ],
          );
        });
  }
}

class Tasks {
  String title, des,days;
  Tasks(this.title, this.des, this.days);
}
