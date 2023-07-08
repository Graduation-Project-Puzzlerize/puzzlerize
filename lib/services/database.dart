import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future<bool> isPINValid(String pin) async {
    QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
        .instance
        .collection("rounds")
        .where("pin", isEqualTo: pin)
        .get();
    return result.docs.isNotEmpty;
  }

  Future<void> addPalyer(String nickname, String avatar) {
    return FirebaseFirestore.instance
        .collection('players')
        .add({'nickname': nickname, 'score': 0, 'avatar': avatar, 'winrate': 0})
        .then((value) => print("Player added"))
        .catchError((error) => print("Failed to add player: $error"));
  }
}
