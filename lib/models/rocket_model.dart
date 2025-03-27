class RocketModel {
  final String id;
  final String name;
  final String country;
  final int enginesCount;
  final List<String> flickrImages;
  final bool active;
  final double costPerLaunch;
  final double successRate;
  final String description;
  final String wikipedia;
  final double heightFeet;
  final double diameterFeet;

  RocketModel({
    required this.id,
    required this.name,
    required this.country,
    required this.enginesCount,
    required this.flickrImages,
    required this.active,
    required this.costPerLaunch,
    required this.successRate,
    required this.description,
    required this.wikipedia,
    required this.heightFeet,
    required this.diameterFeet,
  });

  factory RocketModel.fromJson(Map<String, dynamic> json) {
    return RocketModel(
      id: json['id'],
      name: json['name'],
      country: json['country'],
      enginesCount: json['engines']['number'],
      flickrImages: List<String>.from(json['flickr_images']),
      active: json['active'],
      costPerLaunch: json['cost_per_launch'].toDouble(),
      successRate: json['success_rate_pct'].toDouble(),
      description: json['description'],
      wikipedia: json['wikipedia'],
      heightFeet: json['height']['feet'].toDouble(),
      diameterFeet: json['diameter']['feet'].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'country': country,
      'enginesCount': enginesCount,
      'flickrImages': flickrImages.join(','),
      'active': active ? 1 : 0,
      'costPerLaunch': costPerLaunch,
      'successRate': successRate,
      'description': description,
      'wikipedia': wikipedia,
      'heightFeet': heightFeet,
      'diameterFeet': diameterFeet,
    };
  }

  factory RocketModel.fromMap(Map<String, dynamic> map) {
    return RocketModel(
      id: map['id'],
      name: map['name'],
      country: map['country'],
      enginesCount: map['enginesCount'],
      flickrImages: map['flickrImages'].split(','),
      active: map['active'] == 1,
      costPerLaunch: map['costPerLaunch'],
      successRate: map['successRate'],
      description: map['description'],
      wikipedia: map['wikipedia'],
      heightFeet: map['heightFeet'],
      diameterFeet: map['diameterFeet'],
    );
  }

  static const Map<String, String> rocketTableSchema = {
    'id': 'TEXT PRIMARY KEY',
    'name': 'TEXT',
    'country': 'TEXT',
    'enginesCount': 'INTEGER',
    'flickrImages': 'TEXT',
    'active': 'INTEGER',
    'costPerLaunch': 'REAL',
    'successRate': 'REAL',
    'description': 'TEXT',
    'wikipedia': 'TEXT',
    'heightFeet': 'REAL',
    'diameterFeet': 'REAL',
  };
}
