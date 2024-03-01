import 'package:flutter/material.dart';

//Hello World
/*
void main() => runApp(MaterialApp(
  home: Text('\nПривет, мир!'),
));
*/


//Самые базовые виджеты
/*
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.black),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test Project'),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: Center(
            child: Text(
          'Hello World!',
          style: TextStyle(
              fontSize: 52,
              color: Colors.amber,
              fontFamily: 'LemonOne'),
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('CLicked');
          },
          child: Text('Нажми'),
          backgroundColor: Colors.amber,
        ),
      ),
    );
  }
}
 */



//Кнопки, иконки, картинки и контейнеры
/*
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.black),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test Project'),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),

        //body old
        /*body: Center(
            child:

            //кнопки и иконки
            //Icon(Icons.settings, size: 333, color: Colors.green),
            //ElevatedButton(onPressed: (){}, child: Text('Нажми на меня')),
            /*TextButton(onPressed: (){}, child: Text('Нажми на меня'),
              style: TextButton.styleFrom(
                textStyle: TextStyle(color: Colors.black),
                backgroundColor: Colors.amber,
              )
            ),*/
            /*ElevatedButton.icon(onPressed: (){},
                icon: Icon(Icons.adb_sharp, color: Colors.green),
                label: Text('Настройки'))*/
          //OutlinedButton(onPressed: (){}, child: Text('Нажми'))

          //картинки
          //Image(image: NetworkImage('https://n1s1.hsmedia.ru/72/dd/15/72dd15a18f26d49afcb9f49f3e112abb/1280x768_0xac120004_15454025751684973637.jpeg'))
          /*Image(
            image: AssetImage('assets/images/fogHedgehog.jpg'),
            //image: NetworkImage('https://n1s1.hsmedia.ru/72/dd/15/72dd15a18f26d49afcb9f49f3e112abb/1280x768_0xac120004_15454025751684973637.jpeg'),
          )*/

          //контейнеры
          Container(
            color: Colors.orange,
            child: Text('Контейнер'),
          )

        ),
        */

        body: Container(
          color: Colors.orange,
          child: Text('Контейнер'),
          //margin: EdgeInsets.symmetric(horizontal: 150, vertical: 250),
          margin: EdgeInsets.fromLTRB(10, 20, 30, 40),
          padding: EdgeInsets.all(10)
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('CLicked');
          },
          child: Text('Нажми'),
          backgroundColor: Colors.orange,
        ),
      ),
    );
  }
}
 */


//Система сеток

/* void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.black),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test Project'),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),

        body: Row(
          /*children: [
            Text('Hello'),
            TextButton(onPressed: (){}, child: Text('Нажми')),
          ],*/
        mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Hello'),
                TextButton(onPressed: (){}, child: Text('Нажми')),
                Text('Hello?'),
                Text('Hello??'),
              ],
            ),
            Column(
              children: [
                Text('Hello'),
                TextButton(onPressed: (){}, child: Text('Нажми')),
              ],
            )
          ],
        ),
        //колонка
        /*Column(
          children: [
            Text('Hello'),
            TextButton(onPressed: (){}, child: Text('Нажми')),
          ],
        ),*/
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('CLicked');
          },
          child: Text('Нажми'),
          backgroundColor: Colors.orange,
        ),
      ),
    );
  }
}
*/

void main() => runApp(MaterialApp(
  home: UserPanel(),
));

class UserPanel extends StatefulWidget {
  const UserPanel({super.key});

  @override
  State<UserPanel> createState() => _UserPanelState();
}

class _UserPanelState extends State<UserPanel> {

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      appBar: AppBar(
        title: Text('Test Application',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Column(
                children: [
                  Padding(padding: EdgeInsets.only(top:50)),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/Lake.jpeg'),
                    radius: 100,
                  ),
                  Text('Alan Wake', style: TextStyle(
                    fontSize: 44,
                    color: Colors.white,
                  )),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  Row(
                    children: [
                      Icon(Icons.mail_outline, size: 25, color: Colors.white),
                      Padding(padding: EdgeInsets.only(right:5)),
                      Text('reyper2014@yandex.ru', style: TextStyle(color: Colors.white))
                    ]
                  ),
                  Padding(padding: EdgeInsets.only(top: 15)),
                  Row(
                      children: [
                        Text('Ocean number: $_count', style: TextStyle(color: Colors.white, fontSize: 25))
                      ]
                  ),
                ]
            ),
          ]
        ),

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.access_time_filled, color: Colors.white, size: 35),
        backgroundColor: Colors.black,
        onPressed: (){
          setState(() {
            _count++;
          });
        },
      ),
    );
  }
}
