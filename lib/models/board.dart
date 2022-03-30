import 'package:cloud_firestore/cloud_firestore.dart';

class Board {
  final String creator;
  final String email;
  final String boarddescribe;
  final Timestamp timestamp;
  final Timestamp edited;

  Board(this.creator, this.email, this.boarddescribe, this.timestamp,
      this.edited);
}
