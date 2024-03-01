import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _userToDo = '';
  List todoList = [];

  void initFirebase() async {}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //initFirebase();

    todoList.addAll(['Buy milk', 'Wash dishes', 'Купить печенье']);
  }

  void _menuOpen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
          backgroundColor: Color.fromARGB(255, 153, 153, 198),
          appBar: AppBar(
            title: Text('Меню', style: TextStyle(color: Colors.white)),
            centerTitle: true,
            backgroundColor: Colors.black26,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/', (route) => false);
                    },
                    child: Text('На главную',
                        style: TextStyle(color: Colors.black))),
              ]),
            ],
          ));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 153, 153, 198),
      appBar: AppBar(
        title: Text('Список дел', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black26,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _menuOpen,
            icon: Icon(Icons.menu_rounded),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('items').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Text('Дел нет');
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: Key(snapshot.data!.docs[index].id),
                child: Card(
                  child: ListTile(
                    title: Text(snapshot.data!.docs[index].get('item')),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          FirebaseFirestore.instance.collection('items').doc(snapshot.data!.docs[index].id).delete();
                        });
                      },
                    ),
                  ),
                ),
                onDismissed: (direction) {
                  //if(directions == DismissDirection.endToStart)
                  FirebaseFirestore.instance.collection('items').doc(snapshot.data!.docs[index].id).delete();
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Добавить дело'),
                  content: TextField(
                    onChanged: (String value) {
                      _userToDo = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('items')
                              .add({'item': _userToDo});
                          setState(() {
                            Navigator.of(context).pop();
                          });
                        },
                        child: Text('Добавить', style: TextStyle(color: Colors.black)))
                  ],
                );
              });
        },
        child: Icon(Icons.add_box_rounded, color: Colors.white, size: 40),
        backgroundColor: Colors.green,
      ),
    );
  }
}
