// base class + polymorphism example
abstract class Drink {
  final String name;
  const Drink(this.name);

  // polymorphic price calculation
  double getPrice();
}

class Tea extends Drink {
  final bool withMint;
  const Tea({required String name, this.withMint = false}) : super(name);

  @override
  double getPrice() {
    return 5.0 + (withMint ? 1.0 : 0.0); // EGP
  }
}

class TurkishCoffee extends Drink {
  final String strength;
  const TurkishCoffee({required String name, this.strength = 'normal'})
    : super(name);

  @override
  double getPrice() {
    switch (strength) {
      case 'strong':
        return 10.0;
      case 'weak':
        return 8.0;
      default:
        return 9.0;
    }
  }
}
