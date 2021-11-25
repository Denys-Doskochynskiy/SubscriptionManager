import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:subscription_manager/data/data_model.dart';

class DatabaseServices {
  final String documentId;

  DatabaseServices({required this.documentId});

  CollectionReference reference =
      FirebaseFirestore.instance.collection("Flutter");

  Future updateData(SubscriptionData subscriptionData) async {
    return await reference.doc().set({
      "subscriptionName": subscriptionData.subscriptionName,
      "email": subscriptionData.email,
      'deadline': subscriptionData.deadline,
    });
  }

  Future deleteData() async {
    return await reference.doc(documentId).delete();
  }

  List<SubscriptionData> _dataFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return SubscriptionData(
          id: (doc.id as dynamic) ?? '',
          email: (doc.data() as dynamic)['email'] ?? '',
          subscriptionName: (doc.data() as dynamic)['subscriptionName'] ?? '',
          deadline: (doc.data() as dynamic)['deadline'] ?? '');
    }).toList();
  }

  Stream<List<SubscriptionData>> get data {
    return reference.snapshots().map(_dataFromSnapshot);
  }
}
