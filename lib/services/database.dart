import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  isPINValid(String pin) async {
    QuerySnapshot result = await FirebaseFirestore.instance
        .collection("rounds")
        // .where("pin", isEqualTo: pin)
        .get();
    print(result.docs.map((e) => e.data()));
    return result;
  }
}
