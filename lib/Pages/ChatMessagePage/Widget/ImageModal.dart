import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:vet_pass/Variables/Constants.dart';


class ImageModal extends StatelessWidget {
  final String path;
  const ImageModal({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,

      backgroundColor: Colors.black,
      child: PhotoView(
          imageProvider:NetworkImage(path)
      ),
    );
  }
}