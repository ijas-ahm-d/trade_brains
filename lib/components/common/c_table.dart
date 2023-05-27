import 'package:flutter/material.dart';

class TableWidget {
  static Widget tableCellHead(String title) {
    return TableCell(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10),
          child: Text(
            title,
            // style: barText,
          ),
        ),
      ),
    );
  }

  static Widget tableCellData(String title) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          title,
          // style: bookingText,
        ),
      ),
    );
  }
}
