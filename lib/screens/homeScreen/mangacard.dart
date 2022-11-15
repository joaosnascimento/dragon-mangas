import 'package:dragon_mangas/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class MangaCard extends StatelessWidget {
  final String mangaImg, mangaTitle, mangaUrlList;
  const MangaCard(
      {super.key,
      required this.mangaImg,
      required this.mangaTitle,
      required this.mangaUrlList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      width: 125,
      child: GestureDetector(
        onTap: () {
          print(mangaUrlList);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailScreen(
                        mangaImg: mangaImg,
                        mangaLink: mangaUrlList,
                        mangaTitle: mangaTitle,
                      )));
        },
        child: Column(
          children: [
            Expanded(
              flex: 75,
              child: Image.network(
                mangaImg,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            Expanded(
              flex: 25,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  mangaTitle,
                  style: TextStyle(color: Colors.white),
                ),
                color: Color.fromARGB(255, 46, 46, 46),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
