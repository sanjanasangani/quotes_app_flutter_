import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../contoller/qoute_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Color> _colorlist = [
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

  final QuotesController _quotesController = Get.put(QuotesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text("Premium Quotes"),
        backgroundColor: Colors.redAccent,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))],
      ),
      body: Obx(
        () => Container(
          alignment: Alignment.center,
          child: (_quotesController.quotes.isEmpty)
              ? const CircularProgressIndicator()
              : Padding(
                padding: const EdgeInsets.all(12),
                child: GridView.builder(
                    itemCount: _quotesController.quotes.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 40,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final quote = _quotesController.quotes[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed("/second", arguments: quote);
                        },
                        child: Column(
                          children: [
                            Container(
                              height: Get.height * 0.1,
                              width: Get.width * 0.3,
                              decoration: BoxDecoration(
                                color: _colorlist[index % _colorlist.length]
                                    .withOpacity(0.35),
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: _colorlist[index % _colorlist.length]
                                        .withOpacity(0.10),
                                    width: 8),
                              ),
                              child: Image.asset(quote.image, scale: 8),
                            ),
                            SizedBox(
                              height: Get.height * 0.012,
                            ),
                            Text(
                              quote.category,
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
              ),
        ),
      ),
      backgroundColor: Colors.grey.shade200,
    );
  }
}
