class planet {
  String? position;
  String? name;
  String? image;
  Object tag;
  String? velocity;
  String? distance;
  String? description;

  planet(
      {required this.name,
        required this.position,
        required this.description,
        required this.image,
        required this.tag,
        required this.distance,
        required this.velocity});

  factory planet.fromMap({required Map<String, dynamic> data}) {
    return planet(
        name: data['name'],
        position: data['position'],
        description: data['description'],
        image: data['image'],
        tag: data['tag'],
        distance: data['distance'],
        velocity: data['velocity']);
  }
}