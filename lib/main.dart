import 'package:dbminer_quotes_app/views/screens/edit_page.dart';
import 'package:dbminer_quotes_app/views/screens/second_page.dart';
import 'package:dbminer_quotes_app/views/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: "/",page:() => HomePage(),),
        GetPage(name: "/second",page:() => second_page(),),
        GetPage(name: "/edit",page:() => Edit_page(),),
      ],
    ),
  );
}