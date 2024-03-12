import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Models/GroceryItem.dart';
import 'Bloc/GroceryBloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => GroceryBloc()..add(LoadGroceryList()),
      child: MyApp(),
    ),
  );
}

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
  final List<GroceryItem> _groceryItems = [];
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _itemQuantityController = TextEditingController();

  void _addItemToList() {
    if (_itemNameController.text.isNotEmpty && _itemQuantityController.text.isNotEmpty) {
      final newItem = GroceryItem(
        name: _itemNameController.text,
        quantity: int.tryParse(_itemQuantityController.text) ?? 0,
      );
      context.read<GroceryBloc>().add(AddGroceryItem(newItem));
      _itemNameController.clear();
      _itemQuantityController.clear();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _itemNameController,
              decoration: InputDecoration(
                labelText: 'Item Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _itemQuantityController,
              decoration: InputDecoration(
                labelText: 'Quantity',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            onPressed: _addItemToList,
            child: const Text('Add Item'),
          ),
          Expanded(
            child: BlocBuilder<GroceryBloc, GroceryState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.groceryItems.length,
                  itemBuilder: (context, index) {
                    final item = state.groceryItems[index];
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text('Quantity: ${item.quantity}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => _editItem(context, index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              context.read<GroceryBloc>().add(RemoveGroceryItem(index));
                            },
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  void _editItem(BuildContext context, int index) {
    final item = context.read<GroceryBloc>().state.groceryItems[index];

    TextEditingController editNameController = TextEditingController(text: item.name);
    TextEditingController editQuantityController = TextEditingController(text: item.quantity.toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: editNameController,
                decoration: InputDecoration(labelText: 'Item Name'),
              ),
              TextField(
                controller: editQuantityController,
                decoration: InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                final updatedItem = GroceryItem(
                  name: editNameController.text,
                  quantity: int.tryParse(editQuantityController.text) ?? item.quantity,
                );
                context.read<GroceryBloc>().add(UpdateGroceryItem(index, updatedItem));
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
