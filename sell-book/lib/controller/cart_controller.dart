import 'package:brainiaccommerce2/model/cart_item_model.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class CartController extends GetxController {
  RxList<CartItemModel> lists = <CartItemModel>[].obs;
  var totalItem = 0.obs;
  RxDouble subTotal = 0.0.obs;
  RxDouble totalCart = 0.0.obs;

  addToCard(CartItemModel item) {
    for (var element in lists) {
      if (element.id == item.id) {
        element.amount++;
        getTotal();
        getTotalItem();
        lists.refresh();
        return;
      }
    }
    getTotal();
    getTotalItem();
    lists.add(item);
  }

  incrementItem(String id) {
    for (var element in lists) {
      if (element.id == id) {
        element.amount++;
        getTotal();
        getTotalItem();
        lists.refresh();
        return;
      }
    }
  }

  decreaseItem(String id) {
    for (var element in lists) {
      if (element.id == id) {
        element.amount--;
        getTotal();
        getTotalItem();
        if (element.amount == 0) {
          lists.remove(element);
          getTotal();
          getTotalItem();
        }
        lists.refresh();
        return;
      }
    }
  }

  double getTotal() {
    double total = 0;
    for (var element in lists) {
      total += double.parse(element.price) * element.amount;
    }
    subTotal.value = total;
    totalCart.value = total + 25000;
    return total;
  }

  int getTotalItem() {
    int total = 0;
    for (var element in lists) {
      total += element.amount;
    }
    totalItem.value = total;
    return total;
  }
}
