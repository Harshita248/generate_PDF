import 'package:flutter/material.dart' as material;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'dart:io';
import 'main.dart';

orderPdfView(context, String title) async {
  final Document pdf = Document();
  pdf.addPage(
    Page(
      orientation: PageOrientation.natural,
      build: (context) => Column(
        children: [
          divider(500),
          spaceDivider(5),
          Text(
            title,
            style: TextStyle(fontSize: 40, color: PdfColors.grey),
          ),
          spaceDivider(5),
          divider(500),
          spaceDivider(60),
          Row(
            children: [
              Text(
                "Aeologic Technologies",
                textAlign: TextAlign.left,
                style: textStyle1(),
              ),
            ],
          ),
          spaceDivider(30),
          textRow(["Vendor:", "Ship To:"], textStyle1()),
          textRow(["Shop11", "HR Tech"], textStyle2()),
          textRow(["Address", "MyAddress"], textStyle2()),
          textRow(["Address", "MyAddress"], textStyle2()),
          textRow(["Address", "MyAddress"], textStyle2()),
          spaceDivider(30),
          Container(
            color: PdfColors.white,
            child: Table(
              border: TableBorder.all(color: PdfColors.black),
              children: [
                tableRow(
                    ["No.", "Name", "Qut.", "Price", "Amount"], textStyle1()),
                tableRow(["1", "APPLE", "3", "20", "60"], textStyle2()),
                tableRow(["2", "BANANA", "20", "10", "200"], textStyle2()),
                tableRow(["3", "MANGO", "2", "15", "30"], textStyle2()),
              ],
            ),
          ),
          spaceDivider(30),
          divider(500),
          spaceDivider(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    textRow(["Sub Total", "290"], textStyle2()),
                    textRow(["Discount", "90"], textStyle2()),
                    divider(500),
                    textRow(["Grand Total", "200"], textStyle2()),
                    divider(500),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );

  final String dir = (await getApplicationDocumentsDirectory()).path;
  final String path = '$dir/report.pdf';
  final File file = File(path);
  await file.writeAsBytes((await pdf.save()));
  material.Navigator.of(context).push(
    material.MaterialPageRoute(
      builder: (_) => PdfViewer(path: path),
    ),
  );
}

Widget divider(double width) {
  return Container(
    height: 3,
    width: width,
    decoration: BoxDecoration(
      color: PdfColors.grey,
    ),
  );
}

tableRow(List<String> attributes, TextStyle textStyle) {
  return TableRow(
    children: attributes
        .map(
          (e) => Text(
            "  " + e,
            style: textStyle,
          ),
        )
        .toList(),
  );
}

Widget textRow(List<String> titleList, TextStyle textStyle) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: titleList
        .map(
          (e) => Text(
            e,
            style: textStyle,
          ),
        )
        .toList(),
  );
}

TextStyle textStyle1() {
  return TextStyle(
    color: PdfColors.grey800,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
}

TextStyle textStyle2() {
  return TextStyle(
    color: PdfColors.grey,
    fontSize: 22,
  );
}

Widget spaceDivider(double height) {
  return SizedBox(height: height);
}