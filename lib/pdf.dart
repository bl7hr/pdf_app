import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;

class Pdf extends StatefulWidget {
  const Pdf({super.key});

  @override
  State<Pdf> createState() => _PdfState();
}

class _PdfState extends State<Pdf> {
  PrintingInfo? printingInfo;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final info = await Printing.info();
    setState(() {
      printingInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    pw.RichText.debug = true;
    final action = <PdfPreviewAction>[
      if (!kIsWeb)
        const PdfPreviewAction(icon: Icon(Icons.save), onPressed: saveFile)
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('pdf'),
      ),
      body: PdfPreview(
        maxPageWidth: 700,
        actions: action,
        onPrinted: showPrintToast,
        onShared: showSharedToast,
        build: generatePdf,
      ),
    );
  }
}

Future<void> saveFile(context, build, PdfPageFormat pageFormat) async {
  final bytes = await build(pageFormat);
  final appDocDir = await getApplicationDocumentsDirectory();
  final appDocPath = appDocDir.path;
  final file = File('$appDocPath/document.pdf');
  print('save as file ${file.path}...');
  await file.writeAsBytes(bytes);
  await OpenFile.open(file.path);
}

void showPrintToast(context) {
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Document printed successfuly')));
}

void showSharedToast(context) {
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Document shared successfuly')));
}

