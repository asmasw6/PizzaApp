import 'package:pizza_repository/src/entities/macros_entity.dart';
import 'package:pizza_repository/src/models/models.dart';

class PizzaEntity {
  String pizzaId;
  String picture;
  bool isVeg;
  int spicy;
  String name;
  String description;
  int price;
  int discount;
  Macros macros;

  PizzaEntity({
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

  Map<String, Object?> toDucument() {
    // to JSON
    return {
      "pizzaId": pizzaId,
      "picture": picture,
      "isVeg": isVeg,
      "description": description,
      "discount": discount,
      "macros": macros.toEntity().toDucument(),
      "name": name,
      "price": price,
      "spicy": spicy,
    };
  }

  static PizzaEntity fromDocument(Map<String, dynamic> doc) {
    return PizzaEntity(
      pizzaId: doc["pizzaId"],
      picture: doc["picture"],
      isVeg: doc["isVeg"],
      description: doc["description"],
      discount: doc["discount"],
      macros: Macros.fromEntity(
        MacrosEntity.fromDocument(doc["macros"]),
      ),
      name: doc["name"],
      price: doc["price"],
      spicy: doc["spicy"],
    );
  }
}
