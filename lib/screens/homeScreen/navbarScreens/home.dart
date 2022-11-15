import 'package:dragon_mangas/controller/controller.dart';
import 'package:dragon_mangas/screens/home/widgets/carousel_loading.dart';
import 'package:dragon_mangas/screens/home/widgets/carousel_with_indicator.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomeScreenPage> {
  late Stream slides;
  bool mangaLoaded = false;
  late List<Map<String, dynamic>> mangaList;
  //Streaming function
  Stream _queryDB() => slides = FirebaseFirestore.instance
      .collection('stores')
      .snapshots()
      .map((list) => list.docs.map((doc) => doc.data()));

  @override
  void initState() {
    _queryDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(24, 24, 24, 100),
        body: Stack(
          children: [
            SizedBox(
              child: SafeArea(child: Obx(() {
                if (carouselController.isLoading.value) {
                  return const Center(
                    child: CarouselLoading(),
                  );
                } else {
                  if (carouselController.carouselItemList.isNotEmpty) {
                    return CarouselWithIndicator(
                        data: carouselController.carouselItemList);
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(Icons.hourglass_empty),
                          Text("Dados não encontrados!"),
                        ],
                      ),
                    );
                  }
                }
              })),
            ),
          ],
        ));
  }
}
