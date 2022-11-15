import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MangaDesc extends StatefulWidget {
  final String mangaDesc, mangaGenres;
  const MangaDesc(
      {super.key, required this.mangaDesc, required this.mangaGenres});

  @override
  State<MangaDesc> createState() => _MangaDescState();
}

class _MangaDescState extends State<MangaDesc> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text("Gêneros",
                  style:
                      GoogleFonts.bebasNeue(color: Colors.white, fontSize: 25)),
            ),
            Divider(),
            Center(
              child: Text(widget.mangaGenres,
                  style: GoogleFonts.robotoMono(
                      color: Colors.white, fontSize: 20)),
            ),
            Divider(),
            Text("Sinopse",
                style: GoogleFonts.bebasNeue(
                  fontSize: 36,
                  textStyle: TextStyle(color: Colors.white),
                )),
            Divider(),
            Text(
              widget.mangaDesc,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
