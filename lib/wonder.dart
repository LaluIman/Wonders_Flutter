class Wonder {
  final String name;
  final String location;
  final double rating;
  final String imageUrl;
  final String description;
  bool isSaved;

  Wonder({
    required this.name,
    required this.location,
    required this.rating,
    required this.imageUrl,
    required this.description,
    this.isSaved = false, // Default is not saved
  });
}
