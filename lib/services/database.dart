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

  Future<void> updateRoundInfo(String nickname, String roundPIN) async {
    QuerySnapshot<Map<String, dynamic>> round = await FirebaseFirestore.instance
        .collection('rounds')
        .where("pin", isEqualTo: roundPIN)
        .get();

    QuerySnapshot<Map<String, dynamic>> player = await FirebaseFirestore
        .instance
        .collection('players')
        .where("nickname", isEqualTo: nickname)
        .get();

    String playerID = player.docs[0].id;

    var playersID = round.docs[0]['player_id'];
    playersID.insert(0, playerID);

    return FirebaseFirestore.instance
        .collection('rounds')
        .doc(round.docs[0].id)
        .update({
          'player_id': playersID,
        })
        .then((value) => print("Document updated"))
        .catchError((error) => print("Failed to update document: $error"));
  }
}
