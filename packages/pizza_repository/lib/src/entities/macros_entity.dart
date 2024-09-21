class MacrosEntity {
  int calories;
  int proteins;
  int carbs;
  int fats;
  MacrosEntity({
    required this.calories,
    required this.carbs,
    required this.proteins,
    required this.fats,
  });

  Map<String, Object?> toDucument() {
    // to JSON
    return {
      "calories": calories,
      "proteins": proteins,
      "carbs": carbs,
      "fats": fats,
    };
  }

  static MacrosEntity fromDocument(Map<String, dynamic> doc) {
    return MacrosEntity(
      calories: doc["calories"],
      proteins: doc["proteins"],
      carbs: doc["carbs"],
      fats: doc["fats"],
    );
  }
}
