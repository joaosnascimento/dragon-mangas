import 'package:dragon_mangas/controller/controller.dart';
import 'package:dragon_mangas/screens/home/widgets/carousel_loading.dart';
import 'package:dragon_mangas/screens/home/widgets/carousel_with_indicator.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
    );
  }
}
