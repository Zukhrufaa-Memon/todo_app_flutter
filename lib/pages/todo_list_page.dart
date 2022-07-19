import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../data/todos.dart';

class TodoListPage extends StatefulWidget {
 static const String routeName= 'todos-list-page';

  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
   bool _value=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(title: const Text('Todos'),backgroundColor: Color(0xFF311C61),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: Todos.todos.length,
                itemBuilder: (context,index){
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: CheckboxListTile(
                      tileColor:Colors.white ,
                      title:Text((Todos.todos[index].title)) ,
                      secondary: const Icon(Icons.today_outlined,size: 30,),
                      subtitle: Text(Todos.todos[index].description),
                      selected: _value,
                      value: _value,
                      onChanged: (value) {
                        setState(() {
                          _value=value!;
                        });
                      },
                    ) /*ListTile(
                      tileColor: Colors.white,
                      leading: const Icon(Icons.today_outlined,size: 30,),
                      title: Text((Todos.todos[index].title)),
                      subtitle: Text(Todos.todos[index].description),
                      trailing: const Icon(
                        Icons.check_box_outline_blank_sharp,
                        color: Color(0xFF311C61),
                        size: 30.0,
                      ),
                    ),*/
              );
                },
              ),)
          )
        ],
      ),
    ));
  }
}