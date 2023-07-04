import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:share_plus/share_plus.dart';
import '../../contoller/qoutestitle_controller.dart';
import '../../modals/quote_database.dart';
import '../../utils/attributes.dart';

class quotespage extends StatefulWidget {
  const quotespage({super.key});

  @override
  State<quotespage> createState() => _quotespageState();
}

class _quotespageState extends State<quotespage> {
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

  TitleController titleController = Get.find<TitleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Obx(() => Text(titleController.categoryName.value,style: TextStyle(fontWeight: FontWeight.bold),)),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder(
        future: getAllQuotes,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<QuotesDatabaseModel>? data = snapshot.data;
            if (data == null || data.isEmpty) {
              return const Center(
                child: Text("NO DATA AVAILABLE"),
              );
            } else {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: Container(
                        height: Get.height * 0.6,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(
                                imageAssets[index % imageAssets.length]),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 12, top: 12),
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
                                    child: IconButton(
                                      onPressed: () {
                                        Get.toNamed(
                                          "/edit",
                                          arguments: data[index].quotes,
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                      ),
                                      iconSize: 25,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 16, right: 16),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "“",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 80),
                                          ),
                                        ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 50,
                                      left: 50,
                                    ),
                                    child: Text(
                                      data[index].quotes,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 16, right: 16),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "”",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 80),
                                          )
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(CupertinoIcons.heart),
                                            SizedBox(
                                              width: Get.width * 0.01,
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
                                        child: Row(
                                          children: [
                                            const Icon(Icons.download),
                                            SizedBox(
                                              width: Get.width * 0.01,
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
                                        Clipboard.setData(
                                          ClipboardData(
                                            text: data[index].quotes,
                                          ),
                                        ).then(
                                          (value) => Get.snackbar(
                                            "Quotes",
                                            "Copy  Clipboard",
                                            snackPosition: SnackPosition.BOTTOM,
                                            backgroundColor:
                                                Colors.white.withOpacity(0.6),
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
                                            width: Get.width * 0.01,
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
                                        Share.share(
                                          data[index].quotes,
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          const Icon(Icons.share),
                                          SizedBox(
                                            width: Get.width * 0.01,
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
                    ),
                  );
                },
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
