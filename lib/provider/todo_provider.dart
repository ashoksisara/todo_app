import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../service/firebase_database_service.dart';

class TODOProvider extends ChangeNotifier {
  List<QueryDocumentSnapshot<Object?>>? data;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  FirebaseDatabaseService firebaseDatabaseService = FirebaseDatabaseService();
  DateTime? selectedDate;

  void setDate(DateTime? selectedDate) {
    this.selectedDate = selectedDate;
    notifyListeners();
  }

  void updateData(String? title, String? description, DateTime? date) {
    titleController.text = title ?? '';
    descriptionController.text = description ?? '';
    selectedDate = date;
    notifyListeners();
  }

  void readTODO() {
    firebaseDatabaseService.readTODO().listen((snapshots) {
      data = snapshots.docs;
      notifyListeners();
    });
  }

  Future<void> addTODO() async {
    final title = titleController.text;
    final description = descriptionController.text;
    await firebaseDatabaseService.addTODO(title, description,selectedDate);
  }

  Future<void> deleteTODO(String docId) async {
    await firebaseDatabaseService.deleteTODO(docId);
  }

  Future<void> updateTODO(String docId) async {
    final title = titleController.text;
    final description = descriptionController.text;
    await firebaseDatabaseService.updateTODO(docId, title, description,selectedDate);
  }

  void disposeAllValues(){
    titleController.clear();
    descriptionController.clear();
    selectedDate = null;
    data = null;
  }

}
