import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:td_games/models/board.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateBoardPage extends StatefulWidget {
  const CreateBoardPage({Key? key}) : super(key: key);

  @override
  State<CreateBoardPage> createState() => _CreateBoardPageState();
}

class _CreateBoardPageState extends State<CreateBoardPage> {
  CollectionReference posts = FirebaseFirestore.instance.collection('Posts');
  final _addFormKey = GlobalKey<FormState>();
  final String _email = '${FirebaseAuth.instance.currentUser!.email}';
  final TextEditingController _bdescribe = TextEditingController();
  String? _creator;
  final Timestamp _timestamp = Timestamp.now();
  @override
  void initState() {
    super.initState();
    if (FirebaseAuth.instance.currentUser!.displayName.toString().isNotEmpty) {
      _creator = FirebaseAuth.instance.currentUser!.displayName;
    } else {
      FirebaseFirestore.instance
          .collection('Users')
          .doc('${FirebaseAuth.instance.currentUser!.uid}')
          .get()
          .then((DocumentSnapshot value) {
        Map<String, dynamic> data = value.data()! as Map<String, dynamic>;
        _creator = data["displayName"].toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: Form(
        key: _addFormKey,
        child: ListView(
          children: [
            boardDescribe(),
            postButton(),
          ],
        ),
      ),
    );
  }

  Container boardDescribe() {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(left: 32, right: 32, top: 32, bottom: 8),
      child: TextFormField(
        controller: _bdescribe,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Write Something!';
          }
          return null;
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide:
                BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide:
                BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          label: Text(
            'Post',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
    );
  }

  Widget postButton() {
    return Container(
      width: 150,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
          ),
        ),
        onPressed: addposts,
        child: const Text('Post'),
      ),
    );
  }

  Future<void> addposts() async {
    return posts
        .add({
          'creator': _creator,
          'email': _email,
          'describe': _bdescribe.text,
          'timestamp': _timestamp
        })
        .then((value) => Navigator.pop(context))
        .catchError((error) => print("Failed to add posts: $error"));
  }
}
