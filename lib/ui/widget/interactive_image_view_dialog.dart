import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';

Future<void> showInteractiveImageViewDialog(
  BuildContext context, {
  String? imageResource,
  String? imageUrl,
  String? imageFile,
}) async {
  await showDialog(
    context: context,
    useSafeArea: false,
    builder: (context) {
      return InteractiveImageViewDialog(
        imageResource: imageResource,
        imageUrl: imageUrl,
        imageFile: imageFile,
      );
    },
  );
}

class InteractiveImageViewDialog extends StatelessWidget {
  const InteractiveImageViewDialog({
    super.key,
    this.imageResource,
    this.imageUrl,
    this.imageFile,
    this.backgroundColor,
    this.closeButtonStyle,
  }) : assert(imageResource != null || imageUrl != null || imageFile != null);

  final String? imageResource;
  final String? imageUrl;
  final String? imageFile;
  final Color? backgroundColor;
  final ButtonStyle? closeButtonStyle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton.filled(
          style: closeButtonStyle ??
              ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Colors.red.withOpacity(0.5),
                ),
                foregroundColor: const WidgetStatePropertyAll(Colors.white),
              ),
          icon: const Icon(
            Icons.close_rounded,
          ),
          onPressed: context.pop,
        ),
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent,
        ),
      ),
      backgroundColor: backgroundColor ?? Colors.black,
      body: PhotoView(
        imageProvider: () {
          if (imageResource != null) {
            return AssetImage(imageResource!);
          }
          if (imageUrl != null) {
            return NetworkImage(imageUrl!);
          }
          return FileImage(
            File(imageFile!),
          );
        }() as ImageProvider,
        backgroundDecoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        minScale: PhotoViewComputedScale.contained,
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
    );
  }
}
