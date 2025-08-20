class PlayerModel {
  String name;
  String position;
  int jerseyNumber;
  String? photoAsset; // Tambahkan field foto

  PlayerModel({
    required this.name,
    required this.position,
    required this.jerseyNumber,
    this.photoAsset, // Optional photo asset
  });
}
