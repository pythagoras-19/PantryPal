import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/Models/GroceryItem.dart';

abstract class GroceryEvent {}

// events the BLoC will respond to (Add, remove, edit)

class AddItem extends GroceryEvent {
  final GroceryItem item;

  AddItem(this.item);
}

class RemoveItem extends GroceryEvent {
  final String itemId;

  RemoveItem(this.itemId);
}

class EditItem extends GroceryEvent {
  final GroceryItem item;

  EditItem(this.item);
}

class ToggleItemSelection extends GroceryEvent {
  final GroceryItem item;

  ToggleItemSelection(this.item);
}

// Possible States for BLoC

class GroceryState {
  final List<GroceryItem> items;

  GroceryState(this.items);
}

// Business logic

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  GroceryBloc() : super(GroceryState([])) {
    on<AddItem>(_onAddItem);
    on<RemoveItem>(_onRemoveItem);
    on<EditItem>(_onEditItem);
    on<ToggleItemSelection>(_onToggleItemSelection);
  }

  void _onAddItem(AddItem event, Emitter<GroceryState> emit) {
    // TODO: Add logic to handle the item addition
  }

  void _onRemoveItem(RemoveItem event, Emitter<GroceryState> emit) {
    // TODO: Add logic to handle the item removal
  }

  void _onEditItem(EditItem event, Emitter<GroceryState> emit) {
    // TODO: Add logic to handle the edit of item
  }

  void _onToggleItemSelection(ToggleItemSelection event, Emitter<GroceryState> emit) {
    // TODO: Add logic to handle the item selection toggle
  }

  Future<void> _loadInitialState() async {
    // TODO: Load the initial state from persistent storage
  }

  Future<void> _saveToPrefs(GroceryState state) async {
    final prefs = await SharedPreferences.getInstance();

    // Save state to prefs
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    // Load state from prefs
  }
}