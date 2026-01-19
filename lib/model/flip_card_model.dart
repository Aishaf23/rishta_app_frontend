enum CardStatus { normal, notNow, connect }

class Profile {
  final String name;
  final String image;
  final String age;
  final String height;
  final String profession;
  final String language;
  final String location;
  final String timeAgo;
  final String photoCount;
  final bool isPlus;
  CardStatus status; 

  Profile({
    required this.name,
    required this.image,
    required this.age,
    required this.height,
    required this.profession,
    required this.language,
    required this.location,
    required this.timeAgo,
    required this.photoCount,
    required this.isPlus,
    this.status = CardStatus.normal, // <-- Default
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'],
      image: json['image'],
      age: json['age'],
      height: json['height'],
      profession: json['profession'],
      language: json['language'],
      location: json['location'],
      timeAgo: json['timeAgo'],
      photoCount: json['photoCount'],
      isPlus: json['isPlus'],
    );
  }
}
