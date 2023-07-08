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

  Future<String> updateRoundInfo(String nickname, String roundPIN) async {
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

    FirebaseFirestore.instance
        .collection('rounds')
        .doc(round.docs[0].id)
        .update({
          'player_id': playersID,
        })
        .then((value) => print("Document updated"))
        .catchError((error) => print("Failed to update document: $error"));

    return playerID;
  }

  Future<bool> checkCredentials(
      String enteredEmail, String enteredPassword) async {
    //access firestore
    QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
        .instance
        .collection('mentors')
        .where('email',
            isEqualTo:
                enteredEmail) //retrieve the documents that match the specified filters
        .where('password', isEqualTo: enteredPassword)
        .get();
    return result.docs.isNotEmpty;
  }

  void addResponse(num optionNum, String playerID, String roundPIN) async {
    return await FirebaseFirestore.instance
        .collection('responses')
        .add({
          'optionNum': optionNum,
          'player_id': playerID,
          'round_pin': roundPIN
        })
        .then((value) => print("Response added"))
        .catchError((error) => print("Failed to add player: $error"));
  }

  Future<bool> isEmailUsed(String email) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  void addMentor(String name, String email, String password) async {
    await FirebaseFirestore.instance.collection('mentors').add({
      'name': name,
      'email': email,
      'password': password,
    });
  }
}
