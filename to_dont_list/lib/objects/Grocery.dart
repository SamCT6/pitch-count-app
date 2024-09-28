class Grocery {
  Grocery ({required this.name, required this.price});

  final String name;
  final double price;
  int count = 1;
  double total = 0;

  int increase() {
    return count++;
  }

  double calculateTotal() {
    count++;
    total = count * price;
    return total;
  }
}
