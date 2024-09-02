class ParkingLotModel {
  final String id;
  final String name;
  final int capacity;
  final String location;

  ParkingLotModel({
    required this.id,
    required this.name,
    required this.capacity,
    required this.location,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'capacity': capacity,
      'location': location,
    };
  }

  static ParkingLotModel fromJson(Map<String, dynamic> json) {
    return ParkingLotModel(
      id: json['id'],
      name: json['name'],
      capacity: json['capacity'],
      location: json['location'],
    );
  }
}
