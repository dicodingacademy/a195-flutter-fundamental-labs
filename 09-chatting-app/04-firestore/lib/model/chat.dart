// todo-01-firestore-02: create a Chat class
class Chat {
 final String text;
 final String emailSender;
 final DateTime dateCreated;


 Chat({
   required this.text,
   required this.emailSender,
   required this.dateCreated,
 });


 factory Chat.fromJson(Map<String, dynamic> map) {
   return Chat(
     text: map['text'] as String,
     emailSender: map['sender'] as String,
     dateCreated: (map['dateCreated']).toDate(),
   );
 }
}
