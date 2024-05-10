// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brainiaccommerce2/core/service/client/api_service_client.dart';
import 'package:brainiaccommerce2/core/service/client/local_service_client.dart';
import 'package:brainiaccommerce2/core/service/locator/api_service_path.dart';
import 'package:brainiaccommerce2/model/login_model.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  String? accessToken;

  Future<bool> register(
      {required String accountId,
      required String fullName,
      required String phoneNumber,
      required String numberId,
      required String password,
      required String rePassword,
      required String gender,
      required String birthDay,
      required String schoolKey,
      required String schoolYear}) async {
    try {
      var result = await ApiServiceClient.postFormData(params: {
        'AccountID': accountId,
        'FullName': fullName,
        'PhoneNumber': phoneNumber,
        'NumberID': numberId,
        'Password': password,
        'ConfirmPassword': rePassword,
        'Gender': gender,
        'BirthDay': birthDay,
        'SchoolKey': schoolKey,
        'SchoolYear': schoolYear,
      }, uri: APIServicePath.register(), withToken: false);

      print("register ${result}");
      if (result["data"] == 'Đăng ký thành công') {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> login(
      {required String accountId, required String password}) async {
    try {
      var result = await ApiServiceClient.postFormData(
          params: {"AccountID": accountId, "Password": password},
          uri: APIServicePath.login(),
          withToken: false);
      LoginModel model = LoginModel.fromJson(result);
      print(model.toJson());
      if (model.success == null || model.success == false) {
        return false;
      }
      accessToken = model.data!.token!;
      print("accessToken ${accessToken}");
      saveAccessToken();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> forgotPass(
      String accountID, String numberID, String newpass) async {
    try {
      var result = await ApiServiceClient.postFormData(
        params: {"NumberID": numberID, "NewPassword": newpass},
        uri: APIServicePath.forgetPass(),
        withToken: true,
      );
      if (result["data"] == 'Changed Successfully') {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> changePass(String oldpass, String newpass) async {
    try {
      print('Old password: $oldpass, New password: $newpass');

      var result = await ApiServiceClient.postFormData(
        params: {"OldPassword": oldpass, "NewPassword": newpass},
        uri: APIServicePath.changePass(),
        withToken: true,
      );

      print('API Response: $result');

      if (result["data"] == 'Changed Successfully') {
        return true;
      }
      return false;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Future<bool> updateProfile({
    required String numberID,
    required String fullName,
    required String phoneNumber,
    required String gender,
    required String birthDay,
    required String schoolYear,
    required String schoolKey,
  }) async {
    try {
      var result = await ApiServiceClient.postFormData(
        params: {
          'NumberID': numberID,
          'FullName': fullName,
          'PhoneNumber': phoneNumber,
          'Gender': gender,
          'BirthDay': birthDay,
          'SchoolYear': schoolYear,
          'SchoolKey': schoolKey,
        },
        uri: APIServicePath.updateProfile(),
        withToken: true,
      );

      if (result["data"] == 'Profile updated successfully') {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<void> saveAccessToken() async {
    await LocalServiceClient.save(key: 'accessToken', value: accessToken);
  }

  Future removeToken(String key) async {
    await LocalServiceClient.remove(key);
  }

  Future getAccessToken() async {
    if (LocalServiceClient.get("accessToken") != null &&
        LocalServiceClient.get("refreshToken") != null) {
      accessToken = await LocalServiceClient.get("accessToken");
    }
  }
}
