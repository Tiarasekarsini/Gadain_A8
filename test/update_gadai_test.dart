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
    updateDataToFirestore(
        context,
        String id,
        DocumentSnapshot doc,
        String namaPenggadai,
        String nik,
        String namaBarang,
        double jumlahGadai,
        String statusGadai,
        DateTime? jatuhTempo,
        double bunga) async {
      DocumentReference documentReference = user
          .doc(gUser!.id)
          .collection('transac')
          .doc(id); // Get the document reference using the document ID

      // Update the document data
      await documentReference.update({
        'namaPenggadai': namaPenggadai,
        'nik': nik,
        'namaBarang': namaBarang,
        'jumlahGadai': jumlahGadai,
        'statusGadai': statusGadai,
        'jatuhTempo': jatuhTempo,
        'bunga': bunga,
      }).then((value) {
        // Success
        print('Data updated in Firestore!');
      }).catchError((error) {
        // Error
        print(doc.id);
        print('Failed to update data in Firestore: $error');
      });

      final DocumentSnapshot userDoc = await usersRef.doc(gUser!.id).get();
      final double currentBalance = userDoc.get('balance') ?? 0.0;

      if (statusGadai == 'Belum Lunas') {
        usersRef.doc(gUser!.id).update({
          'balance': currentBalance - jumlahGadai,
        });
      } else if (statusGadai == 'Lunas') {
        usersRef.doc(gUser!.id).update({
          'balance':
              currentBalance + jumlahGadai + (jumlahGadai * (bunga / 100.0)),
        });
      }
    }
  });
}
