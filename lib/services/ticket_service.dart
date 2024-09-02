import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/models/ticket_model.dart';

class TicketService {
  final CollectionReference _ticketCollection =
      FirebaseFirestore.instance.collection('tickets');

  Future<void> createTicket(TicketModel ticket) async {
    try {
      await _ticketCollection.doc(ticket.id).set(ticket.toJson());
    } catch (e) {
      print(e);
    }
  }

  Stream<List<TicketModel>> getTicketsForUser(String userId) {
    return _ticketCollection
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return TicketModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
