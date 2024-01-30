import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Dark extends GetxController {
  var isDark = false.obs;
  var toolTip = ''.obs;
  var icon = Icons.wb_sunny_outlined.obs;

  Future<void> toggleTheme() async {
    if (!isDark.value) {
      Get.changeTheme(ThemeData.dark());
      toolTip.value = 'Switch to Light Theme';
      icon.value = Icons.wb_sunny;
      update();
    } else {
      Get.changeTheme(ThemeData.light());
      toolTip.value = 'Switch to Dark Theme';
      icon.value = Icons.wb_sunny_outlined;
      update();
    }
    isDark.value = !isDark.value;
  }
}
