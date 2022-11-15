import 'package:dragon_mangas/screens/detailScreen/manga_chapter.dart';
import 'package:dragon_mangas/screens/detailScreen/manga_description.dart';
import 'package:dragon_mangas/screens/detailScreen/manga_info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:web_scraper/web_scraper.dart';

class DetailScreen extends StatefulWidget {
  final String mangaImg, mangaTitle, mangaLink;
  final String baseUrl = 'https://unionleitor.top/';

  const DetailScreen(
      {key,
      required this.mangaImg,
      required this.mangaLink,
      required this.mangaTitle})
      : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late String mangaGenres, mangaAutor, mangaDesc;
  // mangalink

  late List<Map<String, dynamic>> mangaDetail;
  late List<Map<String, dynamic>> mangaGenresList;
  late List<Map<String, dynamic>> mangaDescList;
  late List<Map<String, dynamic>> mangaChapter;
  late List<Map<String, dynamic>> mangaAutors;

  bool dataFetch = false;

  void getMangaInfos() async {
    String tempBaseUrl = widget.baseUrl;
    String tempRoute = widget.baseUrl.split('/')[0] + widget.mangaLink;

    final webscraper = WebScraper(tempBaseUrl);

    if (await webscraper.loadWebPage(tempRoute)) {
      mangaDetail = webscraper.getElement(
          'body > div.content > div > div.content_post > div > div > div.boxAnimeSobreLast',
          []);

      mangaGenresList =
          webscraper.getElement('div.content_post > ul > li > a', []);

      mangaDescList = webscraper.getElement('ul.lancamento-list > p', []);

      mangaChapter = webscraper.getElement(
          'div.content_post > div > div.manga-chapters > div.single-chapter',
          ['href']);
      mangaAutors = webscraper.getElement(
          'body > div.content > div.content_post > div.boxAnimeSobreLast > span',
          []);
    }

    mangaGenres = mangaGenresList.toString();
    mangaDesc = mangaDescList.toString();
    mangaAutor = mangaAutors.toString();

    print(mangaChapter);
    setState(() {
      dataFetch = true;
    });
    //print(mangaAuthor);
    //print(mangaStatus);
  }

  @override
  void initState() {
    super.initState();
    getMangaInfos();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.mangaTitle,
              style: GoogleFonts.bebasNeue(color: Colors.white, fontSize: 30)),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Color.fromARGB(255, 31, 31, 31),
        ),
        body: dataFetch
            ? Container(
                height: screenSize.height,
                width: screenSize.width,
                color: Color.fromARGB(255, 31, 31, 31),
                child: SingleChildScrollView(
                  child: Column(children: [
                    // mangaInfo
                    MangaInfo(
                      mangaImg: widget.mangaImg, mangaAutor: mangaAutor,

                      //  mangaAuthor: mangaAuthor
                    ),

                    MangaDesc(mangaDesc: mangaDesc, mangaGenres: mangaGenres),
                    Divider(),
                    Container(
                      padding: EdgeInsetsDirectional.all(8.0),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'CAPÍTULOS',
                        style: GoogleFonts.bebasNeue(
                            color: Colors.white, fontSize: 36),
                      ),
                    ),
                    MangaChapters(mangaChapters: mangaChapter)
                  ]),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
