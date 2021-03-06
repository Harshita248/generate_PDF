import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:generate_pdf/review.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(textTheme: TextTheme()),
    home: MyPage(),
  ));
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          color: Colors.red,
          child: Text("Generate PDF"),
          onPressed: () {
            orderPdfView(context, "Purchase Order");
          },
        ),
      ),
    );
  }
}

class PdfViewer extends StatelessWidget {
  final String path;
  PdfViewer({required this.path});

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      path: path,
    );
  }
}
