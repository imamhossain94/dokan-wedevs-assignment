import 'package:dokan_wedevs_assignment/models/user.dart';
import 'package:dokan_wedevs_assignment/services/remote_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileTabController extends GetxController {
  var currentUser = User().obs;
  var updateProcess = false.obs;

  var emailController = TextEditingController().obs;
  var fullNameController = TextEditingController().obs;
  var streetAddressController = TextEditingController().obs;
  var aptSuiteBldgController = TextEditingController().obs;
  var zipCodeController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
  }

  void fetchUserDetails() async {
    User? userResponse = await RemoteService.userDetails();
    if (userResponse != null) {
      currentUser.value = userResponse;

      emailController.value.text = currentUser.value.email!;
      fullNameController.value.text = currentUser.value.name!;
      // streetAddressController.value.text = currentUser.value.name!;
      // aptSuiteBldgController.value.text = currentUser.value.name!;
      // zipCodeController.value.text = currentUser.value.name!;

    }
  }

  Future<String?> updateProfile() async {
    Map<String, String> data = {};

    if (emailController.value.text.isNotEmpty) {
      data["email"] = emailController.value.text;
    }

    if (fullNameController.value.text.isNotEmpty) {
      data["name"] = fullNameController.value.text;
    }

    if (streetAddressController.value.text.isNotEmpty) {
      data[""] = streetAddressController.value.text;
    }

    if (aptSuiteBldgController.value.text.isNotEmpty) {
      data[""] = aptSuiteBldgController.value.text;
    }

    if (zipCodeController.value.text.isNotEmpty) {
      data[""] = zipCodeController.value.text;
    }

    String? error;
    try {
      updateProcess(true);
      User? userResponse =
      await RemoteService.updateUser(currentUser.value.id!, data);

      if (userResponse != null) {
        currentUser.value = userResponse;

        emailController.value.text = currentUser.value.email!;
        fullNameController.value.text = currentUser.value.name!;
        // streetAddressController.value.text = currentUser.value.name!;
        // aptSuiteBldgController.value.text = currentUser.value.name!;
        // zipCodeController.value.text = currentUser.value.name!;
      }else{
        error = "error";
      }
    } finally {
      updateProcess(false);
    }
    return error;

  }
}
