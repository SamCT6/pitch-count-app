
class Grocery {
  Grocery ({required this.name});

  final String name;
  int count = 1;

  int increase() {
    return count++;
  }
}