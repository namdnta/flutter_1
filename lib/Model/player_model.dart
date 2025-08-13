class PlayerModel {
  String name;
  String position;
  int jerseyNumber;

  PlayerModel({
    required this.name,
    required this.position,
    required this.jerseyNumber,
  });

  factory PlayerModel.fromJson(Map<String, dynamic> json) {
    return PlayerModel(
      name: json['name'] ?? '',
      position: json['position'] ?? '',
      jerseyNumber: json['jerseyNumber'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'position': position,
      'jerseyNumber': jerseyNumber,
    };
  }
}