//import 'package:open_file/open_file.dart';
// import 'package:share_plus/share_plus.dart';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';

import 'package:pdf/widgets.dart'as  pw;

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class PdfApi {
  static Future<File> genrateText({required String text}) async {
    final font =await rootBundle.load("Asset/fonts/OpenSans_Condensed-Bold.ttf");
    final ttf = pw.Font.ttf(font);

    final pdf = pw.Document();

    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Center(
          //font: ttf,
          child: pw.Text("hi xdz x", style: pw.TextStyle( fontSize: 40)),
        );
      },
    ));

    return saveDocument(pdf: pdf, name: "exxxample.pdf");
  }
  

  static Future<File> saveDocument(
      {required pw.Document pdf, required String name}) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/cxexxxamplegv.pdf');

    print("file pathhhhh is " + file.path);
    print("file  is saveddddd ");
    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile({required File myfile}) async {
    // await Share.shareFiles([myfile.path]);
    final url = myfile.path;
    await OpenFile.open(url);
    print("file is opened");
  }
}
