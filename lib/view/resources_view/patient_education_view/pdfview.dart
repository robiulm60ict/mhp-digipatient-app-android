import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import '../../../resources/colors.dart';
import '../../../resources/styles.dart';
import '../../../utils/utils.dart';
import '../../../widgets/back_button.dart';
class PdfViewerPage extends StatefulWidget {
  final String pdfUrl;

  const PdfViewerPage({required this.pdfUrl});

  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, leading: const CustomBackButton(),
        leadingWidth: leadingWidth,
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text(
          "PDF Viewer",
          style: Style.alltext_ExtraLarge_white,
        ),
      ),

      body: PDF().cachedFromUrl(
          widget.pdfUrl,
        placeholder: (progress) => Center(child: Text('$progress %')),
        errorWidget: (error) => Center(child: Text(error.toString())),
      ),
    );
  }


}
