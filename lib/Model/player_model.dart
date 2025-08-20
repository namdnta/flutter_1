class PlayerModel {
  String name;
  String position;
  int jerseyNumber;
  String? photoUrl; // Tambahkan field foto

  PlayerModel({
    required this.name,
    required this.position,
    required this.jerseyNumber,
    this.photoUrl, // Optional photo URL
  });
}
