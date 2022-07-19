

import 'package:flutter/material.dart';
import 'package:todo_list/constants/images.dart';
import 'package:todo_list/data/todos.dart';
import 'package:todo_list/models/todo.dart';

import 'todo_list_page.dart';


class DataInputScreen extends StatefulWidget {
  static const String routeName = 'Data-Entry-Page';
   const DataInputScreen({Key? key}) : super(key: key);

  @override
  State<DataInputScreen> createState() => _DataInputScreenState();
}

class _DataInputScreenState extends State<DataInputScreen> {
  final TextEditingController _titleFieldController = TextEditingController();

  final TextEditingController _descriptionFieldController = TextEditingController();
   
   @override
     void dispose() {
    super.dispose();
    _titleFieldController.dispose();
    _descriptionFieldController.dispose();
   }

   void addToTodos() {
    TodoItem newTask=TodoItem(
      id: Todos.todos.length, 
      title: _titleFieldController.text,
       description: _descriptionFieldController.text,
        isCompleted: false);
        Todos.todos.add(newTask);
   }
   //method to add todoItem in todo list
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF311C61),
        title: const Text('Data Entry Screen'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(icon: const Icon(Icons.check_box_outlined),
            onPressed: () {
              Navigator.pushNamed(context, TodoListPage.routeName);
            },),
            )
        ],
      ),
     
       body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
               Images.dataInputScreenImage,
                height: 250,
              ),
            ),
             Flexible(
                  child: TextField(
                    controller: _titleFieldController,
                    decoration: const InputDecoration(
                      label: Text('Title'),border: OutlineInputBorder()),
                  ),
                ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: _descriptionFieldController,
                    decoration: const InputDecoration(
                      label: Text('Description'),border: OutlineInputBorder()),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: const Color(0xFF311C61),),
            
            onPressed: () {
               showDialog(context: context, builder:(context) {
                return const AlertDialog(
                   title: Text("Todo"),
                   content: Text("Added successfully"),
                );
               });

              addToTodos();
              _descriptionFieldController.clear();
              _titleFieldController.clear();
              },
               child: const Text('Add',
               style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18),))
          ],
        ),)
       
    );
  }
}