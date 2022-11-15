import 'package:cached_network_image/cached_network_image.dart';
import 'package:dragon_mangas/screens/homeScreen/mangalist.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:web_scraper/web_scraper.dart';

import '../../../../model/carousel.dart';
import '../../../constants/constants.dart';

class CarouselWithIndicator extends StatefulWidget {
  final List<CarouselModel> data;

  const CarouselWithIndicator({Key? key, required this.data}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;
  bool mangaLoaded = false;
  late List<Map<String, dynamic>> mangaList;
  late List<Map<String, dynamic>> mangaUrlList;

  void fetchManga() async {
    final webscraper = WebScraper(Constants.baseUrl);

    if (await webscraper.loadWebPage('/')) {
      mangaList = webscraper.getElement(
          '#bloco-principal > div > div > a > img > img.thumbnail', ['img']);

      mangaUrlList = webscraper.getElement(
          '#bloco-principal > div > div > span > a', ['href', 'link-titulo']);

      setState(() {
        mangaLoaded = true;
      });
    }
  }

  late List<Widget> imageSliders;
  @override
  void initState() {
    fetchManga();
    imageSliders = widget.data
        .map((item) => Container(
              margin: const EdgeInsets.all(10),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  child: Stack(
                    children: <Widget>[
                      CachedNetworkImage(
                        imageUrl: item.image,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                Shimmer.fromColors(
                          highlightColor: Colors.white,
                          baseColor: Colors.grey.shade300,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                              child: AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Container(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          child: Text(
                            item.id,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Padding(padding: EdgeInsets.all(13.0)),
        Center(
          child: Text('POPULAR',
              style: GoogleFonts.bebasNeue(
                  fontSize: 36, textStyle: TextStyle(color: Colors.white))),
        ),
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.data.map((url) {
            int index = widget.data.indexOf(url);
            return Container(
              width: 12.0,
              height: 12.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? Color.fromARGB(228, 255, 255, 255)
                    : Color.fromARGB(102, 255, 255, 255),
              ),
            );
          }).toList(),
        ),
        SafeArea(
            child: mangaLoaded
                ? MangaList(
                    mangaList: mangaList,
                    mangaUrlList: mangaUrlList,
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ))
      ]),
    );
  }
}
