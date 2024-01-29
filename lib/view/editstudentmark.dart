import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_using_provider/controller/editcontroller.dart';
import 'package:student_management_using_provider/controller/submitbutton.dart';
import 'package:student_management_using_provider/view/homepage.dart';
import 'package:student_management_using_provider/model/student.dart';
import 'package:student_management_using_provider/controller/formfiled.dart';

class EditStudentMark extends StatelessWidget {
  final MarkModel mark;
  EditStudentMark({Key? key, required this.mark}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditStudentMarkController>(
      init: EditStudentMarkController(mark: mark),
      builder: (controller) => Scaffold(
        appBar: AppBar(title: const Text('Edit Student Mark')),
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
                    controller: controller.nameController,
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
                    controller: controller.physicsController,
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
                    controller: controller.chemistryController,
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
                    controller: controller.biologyController,
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
                    controller: controller.mathematicsController,
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
                    controller: controller.englishController,
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
                    controller: controller.arabicController,
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
                            if (controller.submit(_formKey)) {
                              Get.offAll(() => const HomePage());
                            } else {
                              // Handle submission failure
                            }
                          },
                          textcontent: 'Save Changes',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
