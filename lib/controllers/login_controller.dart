import 'package:get/get.dart';

class LoginController extends GetxController {
  String phoneNumber = "";

  updateInformation({required phoneNumber}) {
    this.phoneNumber = phoneNumber;
    update();
  }
}
