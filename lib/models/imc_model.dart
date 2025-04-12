class ImcModel {
  final String sexe;
  final int taill;
  final int age;
  final int poids;
  final double result;

  ImcModel({
    required this.sexe,
    required this.taill,
    required this.age,
    required this.poids,
    required this.result,
  });

  ImcModel copyWith({
    String? sexe,
    int? taill,
    int? age,
    int? poids,
    double? result,
  }) => ImcModel(
    sexe: sexe ?? this.sexe,
    taill: taill ?? this.taill,
    age: age ?? this.age,
    poids: poids ?? this.poids,
    result: result ?? this.result,
  );
}
