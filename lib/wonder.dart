class Wonder {
  final String name;
  final String location;
  final double rating;
  final String imageUrl;
  final String description; // New field for description

  const Wonder({
    required this.name,
    required this.location,
    required this.rating,
    required this.imageUrl,
    required this.description, // Updated constructor to include description
  });
}
