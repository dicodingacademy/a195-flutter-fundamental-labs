import 'package:chatting_app/model/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// todo-01-firestore-03: create a FirebaseFirestoreService class
class FirebaseFirestoreService {
  // todo-01-firestore-04: add construction to pass the FirebaseFirestore
  final FirebaseFirestore _firebaseFirestore;

  FirebaseFirestoreService(
    FirebaseFirestore? firebaseFirestore,
  ) : _firebaseFirestore = firebaseFirestore ??= FirebaseFirestore.instance;

  // todo-01-firestore-05: add sendMessage function to send a message to Firestore
  Future<void> sendMessage({
    required String text,
    required String emailSender,
    Timestamp? timestamp,
  }) async {
    timestamp ??= Timestamp.now();

    await _firebaseFirestore.collection('messages').add({
      'text': text,
      'sender': emailSender,
      'dateCreated': timestamp,
    });
  }

  // todo-01-firestore-06: add getMessage function to get a message in real time from Firestore
  Stream<List<Chat>> getMessage() {
    return _firebaseFirestore
        .collection('messages')
        .orderBy('dateCreated', descending: true)
        .snapshots()
        .map(
          (event) => event.docs.map(
            (e) {
              final data = Chat.fromJson(e.data());
              return data;
            },
          ).toList(),
        );
  }
}
