import 'package:brainiaccommerce2/core/service/client/api_service_client.dart';
import 'package:brainiaccommerce2/core/service/locator/api_service_path.dart';
import 'package:brainiaccommerce2/model/category_model.dart';
import 'package:brainiaccommerce2/model/product_model.dart';
import 'package:brainiaccommerce2/model/user_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Rx<UserModel> user = UserModel().obs;

  Future loadUserInfo() async {
    var value = await ApiServiceClient.get(
      uri: APIServicePath.getInfoUser(),
    );
    UserModel model = UserModel.fromJson(value);
    user.value = model;
    print("Loaded UserModel ${user.toJson()}");
  }

  Future<List<CategoryModel>> getCategories() async {
    await loadUserInfo();
    print("user ${user.value.accountId}");
    var value = await ApiServiceClient.getDynamic(
      uri: APIServicePath.getCategories(accID: user.value.accountId!),
    );
    List<CategoryModel> list =
        (value as List).map((e) => CategoryModel.fromJson(e)).toList();
    print("getCategories ${list[0].toJson()}");

    return list;
  }

  Future<List<ProductModel>> getListProduct() async {
    await loadUserInfo();
    print("user ${user.value.accountId}");
    var value = await ApiServiceClient.getDynamic(
      uri: APIServicePath.getProducts(accID: user.value.accountId!),
    );
    List<ProductModel> list = List.empty();
    try {
      list = (value as List).map((e) => ProductModel.fromJson(e)).toList();
    } catch (e) {
      return [];
    }

    return list;
  }
}
