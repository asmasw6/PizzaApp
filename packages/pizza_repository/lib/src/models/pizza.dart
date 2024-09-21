import 'package:pizza_repository/src/entities/pizza_entity.dart';
import 'package:pizza_repository/src/models/models.dart';

class Pizza {
  String pizzaId;
  String picture;
  bool isVeg;
  int spicy;
  String name;
  String description;
  int price;
  int discount;
  Macros macros;

  Pizza({
    required this.pizzaId,
    required this.picture,
    required this.isVeg,
    required this.description,
    required this.discount,
    required this.macros,
    required this.name,
    required this.price,
    required this.spicy,
  });

  PizzaEntity toEntity() {
    // deeling with classes that map db
    // go to database

    return PizzaEntity(
      pizzaId: pizzaId,
      picture: picture,
      isVeg: isVeg,
      description: description,
      discount: discount,
      macros: macros,
      name: name,
      price: price,
      spicy: spicy,
    );
  }

  static Pizza fromEntity(PizzaEntity entity) {
    // from database
    return Pizza(
      pizzaId: entity.pizzaId,
      picture: entity.picture,
      isVeg: entity.isVeg,
      description: entity.description,
      discount: entity.discount,
      macros: entity.macros,
      name: entity.name,
      price: entity.price,
      spicy: entity.spicy,
    );
  }
}
