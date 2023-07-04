import 'package:dbminer_quotes_app/views/screens/quotes_details_page.dart';
import 'package:dbminer_quotes_app/views/screens/intro_screen.dart';
import 'package:dbminer_quotes_app/views/screens/quotes_list_page.dart';
import 'package:dbminer_quotes_app/views/screens/Category_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main()async{
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.light(useMaterial3: true),
      // darkTheme: ThemeData.dark(useMaterial3: true),
      getPages: [
        GetPage(name: "/",page:() => const IntroPage(),),
        GetPage(name: "/Homepage",page:() => const HomePage(),),
        GetPage(name: "/second",page:() => const second_page(),),
        GetPage(name: "/edit",page:() => const Edit_page(),),
      ],
    ),
  );
}