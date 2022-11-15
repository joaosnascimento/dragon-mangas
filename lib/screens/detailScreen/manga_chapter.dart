import 'package:dragon_mangas/screens/content_screens.dart';
import 'package:flutter/material.dart';

class MangaChapters extends StatelessWidget {
  final List<Map<String, dynamic>> mangaChapters;

  const MangaChapters({super.key, required this.mangaChapters});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: mangaChapters.length,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: ((context, index) {
        return SizedBox(
            height: 50,
            width: double.infinity,
            child: Material(
              color: Color.fromRGBO(24, 24, 24, 100),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ContentScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      width: 97,
                      height: 38,
                      color: Color.fromRGBO(36, 36, 36, 100),
                      child: Text(
                        mangaChapters[index]['title'],
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ))
                  ]),
                ),
              ),
            ));
      }),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
    );
  }
}
