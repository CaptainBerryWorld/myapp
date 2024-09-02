import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  final String parkingLot;
  final String startTime;
  final String duration;
  final double price;
  final String status;

  TicketCard({
    required this.parkingLot,
    required this.startTime,
    required this.duration,
    required this.price,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Parking Lot: $parkingLot'),
        subtitle: Text('Start Time: $startTime\nDuration: $duration\nPrice: \$$price'),
        trailing: Text('Status: $status'),
      ),
    );
  }
}
