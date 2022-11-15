import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  late List<Map<String, dynamic>> contentPages;
  bool dataFetched = false;

  void getContent() async {
    final webscraper = WebScraper('https://unionleitor.top/');
    String tempRoute = 'leitor/One_Piece/1066';

    if (await webscraper.loadWebPage(tempRoute)) {
      contentPages =
          webscraper.getElement('div.col-sm-12.text-center > img', ['src']);

      setState(() {
        dataFetched = true;
        print(contentPages);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dataFetched
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: contentPages.length,
              itemBuilder: ((context, index) {
                return Image.network(
                  contentPages[index]['attributes']['src'],
                  fit: BoxFit.cover,
                  errorBuilder:
                      (BuildContext context, Object exception, stackTrace) =>
                          Icon(
                    Icons.error,
                  ),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(child: CircularProgressIndicator());
                  },
                );
              }))
          : Center(child: CircularProgressIndicator()),
    );
  }
}
