import 'package:brainiaccommerce2/model/favourite_model.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  RxList<FavoriteModel> lists = <FavoriteModel>[].obs;

  addFavourite(FavoriteModel model) {
    if (lists.isEmpty) {
      lists.add(model);
      return;
    }
    for (var element in lists) {
      if (element.id == model.id) {
        return;
      }
    }
    lists.add(model);
  }

  evenClickFavourite(String id) {
    for (var element in lists) {
      if (element.id == id) {
        lists.remove(element);
        lists.refresh();
        return;
      }
    }
  }
}
