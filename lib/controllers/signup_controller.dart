import 'package:dokan_wedevs_assignment/models/signup.dart';
import 'package:dokan_wedevs_assignment/services/remote_service.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  var signUpProcess = false.obs;

  Future<String?> register(
      {required String username,
      required String email,
      required String password}) async {
    String? error;
    try {
      signUpProcess(true);
      SignUp? signUpResponse = await RemoteService.registerUser(
          userName: username, email: email, password: password);

      if (signUpResponse != null) {
        if(signUpResponse.code == 200){
          error == null;
        }
      } else {
        error = "error";
      }
    } finally {
      signUpProcess(false);
    }
    return error;
  }

}
