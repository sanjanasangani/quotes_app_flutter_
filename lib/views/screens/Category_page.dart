import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../contoller/qoute_controller.dart';
import '../../contoller/qoutestitle_controller.dart';
import '../../modals/categorymodel.dart';
import '../../utils/attributes.dart';
import '../../utils/dbhelper.dart';

class categorypage extends StatefulWidget {
  const categorypage({super.key});

  @override
  State<categorypage> createState() => _categorypageState();
}

class _categorypageState extends State<categorypage> {
  Future<List<CategoryDatabaseModel>>? getalldata;
  LocalJsonController localjsoncontroller = Get.put(LocalJsonController());

  final List<Color> ColorList = [
    Colors.cyan,
    Colors.pink,
    Colors.deepPurple,
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.blueAccent,
    Colors.orange,
    Colors.brown,
    Colors.indigo,
    Colors.teal,
    Colors.purple,
    Colors.yellowAccent,
    Colors.pinkAccent,
    Colors.blueGrey,
    Colors.tealAccent,
    Colors.lightGreenAccent,
    Colors.deepPurpleAccent
  ];

  List<String> imagePaths = [
        "assets/images/Motivation.png",
        "assets/images/Inspirational.png",
        "assets/images/Love.png",
        "assets/images/Friendship.png",
        "assets/images/Success.png",
        "assets/images/Happiness.png",
        "assets/images/Wisdom.png",
        "assets/images/Funny.png",
        "assets/images/Life.png",
        "assets/images/Strength.png",
        "assets/images/Hope.png",
        "assets/images/Faith.png",
        "assets/images/Family.png",
        "assets/images/Dream.png",
        "assets/images/Education.png",
        "assets/images/Time.png",
        "assets/images/Leadership.png",
        "assets/images/Change.png",
        "assets/images/Positive.png",
        "assets/images/Encouraging.png",
        "assets/images/Determination.png",
        "assets/images/Confidence.png",
        "assets/images/Self-Love.png",
        "assets/images/Growth.png",
        "assets/images/Patience.png",
        "assets/images/Heartbreak.png",
        "assets/images/Self-care.png",
        "assets/images/Mindset.png",
        "assets/images/Creativity.png",
  ];

  @override
  void initState() {
    super.initState();
    getalldata = DBHelper.dbHelper.fatchAllCategory();
  }

  TitleController titleController = Get.put(TitleController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
             UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              accountName: const Text('Sanjana Sangani'),
              accountEmail: const Text('sanjanasangani1@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey.shade200,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Handle drawer item tap for Home
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Handle drawer item tap for Settings
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                // Handle drawer item tap for Profile
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Handle drawer item tap for Logout
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.list_rounded),
          onPressed: () {
            if (scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState!.closeDrawer();
            } else {
              scaffoldKey.currentState!.openDrawer();
            }
          },
        ),
        title: const Text("Premium Quotes",style: TextStyle()),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            onPressed: () {
             (Get.isDarkMode)
                 ?Get.changeTheme(ThemeData.light(useMaterial3: true))
                 :Get.changeTheme(ThemeData.dark(useMaterial3: true));
            },
            icon: const Icon(Icons.light),
          ),
          IconButton(
            onPressed: () {

            },
            icon: const Icon(Icons.favorite),
          ),
        ],
        // centerTitle: true,
      ),
      body: FutureBuilder(
        future: getalldata,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<CategoryDatabaseModel>? data = snapshot.data;
            if (data == null || data.isEmpty) {
              return const Center(
                child: Text("NO DATA AVAILABLE"),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(14),
                child: GridView.builder(
                  itemCount: data.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 40,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        titleController
                            .setCategoryName(data[index].category_name);
                        getAllQuotes = DBHelper.dbHelper
                            .fatchAllQuotes(id: data[index].id);
                        Get.toNamed("/quotespage");
                      },
                      child: Column(
                        children: [
                          Container(
                            height: Get.height * 0.1,
                            width: Get.width * 0.3,
                            decoration: BoxDecoration(
                              color: ColorList[index % ColorList.length]
                                  .withOpacity(0.35),
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: ColorList[index % ColorList.length]
                                      .withOpacity(0.10),
                                  width: 8),
                            ),
                            child: Image.asset(
                              imagePaths[index % imagePaths.length],
                              scale: 10,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.012,
                          ),
                          Text(
                            data[index].category_name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
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
