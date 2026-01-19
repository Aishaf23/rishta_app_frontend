class Profile {
  final String name;
  final int age;
  final String height;
  final String profession;
  final String language;
  final String location;
  final String timeAgo;
  final String photoCount;
  final String image;
  final bool isPlus;

  Profile({
    required this.name,
    required this.age,
    required this.height,
    required this.profession,
    required this.language,
    required this.location,
    required this.timeAgo,
    required this.photoCount,
    required this.image,
    this.isPlus = false,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json["name"] ?? "",
      age: json["age"] ?? 0,
      height: json["height"] ?? "",
      profession: json["profession"] ?? "",
      language: json["language"] ?? "",
      location: json["location"] ?? "",
      timeAgo: json["timeAgo"] ?? "",
      photoCount: json["photoCount"] ?? "0",
      image: json["image"] ?? "",
      isPlus: json["isPlus"] ?? false,
    );
  }
}
