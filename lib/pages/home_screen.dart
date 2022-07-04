import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive/constructor/colorpalette.dart';
import 'package:responsive/constructor/presetTheme.dart';
import 'package:responsive/model/album.dart';
import 'package:responsive/widget/listcardapi.dart';
import 'package:http/http.dart' as http;

import '../provider/themeProvider.dart';
import '../widget/changeLightDarkmode.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  late Future<List<Album>> futureAlbum;

  //--------------fetch-------------------------

  Future<List<Album>> getAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos/'));
    final body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return albumFromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
//--------------- Var Setup-----------

    return OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
      final bool isPortrait = orientation == Orientation.portrait; //isPortriat
      return Scaffold(
          appBar: AppBar(
              iconTheme: Theme.of(context).iconTheme,
              actions: const [ChangeLightDarkmode()],
              backgroundColor: context.watch<Themeprovider>().isDarkmode
                  ? ColorPalette().backgroundDarkLightmodePalette['Darkmode30%']
                  : ColorPalette()
                      .backgroundDarkLightmodePalette['Lightmode30%']),
// --------------------------Body----------------------------------
          body: FutureBuilder<List<Album>>(
            future: getAlbum(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isPortrait ? 2 : 4), //Grid condition
                    itemBuilder: (BuildContext context, int index) {
                      return Listcardapi(
                        alllist: snapshot.data!,
                        index: index,
                      );
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                    child: SingleChildScrollView(
                        child: Text('${snapshot.error}')));
              }

              return const Center(child: CircularProgressIndicator());
            },
          ));
    });
  }
}
