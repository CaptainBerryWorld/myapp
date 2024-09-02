import 'package:flutter/material.dart';
import 'package:myapp/services/ticket_service.dart';
import 'package:myapp/models/ticket_model.dart';
import 'package:myapp/services/payment_service.dart';

class TicketPurchaseScreen extends StatefulWidget {
  @override
  _TicketPurchaseScreenState createState() => _TicketPurchaseScreenState();
}

class _TicketPurchaseScreenState extends State<TicketPurchaseScreen> {
  String _selectedLot = 'Lot A';
  String _selectedDuration = '1h';
  final TicketService _ticketService = TicketService();
  final PaymentService _paymentService = PaymentService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Purchase Ticket'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: _selectedLot,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLot = newValue!;
                });
              },
              items: <String>['Lot A', 'Lot B', 'Lot C']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            DropdownButton<String>(
              value: _selectedDuration,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedDuration = newValue!;
                });
              },
              items: <String>['1h', '2h', '3h']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Create a ticket and save it to Firebase
                final ticket = TicketModel(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  userId: 'USER_ID', // Replace with actual user ID
                  parkingLot: _selectedLot,
                  startTime: DateTime.now().toString(),
                  duration: _selectedDuration,
                  price: 200.0, // Price in your currency
                  status: 'active',
                );
                await _ticketService.createTicket(ticket);

                // Handle payment
                await _paymentService.makePayment(
                  context: context,
                  amount: 200.0, // Amount to be charged
                  currency: 'USD', // Use appropriate currency code
                );

                // Show confirmation message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Ticket purchased successfully!')),
                );
              },
              child: Text('Purchase'),
            ),
          ],
        ),
      ),
    );
  }
}
