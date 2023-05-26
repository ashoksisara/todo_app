import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_auth_service.dart';

class FirebaseDatabaseService {
  String? docId;

  String? uid = FirebaseAuthService.instance.user?.uid;

  set setDocId(String docIDArg) {
    docId = docIDArg;
  }

  List<QueryDocumentSnapshot<Object?>>? data;

  Future<bool> addTODO(String title, String description,DateTime? date) async {
    if (uid != null) {
      DocumentReference docRef =
          FirebaseFirestore.instance.collection(uid!).doc();
      await docRef.set({
        "title": title,
        "description": description,
        "time": date?.toUtc(),
        "docId": docRef.id
      });
      return true;
    } else {
      return false;
    }
  }

  Stream<QuerySnapshot<Object?>> readTODO() {
    CollectionReference colRef = FirebaseFirestore.instance.collection(uid!);
    colRef.snapshots().listen((snapshots) {
      data = snapshots.docs;
    });
    return colRef.snapshots();
  }

  Future<void> deleteTODO(docId) async {
    CollectionReference colRef = FirebaseFirestore.instance.collection(uid!);
    await colRef.doc(docId).delete();
  }

  Future<void> updateTODO(docId, String title, String description,DateTime? date) async {
    CollectionReference colRef = FirebaseFirestore.instance.collection(uid!);
    await colRef.doc(docId).update(
        {"title": title, "description": description,  "time": date?.toUtc()});
  }
}
