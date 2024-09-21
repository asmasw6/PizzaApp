import 'package:pizza_repository/src/entities/macros_entity.dart';

class Macros {
  int calories;
  int proteins;
  int carbs;
  int fats;
  Macros({
    required this.calories,
    required this.carbs,
    required this.proteins,
    required this.fats,
  });

  MacrosEntity toEntity() {
    // deeling with classes that map db
    // go to database

    return MacrosEntity(
      calories: calories,
      proteins: proteins,
      carbs: carbs,
      fats: fats,
    );
  }

  static Macros fromEntity(MacrosEntity entity) {
    // from database
    return Macros(
      calories: entity.calories,
      proteins: entity.proteins,
      carbs: entity.carbs,
      fats: entity.fats,
    );
  }
}
