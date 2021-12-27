import 'package:get/get.dart';

import 'package:kekkon_revision/app/modules/cart/bindings/cart_binding.dart';
import 'package:kekkon_revision/app/modules/cart/views/cart_view.dart';
import 'package:kekkon_revision/app/modules/detail_item/bindings/detail_item_binding.dart';
import 'package:kekkon_revision/app/modules/detail_item/views/detail_item_view.dart';
import 'package:kekkon_revision/app/modules/dokumentasi/bindings/dokumentasi_binding.dart';
import 'package:kekkon_revision/app/modules/dokumentasi/views/dokumentasi_view.dart';
import 'package:kekkon_revision/app/modules/entertainment/bindings/entertainment_binding.dart';
import 'package:kekkon_revision/app/modules/entertainment/views/entertainment_view.dart';
import 'package:kekkon_revision/app/modules/home/bindings/home_binding.dart';
import 'package:kekkon_revision/app/modules/home/views/home_view.dart';
import 'package:kekkon_revision/app/modules/pakaian_pria/bindings/pakaian_pria_binding.dart';
import 'package:kekkon_revision/app/modules/pakaian_pria/views/pakaian_pria_view.dart';
import 'package:kekkon_revision/app/modules/pakaian_wanita/bindings/pakaian_wanita_binding.dart';
import 'package:kekkon_revision/app/modules/pakaian_wanita/views/pakaian_wanita_view.dart';
import 'package:kekkon_revision/app/modules/undangan/bindings/undangan_binding.dart';
import 'package:kekkon_revision/app/modules/undangan/views/undangan_view.dart';
import 'package:kekkon_revision/app/modules/venue/bindings/venue_binding.dart';
import 'package:kekkon_revision/app/modules/venue/views/venue_view.dart';

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
      name: _Paths.PAKAIAN_WANITA,
      page: () => PakaianWanitaView(),
      binding: PakaianWanitaBinding(),
    ),
    GetPage(
      name: _Paths.PAKAIAN_PRIA,
      page: () => PakaianPriaView(),
      binding: PakaianPriaBinding(),
    ),
    GetPage(
      name: _Paths.VENUE,
      page: () => VenueView(),
      binding: VenueBinding(),
    ),
    GetPage(
      name: _Paths.UNDANGAN,
      page: () => UndanganView(),
      binding: UndanganBinding(),
    ),
    GetPage(
      name: _Paths.ENTERTAINMENT,
      page: () => EntertainmentView(),
      binding: EntertainmentBinding(),
    ),
    GetPage(
      name: _Paths.DOKUMENTASI,
      page: () => DokumentasiView(),
      binding: DokumentasiBinding(),
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
  ];
}
