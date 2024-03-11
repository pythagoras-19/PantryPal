import 'package:flutter/material.dart';
import 'Models/GroceryItem.dart';
import 'Bloc/GroceryBloc.dart';

void main() {
  runApp(const MyApp());
}

final List<Map<String, dynamic>> items = [
  {'name': 'Bananas', 'image': 'assets/bananas.jpeg'},
  {'name': 'Potatoes', 'image': 'assets/potato.jpeg'},
  {'name': 'Oranges', 'image': 'assets/oranges.jpeg'},
  {'name': 'Apples', 'image': 'assets/apples.jpeg'},
];


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PantryPal',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'PantryPal'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(widget.title),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GridTile(
            child: Image.asset(items[index]['image'], fit: BoxFit.cover),
            footer: GridTileBar(
              backgroundColor: Colors.black45,
              title: Text(items[index]['name'], textAlign: TextAlign.center,),
            ),
          );
        },
      ),
    );
  }
}

