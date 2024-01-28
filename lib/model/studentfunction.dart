import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:student_management_using_provider/model/student.dart';

class Student extends GetxController {
  List<MarkModel> stList = [];
  int id = -1;
  void addStudentMark(MarkModel value) {
    value.id = id++;
    stList.add(value);
    print(value);
    update();
  }

  void delectStudentMark(int id) {
    for (int i = 0; i < stList.length; i++) {
      if (stList[i].id == id) {
        stList.removeAt(i);
      }
    }
    update();
  }

  void updateStudentMark(MarkModel value) {
    for (int i = 0; i < stList.length; i++) {
      if (stList[i].id == value.id) {
        stList[i] = value;
      }
    }
    update();
  }

  @override
  void onInit() {
    print('StudentController initialized');
    super.onInit();
  }

  @override
  void onClose() {
    print('StudentController closed');
    super.onClose();
  }
}
