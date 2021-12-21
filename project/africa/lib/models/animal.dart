class Animal {
  final String id;
  final String name;
  final String headline;
  final String description;
  final String link;
  final String image;
  final List<dynamic> gallery;
  final List<dynamic> fact;

  Animal({
    required this.id,
    required this.name,
    required this.headline,
    required this.description,
    required this.link,
    required this.image,
    required this.gallery,
    required this.fact,
  });

  factory Animal.fromJson(Map<String, dynamic> json) => Animal(
        id: json['id'],
        name: json['name'],
        headline: json['headline'],
        description: json['description'],
        link: json['link'],
        image: json['image'],
        gallery: json['gallery'],
        fact: json['fact'],
      );
}
