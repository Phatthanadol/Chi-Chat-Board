import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:td_games/models/board.dart';
import 'package:flutter/material.dart';

class EditBoardPage extends StatefulWidget {
  const EditBoardPage({Key? key, this.id}) : super(key: key);
  final String? id;
  @override
  State<EditBoardPage> createState() => _EditBoardPageState();
}

class _EditBoardPageState extends State<EditBoardPage> {
  final _editFormKey = GlobalKey<FormState>();

  TextEditingController _editboarddescribe = TextEditingController();
  final Timestamp _edited = Timestamp.now();

  @override
  void initState() {
    super.initState();
    getdata();
  }

  Future<void> getdata() async {
    FirebaseFirestore.instance
        .collection('Posts')
        .doc(widget.id.toString())
        .get()
        .then((DocumentSnapshot value) {
      Map<String, dynamic> data = value.data()! as Map<String, dynamic>;
      _editboarddescribe = data["describe"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Board'),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: Form(
        key: _editFormKey,
        child: mainInput(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Move to Add Product Page
          var alertDialog = AlertDialog(
            title: const Text('Delete Post Confirmation'),
            content: Text('Do you want to Delete This Post'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Nope')),
              TextButton(
                  onPressed: () {
                    deletePost();
                    Navigator.pop(context);
                  },
                  child: const Text('Yes')),
            ],
          );
          // Show Alert Dialog
          showDialog(context: context, builder: (context) => alertDialog);
        },
        child: const Icon(Icons.delete_forever),
        backgroundColor: Color.fromARGB(255, 165, 7, 7),
      ),
    );
  }

  Widget mainInput() {
    return ListView(
      children: [
        editboarddescribe(),
        editButton(),
      ],
    );
  }

  Container editboarddescribe() {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(left: 32, right: 32, top: 32, bottom: 8),
      child: TextFormField(
        controller: _editboarddescribe,
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
                BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2),
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
          prefixIcon: Icon(
            Icons.emoji_objects,
            color: Color.fromARGB(255, 0, 0, 0),
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

  Widget editButton() {
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
        onPressed: updateForum,
        child: const Text('Edit'),
      ),
    );
  }

  Future<void> updateForum() async {
    return FirebaseFirestore.instance
        .collection('Posts')
        .doc(widget.id.toString())
        .update({'describe': _editboarddescribe.text, 'edited': _edited})
        .then((value) => Navigator.pop(context))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> deletePost() {
    return FirebaseFirestore.instance
        .collection('Posts')
        .doc(widget.id.toString())
        .delete()
        .then((value) => Navigator.pop(context))
        .catchError((error) => print("Failed to delete user: $error"));
  }
}
