import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  createUser(map, String id) async {
    return FirebaseFirestore.instance.collection('users').doc(id).set(map);
  }

  addTask(map, String userId, String taskId) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection('tasks')
        .doc(taskId)
        .set(map);
  }

  getTasks(String id) async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .collection('tasks')
        .snapshots();
  }

  deleteTasks(String userId, String taskId) async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .doc(taskId)
        .delete();
  }

  getUserName(String id) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('users')
        .where('id', isEqualTo: id)
        .get();
    var name = snapshot.docs[0]['username'];
    return name;
  }
}
