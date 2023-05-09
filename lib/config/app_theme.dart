import 'package:flutter/material.dart';

class AppTheme {
  

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.white,
      listTileTheme: const ListTileThemeData(
        iconColor: Colors.indigo
      ),
      iconTheme: const IconThemeData(color: Colors.indigo)
    );
  }
}
