class GroceryItem {
  String id;
  String name;
  double price;
  bool isSelected;

  GroceryItem({
    required this.id,
    required this.name,
    required this.price,
    this.isSelected = false
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'price': price,
    'isSelected': isSelected,
  };

  factory GroceryItem.fromJson(Map<String, dynamic> json) {
    return GroceryItem(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        isSelected: json['isSelected'] ?? false,
    );
  }
}