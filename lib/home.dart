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
              onLongPress: (){
                bottomdiolog(index);
              },
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
                      contentPadding: const EdgeInsets.symmetric(vertical: 40),
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
                    keyboardType: TextInputType.number,
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

  void bottomdiolog(int index){
    showModalBottomSheet(context: context, builder: (context){
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Task Details',style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
            Text('Title: ${tasks[index].title}',style: const TextStyle(fontSize: 16),),
            Text('Description: ${tasks[index].des}',style: const TextStyle(fontSize: 16),),
            Text('Days Required: ${tasks[index].days}',style: const TextStyle(fontSize: 16),),
            ElevatedButton(onPressed: (){
              tasks.removeAt(index);
              Navigator.pop(context);
              if(mounted){
                setState(() {
                });
              }
            }, child: const Text('Delete'))
          ],
        ),
      );
    });
  }
}

class Tasks {
  String title, des,days;
  Tasks(this.title, this.des, this.days);
}
