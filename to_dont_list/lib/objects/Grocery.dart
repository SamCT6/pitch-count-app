class Grocery {
  Grocery ({required this.name, required this.price});

  final String name;
  final double price;
  int count = 1;

  int increase() {
    return count++;
  }
}
