import 'package:dragon_mangas/screens/home/widgets/manga_info_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MangaInfo extends StatelessWidget {
  final String mangaImg;
  final String mangaAutor;
  const MangaInfo({
    super.key,
    required this.mangaImg,
    required this.mangaAutor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 390,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 35,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          mangaImg,
                          height: 223,
                          width: 159,
                        ),
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      MangaInfoBar(icon: Icons.bookmark_add, title: ''),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color.fromRGBO(36, 36, 36, 100),
            ),
            height: 60,
            width: 321,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'ATUALIZADO EM:',
                        style: GoogleFonts.bebasNeue(
                            color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        mangaAutor,
                        style: GoogleFonts.bebasNeue(
                            color: Colors.white, fontSize: 20),
                      ),
                    ]),
              ],
            ),
          )
        ],
      ),
    );
  }
}
