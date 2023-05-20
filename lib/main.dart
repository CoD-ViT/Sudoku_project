import 'package:flutter/material.dart';
import 'focusClass.dart';
import 'sudokuWidget.dart';

void main() {
  runApp(const MyApp());
}

SureExitDialog(BuildContext context) {
  Widget cancelButton = TextButton(
    child: Text("Ок"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text("Правила игры"),
    content: Text('''
Цель судоку: заполнить все пустые клетки с помощью цифр 1-9 (по одной цифре на клетку), 
по следующим правилам:

   1. Цифра может появиться только один раз в каждой строчке

   2. Цифра может появиться только один раз в каждом столбике

   3. Цифра может появиться только один раз в каждом районе'''),
    actions: [
      cancelButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Судоку'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          new IconButton(
              onPressed: () {
                SureExitDialog(context);
              },
              icon: new Icon(Icons.info)),
        ],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Выберите уровень сложности:',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                FocusClass.cmop1();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SudokuWidget()),
                );
              },
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 30),
                  padding: EdgeInsets.symmetric(horizontal: 115)),
              child: const Text('Легко'),
            ),
            ElevatedButton(
              onPressed: () {
                FocusClass.cmop2();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SudokuWidget()),
                );
              },
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 30),
                  padding: EdgeInsets.symmetric(horizontal: 75)),
              child: const Text('Нормально'),
            ),
            ElevatedButton(
              onPressed: () {
                FocusClass.cmop3();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SudokuWidget()),
                );
              },
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 30),
                  padding: EdgeInsets.symmetric(horizontal: 100)),
              child: const Text('Сложно'),
            ),
          ],
        ),
      ),
    );
  }
}
//------------------------------------------------------------------------------

