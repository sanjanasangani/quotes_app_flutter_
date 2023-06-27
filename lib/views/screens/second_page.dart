import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../contoller/qoute_controller.dart';
import '../../modals/qoute_modal.dart';

class second_page extends StatefulWidget {

  @override
  State<second_page> createState() => _second_pageState();
}

class _second_pageState extends State<second_page> {
  List<String> imageAssets = [
    "assets/bgimages/1.jpeg",
    "assets/bgimages/2.jpeg",
    "assets/bgimages/3.jpeg",
    "assets/bgimages/4.jpeg",
    "assets/bgimages/5.jpeg",
    "assets/bgimages/6.jpeg",
    "assets/bgimages/7.jpeg",
    "assets/bgimages/8.jpeg",
    "assets/bgimages/9.jpeg",
    "assets/bgimages/10.jpeg",
  ];

  final QuotesController _quotesController = Get.find<QuotesController>();

  @override
  Widget build(BuildContext context) {
    final QuoteModel quote = Get.arguments as QuoteModel;

    return Scaffold(
      appBar: AppBar(
        title:  Text("${quote.category}"),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: quote.quotes.length,
        itemBuilder: (context, index) {
          final Quote currentQuote = quote.quotes[index];
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              height: Get.height * 0.6,
              width: Get.width,
              decoration:  BoxDecoration(
                color: Colors.grey,
                borderRadius:BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(imageAssets[index % imageAssets.length]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12,top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: IconButton(onPressed: (){
                            Get.toNamed("/edit", arguments: currentQuote)
                                ?.then((value) {
                              if (value != null) {
                                setState(() {
                                  quote.quotes[index] = value;
                                });
                              }
                            });
                          }, icon: const Icon(Icons.edit),iconSize: 25,color: Colors.black,) ,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16,right: 16),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "“",
                                  style: TextStyle(color: Colors.white, fontSize: 80),
                                ),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 50,
                            left: 50,
                          ),
                          child: Text(currentQuote.quote,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16,right: 16),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "”",
                                  style: TextStyle(color: Colors.white, fontSize: 80),
                                )
                              ]),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child:  Row(
                                children: [
                                  const Icon(CupertinoIcons.heart),
                                  SizedBox(
                                    width:Get.width * 0.01,
                                  ),
                                  const Text(
                                    "Like",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child:  Row(
                                children: [
                                  const Icon(Icons.download),
                                  SizedBox(
                                    width:Get.width * 0.01,
                                  ),
                                  const Text(
                                    "Save",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Clipboard.setData(ClipboardData(
                                  text: currentQuote.quote))
                                  .then(
                                    (value) => Get.snackbar(
                                  "Quotes",
                                  "Copy  Clipboard",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.white.withOpacity(0.6),
                                  padding: const EdgeInsets.all(
                                    10,
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                const Icon(Icons.copy),
                                SizedBox(
                                  width:Get.width * 0.01,
                                ),
                                const Text(
                                  "Copy",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Share.share(currentQuote.quote);
                            },
                            child: Row(
                              children: [
                                const Icon(Icons.share),
                                SizedBox(
                                  width:Get.width * 0.01,
                                ),
                                const Text(
                                  "Share",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      backgroundColor: Colors.grey.shade200,
    );
  }
}
