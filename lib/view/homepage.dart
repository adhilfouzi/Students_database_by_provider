import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_using_provider/controller/dark.dart';
import 'package:student_management_using_provider/view/addstudentmark.dart';
import 'package:student_management_using_provider/model/studentfunction.dart';
import 'package:student_management_using_provider/view/editstudentmark.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Student());
    Dark dark = Get.put(Dark()); //Dark();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Management'),
        actions: [
          Obx(() => IconButton(
                onPressed: () {
                  dark.toggleTheme();
                },
                icon: Icon(dark.icon.value),
                tooltip: dark.toolTip.value,
              )),
        ],
      ),
      body: GetBuilder<Student>(builder: (controller) {
        return Visibility(
          visible: controller.stList.isNotEmpty,
          replacement: Center(
              child: Text(
            'NO ITEM',
            style: Theme.of(context).textTheme.headlineSmall,
          )),
          child: GetBuilder<Student>(
              // initState: (state) => Student(),
              builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: controller.stList.length,
                itemBuilder: (context, index) {
                  final core = controller.stList[index];
                  final id = core.id;
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text((index + 1).toString()),
                      ),
                      title: Text(core.name),
                      subtitle: Text('Mark : ${core.percentage}%'),
                      trailing: PopupMenuButton(
                        onSelected: (value) async {
                          if (value == 'edit') {
                            log('Edit selected with ID: $id');
                            Get.to(EditStudentMark(mark: core));
                          } else if (value == 'delete') {
                            Get.log('Delete selected with ID: $id');
                            final studentController = Get.find<Student>();
                            studentController.delectStudentMark(id!);
                          } else {
                            log('error');
                          }
                        },
                        itemBuilder: (context) {
                          return [
                            const PopupMenuItem(
                              value: 'edit',
                              child: Text('Edit'),
                            ),
                            const PopupMenuItem(
                              value: 'delete',
                              child: Text('Delete'),
                            )
                          ];
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          }),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddStudentMark());
        },
        tooltip: 'Add Student Mark',
        child: const Icon(Icons.add),
      ),
    );
  }
}
