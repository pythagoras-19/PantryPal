class GroceryItem {
  String name;
  int quantity;

  GroceryItem({
    required this.name,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
  };

  factory GroceryItem.fromJson(Map<String, dynamic> json) {
    return GroceryItem(
        name: json['name'],
        quantity: json['quantity'],
    );
  }
}