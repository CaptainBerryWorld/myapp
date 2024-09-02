class TicketModel {
  final String id;
  final String userId;
  final String parkingLot;
  final String startTime;
  final String duration;
  final double price;
  final String status;

  TicketModel({
    required this.id,
    required this.userId,
    required this.parkingLot,
    required this.startTime,
    required this.duration,
    required this.price,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'parkingLot': parkingLot,
      'startTime': startTime,
      'duration': duration,
      'price': price,
      'status': status,
    };
  }

  static TicketModel fromJson(Map<String, dynamic> json) {
    return TicketModel(
      id: json['id'],
      userId: json['userId'],
      parkingLot: json['parkingLot'],
      startTime: json['startTime'],
      duration: json['duration'],
      price: json['price'],
      status: json['status'],
    );
  }
}
