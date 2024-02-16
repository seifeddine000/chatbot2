import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Sing_up_modl_view extends GetxController{
  RxBool passwordVisible=false.obs;
  Rx<TextEditingController> Email = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;
  Rx<TextEditingController> Full_name = TextEditingController().obs;
  Rx<TextEditingController> adrass = TextEditingController().obs;
  Rx<TextEditingController> phone = TextEditingController().obs;
  Rx<TextEditingController> password2 = TextEditingController().obs;
  Rx<TextEditingController> pharmcie = TextEditingController().obs;
  RxBool louading=false.obs;
  RxBool save_information=false.obs;
  RxBool is_connected =false.obs;

}