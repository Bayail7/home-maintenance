import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:service_hub_app/routes/app_pages.dart';
import 'package:service_hub_app/utils/theme_data.dart';
import 'package:service_hub_app/utils/theme_service.dart';

Future<void> main()  async {
  GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: AppPages.routes,
    );
  }
}