Future<Uint8List> generatePdf(format) async {
  final doc = pw.Document(
    title: 'Flutter Scoole',
  );
  final logoImage = pw.MemoryImage(
      (await rootBundle.load('assets/aa.png')).buffer.asUint8List());
  final footerImage = pw.MemoryImage(
      (await rootBundle.load('assets/aa.png')).buffer.asUint8List());
  final pageTheme = await _myPageTheme(format);
  doc.addPage(pw.MultiPage(
      pageTheme: pageTheme,
      header: (final context) => pw.Image(
          alignment: pw.Alignment.topLeft,
          logoImage,
          fit: pw.BoxFit.contain,
          width: 180),
      footer: (final context) =>
          pw.Image(footerImage, fit: pw.BoxFit.scaleDown),
      build: (final context) => [
            pw.Container(
                padding: pw.EdgeInsets.only(left: 30, bottom: 20),
                child: pw.Column(children: [
                  pw.Padding(
                    padding: pw.EdgeInsets.only(top: 20),
                  ),
                  pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.end,
                            children: [
                              pw.Text('Phone:'),
                              pw.Text('Phone:'),
                            ]),
                        pw.SizedBox(width: 70),
                        pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                  '0012 455gjoerbugoengbjpo3wo eyrgihgijoijfpo\nehui jKQOPRUU WJ OWEH FJH FIUWEF 6544',
                                  style: pw.TextStyle(fontSize: 14)),
                              pw.Text(
                                  '0012 455gjoerbugoengbjpo3wo eyrgihgijoijfpo\nehui jKQOPRUU WJ OWEH FJH FIUWEF 6544',
                                  style: pw.TextStyle(fontSize: 14)),
                              pw.Text(
                                  '0012 455gjoerbugoengbjpo3wo eyrgihgijoijfpo\nehui jKQOPRUU WJ OWEH FJH FIUWEF 6544',
                                  style: pw.TextStyle(fontSize: 14)),
                              pw.Text(
                                  '0012 455gjoerbugoengbjpo3wo eyrgihgijoijfpo\nehui jKQOPRUU WJ OWEH FJH FIUWEF 6544',
                                  style: pw.TextStyle(fontSize: 14)),
                              pw.Text(
                                  '0012 455gjoerbugoengbjpo3wo eyrgihgijoijfpo\nehui jKQOPRUU WJ OWEH FJH FIUWEF 6544',
                                  style: pw.TextStyle(fontSize: 14)),
                              pw.Text(
                                  '0012 455gjoerbugoengbjpo3wo eyrgihgijoijfpo\nehui jKQOPRUU WJ OWEH FJH FIUWEF 6544',
                                  style: pw.TextStyle(fontSize: 14)),
                              pw.Text(
                                  '0012 455gjoerbugoengbjpo3wo eyrgihgijoijfpo\nehui jKQOPRUU WJ OWEH FJH FIUWEF 6544',
                                  style: pw.TextStyle(fontSize: 14)),
                              pw.Text(
                                  '0012 455gjoerbugoengbjpo3wo eyrgihgijoijfpo\nehui jKQOPRUU WJ OWEH FJH FIUWEF 6544',
                                  style: pw.TextStyle(fontSize: 14)),
                              pw.Text(
                                  '0012 455gjoerbugoengbjpo3wo eyrgihgijoijfpo\nehui jKQOPRUU WJ OWEH FJH FIUWEF 6544',
                                  style: pw.TextStyle(fontSize: 14)),
                              pw.Text(
                                  '0012 455gjoerbugoengbjpo3wo eyrgihgijoijfpo\nehui jKQOPRUU WJ OWEH FJH FIUWEF 6544',
                                  style: pw.TextStyle(fontSize: 14)),
                              pw.Text(
                                  '0012 455gjoerbugoengbjpo3wo eyrgihgijoijfpo\nehui jKQOPRUU WJ OWEH FJH FIUWEF 6544',
                                  style: pw.TextStyle(fontSize: 14)),
                              // pw.Text('0012 455gjoerbugoengbjpo3wo eyrgihgijoijfpo\nehui jKQOPRUU WJ OWEH FJH FIUWEF 6544',style: pw.TextStyle(fontSize: 14)),
                              // pw.Text('0012 455gjoerbugoengbjpo3wo eyrgihgijoijfpo\nehui jKQOPRUU WJ OWEH FJH FIUWEF 6544',style: pw.TextStyle(fontSize: 14)),
                              // pw.Text('0012 455gjoerbugoengbjpo3wo eyrgihgijoijfpo\nehui jKQOPRUU WJ OWEH FJH FIUWEF 6544',style: pw.TextStyle(fontSize: 14)),
                              // pw.Text('0012 455gjoerbugoengbjpo3wo eyrgihgijoijfpo\nehui jKQOPRUU WJ OWEH FJH FIUWEF 6544',style: pw.TextStyle(fontSize: 14)),
                              // pw.Text('0012 455gjoerbugoengbjpo3wo eyrgihgijoijfpo\nehui jKQOPRUU WJ OWEH FJH FIUWEF 6544',style: pw.TextStyle(fontSize: 14)),
                              // pw.Text('0012 455gjoerbugoengbjpo3wo eyrgihgijoijfpo\nehui jKQOPRUU WJ OWEH FJH FIUWEF 6544',style: pw.TextStyle(fontSize: 14)),
                              // pw.Text('0012 455gjoerbugoengbjpo3wo eyrgihgijoijfpo\nehui jKQOPRUU WJ OWEH FJH FIUWEF 6544',style: pw.TextStyle(fontSize: 14)),
                              // pw.Text('0012 455gjoerbugoengbjpo3wo eyrgihgijoijfpo\nehui jKQOPRUU WJ OWEH FJH FIUWEF 6544',style: pw.TextStyle(fontSize: 14)),
                            ])
                      ]),
                  pw.Container(width: 40, height: 100)
                ]))
          ]));
  return doc.save();
}

Future<pw.PageTheme> _myPageTheme(format) async {
  final logoImage = pw.MemoryImage(
      (await rootBundle.load('assets/aa.png')).buffer.asUint8List());
  return pw.PageTheme(
    margin: const pw.EdgeInsets.symmetric(
        horizontal: 1 * PdfPageFormat.cm, vertical: 0.5 * PdfPageFormat.cm),
    orientation: pw.PageOrientation.portrait,
    textDirection: pw.TextDirection.ltr,
    buildBackground: (final context) => pw.FullPage(
      ignoreMargins: true,
      child: pw.Watermark(
        angle: 20,
        child: pw.Opacity(
          opacity: 0.5,
          child: pw.Image(
              alignment: pw.Alignment.center, logoImage, fit: pw.BoxFit.cover),
        ),
      ),
    ),
  );
}
