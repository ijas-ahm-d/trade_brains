import 'package:flutter/material.dart';
import 'package:trade_brains/utils/colors.dart';

class CommonSnackBAr {
  static snackBar({
    required BuildContext context,
    required String data,
    required Color color,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: Text(
          data,
          style: const TextStyle(color: kblack),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        padding: const EdgeInsets.all(15),
        elevation: 6,
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
        clipBehavior: Clip.hardEdge,
        dismissDirection: DismissDirection.horizontal,
      ),
    );
  }
}
