import 'package:dragon_mangas/screens/homeScreen/mangacard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MangaList extends StatelessWidget {
  final List<Map<String, dynamic>> mangaList;
  final List<Map<String, dynamic>> mangaUrlList;
  const MangaList({
    super.key,
    required this.mangaList,
    required this.mangaUrlList,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height,
      width: double.infinity,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Wrap(runSpacing: 10, spacing: 5, children: [
          Container(
            width: double.infinity,
            height: 30,
            padding: EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            child: Text("Atualizados Recentemente",
                style: GoogleFonts.bebasNeue(
                    fontSize: 30, textStyle: TextStyle(color: Colors.white))),
          ),
          for (int i = 0; i < mangaList.length; i++)
            MangaCard(
              mangaImg: mangaList[i]['attributes']['img'],
              mangaTitle: mangaUrlList[i]['attributes']['link-titulo'],
              mangaUrlList: mangaUrlList[i]['attributes']['href'],
            ),
        ]),
      ),
    );
  }
}
