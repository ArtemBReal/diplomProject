import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 153, 153, 198),
        appBar: AppBar(
          title: Text('Список дел', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black26,
          centerTitle: true,
        ),
        body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Главное меню',
                  style: TextStyle(color: Colors.white, fontSize: 22)),
              ElevatedButton(
                onPressed: () {
                  //Navigator.pushNamed(context, '/todo');
                  //Navigator.pushNamedAndRemoveUntil(context, '/todo', (route) => true);
                  Navigator.pushReplacementNamed(context, '/todo');
                },
                child: Text(
                  'Открыть список',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          )
        ]));
  }
}
