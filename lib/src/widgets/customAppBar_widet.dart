import 'package:flutter/material.dart';
import 'package:catalogoclientes/src/utils/colors_utils.dart';

PreferredSizeWidget appbar(String title) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: AppBar(
        backgroundColor: getColor('colorPrimary'),
        title: Text(
          title,
        ),
      ), 
    );
  }