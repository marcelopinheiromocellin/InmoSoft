import 'dart:io';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:share_extend/share_extend.dart';

class PDFView extends StatelessWidget {
  final PDFDocument document;
  final String title;
  final File file;

  const PDFView({
    Key key,
    @required this.document,
    @required this.title,
    this.file,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          InkWell(
            child: Icon(Icons.share),
            onTap: () {
              ShareExtend.share(file.path, "pdf",
                  sharePanelTitle: "Compartir", subject: "");
            },
          ),
        ],
      ),
      body: SafeArea(
        child: PDFViewer(
            document: document,
            indicatorBackground: Theme.of(context).primaryColor),
      ),
    );
  }
}
