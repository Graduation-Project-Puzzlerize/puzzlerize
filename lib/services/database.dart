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

  Future<String> getMentorID(String email) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('mentors')
        .where('email', isEqualTo: email)
        .get();

    return querySnapshot.docs[0].id;
  }

  Future<num> getTheRightAnswer(String question_id) async {
    DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance
            .collection('questions')
            .doc(question_id)
            .get();
    return querySnapshot['correct_answer'];
  }

  Future<num> correctAnswers(num writeAnswer) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('responses')
        .where('optionNum', isEqualTo: writeAnswer)
        .get();

    querySnapshot.docs.forEach((element) async {
      String player_id = element['player_id'];

      DocumentSnapshot<Map<String, dynamic>> player = await FirebaseFirestore
          .instance
          .collection('players')
          .doc(player_id)
          .get();

      num oldScore = player.data()?['score'];
      print(oldScore);
      FirebaseFirestore.instance
          .collection('players')
          .doc(player_id)
          .update({'score': oldScore + 1});
    });

    return querySnapshot.docs.length;
  }

  Future<num> wrongAnswers(num writeAnswer) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('responses')
        .where('optionNum', isNotEqualTo: writeAnswer)
        .get();

    return querySnapshot.docs.length;
  }

  Future<String> getQuestion(String mentor_id) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('questions')
        .where('mentor_id', isEqualTo: mentor_id)
        .get();
    return querySnapshot.docs[0]['question'];
  }

  Future<String> getOpt1(String mentor_id) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('questions')
        .where('mentor_id', isEqualTo: mentor_id)
        .get();
    return querySnapshot.docs[0]['choices'][0];
  }

  Future<String> getOpt2(String mentor_id) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('questions')
        .where('mentor_id', isEqualTo: mentor_id)
        .get();
    return querySnapshot.docs[0]['choices'][1];
  }

  Future<String> getOpt3(String mentor_id) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('questions')
        .where('mentor_id', isEqualTo: mentor_id)
        .get();
    return querySnapshot.docs[0]['choices'][2];
  }

  Future<String> getOpt4(String mentor_id) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('questions')
        .where('mentor_id', isEqualTo: mentor_id)
        .get();
    return querySnapshot.docs[0]['choices'][3];
  }

  Future<void> deleteQ(String mentor_id) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('questions')
        .where('mentor_id', isEqualTo: mentor_id)
        .get();

    String question_id = querySnapshot.docs[0].id;

    FirebaseFirestore.instance
        .collection('questions')
        .doc(question_id)
        .delete();
  }

  void addQuestion(String question, String opt1, String opt2, String opt3,
      String opt4, String? correctAnswer, String mentor_id) {
    final CollectionReference questionsCollection =
        FirebaseFirestore.instance.collection('questions');
    questionsCollection.add({
      'question': question,
      'choices': [
        opt1,
        opt2,
        opt3,
        opt4,
      ],
      'correctAnswer': correctAnswer,
      'mentor_id': mentor_id
    }).then((value) {
      print('Question added successfully');
    }).catchError((error) {
      print('Failed to add question: $error');
    });
  }

  Future<void> addRound(String pin, String mentorID) async {
    CollectionReference gamesRef =
        FirebaseFirestore.instance.collection("rounds");
    await gamesRef.add({"pin": pin, "player_id": [], "mentor_id": mentorID});
  }

  Future<bool> isThereAnyQuesions(String mentorID) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('questions')
        .where('mentor_id', isEqualTo: mentorID)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }
}
