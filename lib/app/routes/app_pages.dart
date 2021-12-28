import 'package:get/get.dart';

import 'package:kekkon_revision/app/modules/cart/bindings/cart_binding.dart';
import 'package:kekkon_revision/app/modules/cart/views/cart_view.dart';
import 'package:kekkon_revision/app/modules/detail_item/bindings/detail_item_binding.dart';
import 'package:kekkon_revision/app/modules/detail_item/views/detail_item_view.dart';

import 'package:kekkon_revision/app/modules/home/bindings/home_binding.dart';
import 'package:kekkon_revision/app/modules/home/views/home_view.dart';
import 'package:kekkon_revision/app/modules/list_items/bindings/list_items_binding.dart';
import 'package:kekkon_revision/app/modules/list_items/views/list_items_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_ITEM,
      page: () => DetailItemView(),
      binding: DetailItemBinding(),
    ),
    GetPage(
      name: _Paths.LIST_ITEMS,
      page: () => ListItemsView(),
      binding: ListItemsBinding(),
    ),
  ];
}
