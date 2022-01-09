import 'package:dokan_wedevs_assignment/models/user.dart';
import 'package:get_storage/get_storage.dart';

GetStorage box = GetStorage();

String getCheckedFilter() {
  return box.read("checked_filter") ?? "Newest";
}
void setCheckedFilter(String value) async {
  box.write("checked_filter", value);
}

String? getAuthToken() {
  return box.read("auth_token");
}
void setAuthToken(String value) async {
  box.write("auth_token", value);
}


User? getCurrentUser() {
  if(box.read("user_response") != null){
    return userFromJson(box.read("user_response"));
  }
  return null;
}

void setUserResponse(dynamic value) {
  box.write("user_response", value);
}



