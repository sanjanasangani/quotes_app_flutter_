import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import '../../modals/qoute_modal.dart';


class Edit_page extends StatefulWidget {
  const Edit_page({Key? key}) : super(key: key);

  @override
  State<Edit_page> createState() => _Edit_pageState();
}

class _Edit_pageState extends State<Edit_page> {
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


  List<String?> googleFonts = [
    GoogleFonts.roboto().fontFamily,
    GoogleFonts.lato().fontFamily,
    GoogleFonts.openSans().fontFamily,
    GoogleFonts.montserrat().fontFamily,
    GoogleFonts.quicksand().fontFamily,

  ];

  int currentImageIndex = 0;
  int currentFontIndex = 0;
  var textSize = 14.0;
  var verticalSpacing = 1.0;
  var textLineSpace = 1.0;

  @override
  Widget build(BuildContext context) {
    Quote currentQuote =Get.arguments as Quote;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: const Text(
          'Edit Image',
        ),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    currentImageIndex = (currentImageIndex + 1) % imageAssets.length;
                  });
                },
                child: Container(
                  height: Get.height * 0.7,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(imageAssets[currentImageIndex]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            currentQuote.quote,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: textSize,
                              letterSpacing: textLineSpace,
                              height: textLineSpace + verticalSpacing,
                              fontFamily: googleFonts[currentFontIndex],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: Get.width * 0.1,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (textSize >= 11) {
                                        textSize = textSize - 1.0;
                                      }
                                      print(textSize);
                                    });
                                  },
                                  child: Container(
                                    height: Get.height * 0.05,
                                    width: Get.width * 0.1,
                                    decoration: (BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),

                                    )),
                                    child: const Icon(Icons.remove,color: Colors.white),
                                  ),
                                ),
                                SizedBox(width: Get.width * 0.03),
                                Text("$textSize",style: TextStyle(color: Colors.white)),
                                SizedBox(width: Get.width * 0.03),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (textSize <= 29) {
                                        textSize = textSize + 1.0;
                                      }
                                      print(textSize);
                                    });
                                  },
                                  child: Container(
                                    height: Get.height * 0.05,
                                    width: Get.width * 0.1,
                                    decoration: (BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),

                                    )),
                                    child: const Icon(Icons.add,color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (verticalSpacing > 0.1) {
                                        verticalSpacing -= 0.1;
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: Get.height * 0.05,
                                    width: Get.width * 0.1,
                                    decoration: (BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),

                                    )),
                                    child: const Icon(Icons.remove,color: Colors.white),
                                  ),
                                ),
                                SizedBox(width: Get.width * 0.05),
                                Text(verticalSpacing.toStringAsFixed(1),style: TextStyle(color: Colors.white)),
                                SizedBox(width: Get.width * 0.03),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      verticalSpacing += 0.1;
                                    });
                                  },
                                  child: Container(
                                    height: Get.height * 0.05,
                                    width: Get.width * 0.1,
                                    decoration: (BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),

                                    )),
                                    child: const Icon(Icons.add,color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            Expanded(
              child: Container(
                height: Get.height * 0.05,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentImageIndex = (currentImageIndex + 1) % imageAssets.length;
                        });
                      },
                      child: const Icon(
                        Icons.photo,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    GestureDetector(
                      onTap:() {
                        setState(() {
                          currentFontIndex = (currentFontIndex + 1) % googleFonts.length;
                        });
                      },
                      child: const Icon(
                        Icons.text_format_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        CupertinoIcons.heart,
                        color: Colors.white,
                        size: 30,
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
                      child: const Icon(
                        Icons.copy,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Share.share(currentQuote.quote);
                      },
                      child: const Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 30,
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
  }
}
