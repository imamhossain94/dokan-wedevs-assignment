
import 'package:dokan_wedevs_assignment/models/user.dart';
import 'package:dokan_wedevs_assignment/services/get_storage_service.dart';
import 'package:dokan_wedevs_assignment/services/remote_service.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {

  var loginProcess = false.obs;

  Future<String?> login({required String email, required String password}) async {
    String? error;
    try {
      loginProcess(true);
      User? loginResponse = await RemoteService.loginUser(userName: email, password: password);

      if (loginResponse != null) {
        setAuthToken(loginResponse.token!);
      } else {
        error = "error";
      }
    } finally {
      loginProcess(false);
    }
    return error;
  }

}