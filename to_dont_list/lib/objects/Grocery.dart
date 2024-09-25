// Data class to keep the string and have an abbreviation function

class Grocery {
  Grocery ({required this.name, required this.price});

  final String name;
  final int price;
  int count = 1;


  int increase() {
    return count++;
  }
}
