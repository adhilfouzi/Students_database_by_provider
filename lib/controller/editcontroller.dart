import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_using_provider/model/student.dart';
import 'package:student_management_using_provider/model/studentfunction.dart';

class EditStudentMarkController extends GetxController {
  final MarkModel mark;
  late TextEditingController nameController;
  late TextEditingController physicsController;
  late TextEditingController chemistryController;
  late TextEditingController biologyController;
  late TextEditingController mathematicsController;
  late TextEditingController englishController;
  late TextEditingController arabicController;

  EditStudentMarkController({required this.mark});

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController(text: mark.name);
    physicsController = TextEditingController(text: mark.physics);
    chemistryController = TextEditingController(text: mark.chemistry);
    biologyController = TextEditingController(text: mark.biology);
    mathematicsController = TextEditingController(text: mark.mathematics);
    englishController = TextEditingController(text: mark.english);
    arabicController = TextEditingController(text: mark.arabic);
  }

  bool submit(formKey) {
    if (formKey.currentState!.validate()) {
      final percentage = ((int.parse(physicsController.text) +
              int.parse(chemistryController.text) +
              int.parse(biologyController.text) +
              int.parse(mathematicsController.text) +
              int.parse(englishController.text) +
              int.parse(arabicController.text)) ~/
          6);

      final studentMark = MarkModel(
        id: mark.id,
        name: nameController.text,
        physics: physicsController.text,
        chemistry: chemistryController.text,
        biology: biologyController.text,
        mathematics: mathematicsController.text,
        english: englishController.text,
        arabic: arabicController.text,
        percentage: percentage.toString(),
      );

      final studentController = Get.find<Student>();
      studentController.updateStudentMark(studentMark);

      return true;
    }
    return false;
  }

  @override
  void onClose() {
    nameController.dispose();
    physicsController.dispose();
    chemistryController.dispose();
    biologyController.dispose();
    mathematicsController.dispose();
    englishController.dispose();
    arabicController.dispose();
    super.onClose();
  }
}
