class DisplayProductModel {
  final int id;
  final String name;
  final String description;
  final int price;
  final String imagePath;
  final bool isLiked;

  DisplayProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    this.isLiked = false,
    required this.id,
  });
}
