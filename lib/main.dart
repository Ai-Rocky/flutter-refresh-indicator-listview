import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> _items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Refresh Indicator'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        child: ListView(
          children: _items.map((e) {
            return Center(
                child: Text(
              e.toString(),
              style: TextStyle(fontSize: 50),
            ));
          }).toList(),
        ),
        onRefresh: () => _future(),
      ),
    );
  }

  _future() {
    return Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _items.add(Random().nextInt(100));
      });
    });
  }
}
