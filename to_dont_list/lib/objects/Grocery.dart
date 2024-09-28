// Data class to keep the string and have an abbreviation function

class Grocery {
  Grocery ({required this.name, required this.price});

  final String name;
  final double price;
  int count = 1;
  double total = 0;

  int increase() {
    return count++;
  }

  double find_total() {
    total = count * price;
    return total;
  }
}
