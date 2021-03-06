import 'package:abctechapp/pages/home_bind.dart';
import 'package:abctechapp/pages/home_page.dart';
import 'package:abctechapp/pages/initial_bind.dart';
import 'package:abctechapp/pages/initial_page.dart';
import 'package:abctechapp/pages/order_bind.dart';
import 'package:abctechapp/pages/order_page.dart';
import 'package:abctechapp/provider/assistance_provider.dart';
import 'package:abctechapp/services/assistance_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  initServices();
  runApp(const MyApp());
}

void initServices() async {
  await Get.putAsync(() => AssistanceService().init(AssistanceProvider()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      getPages: [
        GetPage(name: "/", page: () => const InitialPage(), binding: InitialBind()),
        GetPage(
            name: "/order",
            page: () => const OrderPage(),
            binding: OrderBind()),
        GetPage(
            name: "/services",
            page: () => const HomePage(),
            binding: HomeBind()),
      ],
    );
  }
}
