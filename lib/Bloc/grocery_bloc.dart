import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/grocery_item.dart';

abstract class GroceryEvent {}

class LoadGroceryList extends GroceryEvent {}

class AddGroceryItem extends GroceryEvent {
  final GroceryItem item;

  AddGroceryItem(this.item);
}

class RemoveGroceryItem extends GroceryEvent {
  final int index;

  RemoveGroceryItem(this.index);
}

class UpdateGroceryItem extends GroceryEvent {
  final int index;
  final GroceryItem updatedItem;

  UpdateGroceryItem(this.index, this.updatedItem);
}

class GroceryState {
  final List<GroceryItem> groceryItems;

  GroceryState({this.groceryItems = const []});
}

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  GroceryBloc() : super(GroceryState()) {
    on<LoadGroceryList>(_onLoadGroceryList);
    on<AddGroceryItem>(_onAddGroceryItem);
    on<RemoveGroceryItem>(_onRemoveGroceryItem);
    on<UpdateGroceryItem>(_onUpdateGroceryItem);
  }

  Future<void> _onLoadGroceryList(
                                  LoadGroceryList event,
                                  Emitter<GroceryState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final String? encodedData = prefs.getString('groceryList');
    if (encodedData != null) {
      final List<GroceryItem> loadedItems = (json.decode(encodedData) as List)
          .map((item) => GroceryItem.fromJson(item))
          .toList();
      emit(GroceryState(groceryItems: loadedItems));
    }
  }

  void _onAddGroceryItem(AddGroceryItem event, Emitter<GroceryState> emit) {
    final newState = List<GroceryItem>.from(state.groceryItems)..add(event.item);
    emit(GroceryState(groceryItems: newState));
    _saveListToPrefs(newState);
  }

  void _onRemoveGroceryItem(RemoveGroceryItem event, Emitter<GroceryState> emit) {
    final newState =
      List<GroceryItem>.from(state.groceryItems)..removeAt(event.index);
    emit(GroceryState(groceryItems: newState));
    _saveListToPrefs(newState);
  }

  void _onUpdateGroceryItem(UpdateGroceryItem event, Emitter<GroceryState> emit) {
    final newState = List<GroceryItem>.from(state.groceryItems);
    newState[event.index] = event.updatedItem;
    emit(GroceryState(groceryItems: newState));
    _saveListToPrefs(newState);
  }

  Future<void> _saveListToPrefs(List<GroceryItem> items) async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData =
      json.encode(items.map((item) => item.toJson()).toList());
    await prefs.setString('groceryList', encodedData);
  }
}
