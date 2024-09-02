import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/models/parking_lot_model.dart';

class ParkingLotService {
  final CollectionReference _parkingLotCollection =
      FirebaseFirestore.instance.collection('parking_lots');

  Future<void> createParkingLot(ParkingLotModel parkingLot) async {
    try {
      await _parkingLotCollection.doc(parkingLot.id).set(parkingLot.toJson());
    } catch (e) {
      print(e);
    }
  }

  Stream<List<ParkingLotModel>> getParkingLots() {
    return _parkingLotCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ParkingLotModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
