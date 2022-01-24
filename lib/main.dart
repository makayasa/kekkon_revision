import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kekkon_revision/app/controllers/auth_controller.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  initializeDateFormatting();
  Get.put(AuthController(), permanent: true);
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      // initialRoute: Routes.HOME,
      getPages: AppPages.routes,
      localizationsDelegates: [
        FormBuilderLocalizations.delegate,
      ],
    ),
  );
}

// class MyApp extends StatelessWidget {
//   final authC = Get.find<AuthController>();

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: authC.stremAuth,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.active) {
//           logKey('ini stream di main', snapshot.data);
//         }
//         return GetMaterialApp(
//           title: "Application",
//           initialRoute: AppPages.INITIAL,
//           getPages: AppPages.routes,
//           localizationsDelegates: [
//             FormBuilderLocalizations.delegate,
//           ],
//         );
//       },
//     );
//   }
// }
