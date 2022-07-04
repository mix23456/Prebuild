import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:responsive/constructor/presetTheme.dart';

import '../provider/themeProvider.dart';

class ChangeLightDarkmode extends StatelessWidget {
  const ChangeLightDarkmode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
        value: context.watch<Themeprovider>().isDarkmode,
        onChanged: (bool value) {
          context.read<Themeprovider>().toggleTheme(value);
        });
  }
}
