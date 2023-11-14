import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gadain/view/home_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

CollectionReference user = FirebaseFirestore.instance.collection('gadai');
final GoogleSignInAccount? gUser = googleSignIn.currentUser;
final DocumentReference userRef =
    FirebaseFirestore.instance.collection('users').doc(currentUser!.id);

void main() {
  test('addDataToFirestore adds data to Firestore', () async {
    delTransacdoc(id) async {
      DocumentReference docRef =
          user.doc(gUser!.id).collection('transac').doc(id);
      final DocumentSnapshot transacDoc = await docRef.get();
      final String statusGadai = transacDoc.get('statusGadai') as String;
      final double jumlahGadai =
          transacDoc.get('jumlahGadai') as double? ?? 0.0;
      await docRef.delete();

      final DocumentSnapshot userDoc = await usersRef.doc(gUser!.id).get();
      final double currentBalance = userDoc.get('balance') ?? 0.0;

      if (statusGadai == 'Belum Lunas') {
        usersRef.doc(gUser!.id).update({
          'balance': currentBalance + jumlahGadai,
        });
      } else if (statusGadai == 'Lunas') {
        usersRef.doc(gUser!.id).update({
          'balance': currentBalance - jumlahGadai,
        });
      }
    }
  });
}
