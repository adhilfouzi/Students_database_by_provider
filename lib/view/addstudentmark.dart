import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:student_management_using_provider/controller/submitbutton.dart';
import 'package:student_management_using_provider/view/homepage.dart';
import 'package:student_management_using_provider/model/student.dart';
import 'package:student_management_using_provider/model/studentfunction.dart';
import 'package:student_management_using_provider/controller/formfiled.dart';

class AddStudentMark extends StatelessWidget {
  AddStudentMark({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _physicsController = TextEditingController();
  final _chemistryController = TextEditingController();
  final _biologyController = TextEditingController();
  final _mathematicsController = TextEditingController();
  final _englishController = TextEditingController();
  final _arabicController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Student Mark')),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                TextFieldBlue(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Student name is required';
                    }
                    return null;
                  },
                  keyType: TextInputType.name,
                  controller: _nameController,
                  textcontent: 'Student Name',
                ),
                // Similar text fields for other subjects

                TextFieldBlue(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Physics Mark is required';
                    }
                    return null;
                  },
                  keyType: TextInputType.number,
                  controller: _physicsController,
                  textcontent: 'Physics Mark',
                ),
                TextFieldBlue(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Chemistry Mark is required';
                    }
                    return null;
                  },
                  keyType: TextInputType.number,
                  textcontent: 'Chemistry Mark',
                  controller: _chemistryController,
                ),
                TextFieldBlue(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Biology Mark is required';
                    }
                    return null;
                  },
                  keyType: TextInputType.number,
                  textcontent: 'Biology Mark',
                  controller: _biologyController,
                ),
                TextFieldBlue(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mathematics Mark is required';
                    }
                    return null;
                  },
                  keyType: TextInputType.number,
                  textcontent: 'Mathematics Mark',
                  controller: _mathematicsController,
                ),
                TextFieldBlue(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'English Mark is required';
                    }
                    return null;
                  },
                  keyType: TextInputType.number,
                  textcontent: 'English Mark',
                  controller: _englishController,
                ),
                TextFieldBlue(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Arabic Mark is required';
                    }
                    return null;
                  },
                  keyType: TextInputType.number,
                  textcontent: 'Arabic Mark',
                  controller: _arabicController,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                        child: SubmitButton(
                            onTap: () {
                              submit();
                            },
                            textcontent: 'Submit')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      final percentage = ((int.parse(_physicsController.text) +
              int.parse(_chemistryController.text) +
              int.parse(_biologyController.text) +
              int.parse(_mathematicsController.text) +
              int.parse(_englishController.text) +
              int.parse(_arabicController.text)) ~/
          6);

      final studentMark = MarkModel(
          name: _nameController.text,
          physics: _physicsController.text,
          chemistry: _chemistryController.text,
          biology: _biologyController.text,
          mathematics: _mathematicsController.text,
          english: _englishController.text,
          arabic: _arabicController.text,
          percentage: percentage.toString());

      // Get the instance of the Student controller
      final studentController = Get.find<Student>();

      // Add the student mark using the controller
      studentController.addStudentMark(studentMark);

      // Navigate back to the home page
      Get.offAll(() => HomePage());
    }
  }
}
