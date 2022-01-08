import 'package:get_storage/get_storage.dart';

GetStorage box = GetStorage();

String getCheckedFilter() {
  return box.read("checked_filter") ?? "Newwst";
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
