import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive/constructor/colorpalette.dart';
import 'package:responsive/model/album.dart';
import 'package:responsive/provider/themeProvider.dart';

class Listcardapi extends StatelessWidget {
  const Listcardapi({Key? key, required this.alllist, required this.index})
      : super(key: key);

  final List<Album> alllist;
  final int index;

  @override
  Widget build(BuildContext context) => Card(
        color: context.watch<Themeprovider>().isDarkmode
            ? ColorPalette().backgroundDarkLightmodePalette['Darkmode20%']
            : ColorPalette().backgroundDarkLightmodePalette['Lightmode30%'],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      'Here you go : ${alllist[index].title}',
                      style:
                          TextStyle(color: Theme.of(context).iconTheme.color),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(child: Image.network(alllist[index].url)),
                ],
              ),
            ),
          ),
        ),
      );
}
