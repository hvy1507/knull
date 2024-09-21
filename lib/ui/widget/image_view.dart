import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path/path.dart';
import 'package:skeleton/ui/widget/clickable.dart';
import 'package:skeleton/ui/widget/interactive_image_view_dialog.dart';

class ImageView extends StatelessWidget {
  factory ImageView.asset(
      String imageResource, {
        Key? key,
        double? width,
        double? height,
        BoxFit fit = BoxFit.contain,
        Alignment alignment = Alignment.center,
        Color? color,
        bool canView = false,
      }) {
    return ImageView._(
      key: key,
      imageResource: imageResource,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      color: color,
      canView: canView,
    );
  }

  factory ImageView.network(
      String imageUrl, {
        Key? key,
        double? width,
        double? height,
        BoxFit fit = BoxFit.contain,
        Alignment alignment = Alignment.center,
        Widget Function(BuildContext context)? placeholder,
        Widget Function(
            BuildContext context,
            Widget widget,
            ImageChunkEvent? event,
            )? loadingBuilder,
        Color? color,
        bool canView = false,
      }) {
    return ImageView._(
      key: key,
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      placeholder: placeholder,
      loadingBuilder: loadingBuilder,
      color: color,
      canView: canView,
    );
  }

  factory ImageView.file(
      String path, {
        Key? key,
        double? width,
        double? height,
        BoxFit fit = BoxFit.contain,
        Alignment alignment = Alignment.center,
        Widget Function(BuildContext context)? placeholder,
        Color? color,
        bool canView = false,
      }) {
    return ImageView._(
      key: key,
      imageFile: File(path),
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      placeholder: placeholder,
      color: color,
      canView: canView,
    );
  }

  const ImageView._({
    super.key,
    this.imageResource,
    this.imageUrl,
    this.imageFile,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.placeholder,
    this.loadingBuilder,
    this.color,
    this.canView = false,
  });

  static bool _isDialogOpen = false;

  final String? imageResource;
  final String? imageUrl;
  final File? imageFile;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Alignment alignment;
  final Widget Function(BuildContext context)? placeholder;
  final Widget Function(
      BuildContext context, Widget widget, ImageChunkEvent? event)?
  loadingBuilder;
  final Color? color;
  final bool canView;

  @override
  Widget build(BuildContext context) {
    return Clickable(
      onTap: canView
          ? () async {
        if (_isDialogOpen) {
          return;
        }
        _isDialogOpen = true;

        await showInteractiveImageViewDialog(
          context,
          imageResource: imageResource,
          imageFile: imageFile?.path,
          imageUrl: imageUrl,
        );

        _isDialogOpen = false;
      }
          : null,
      child: () {
        if (imageResource != null) {
          if (imageResource!.contains(RegExp(r'.*\.svg'))) {
            return SvgPicture.asset(
              imageResource!,
              width: width,
              height: height,
              fit: fit,
              alignment: alignment,
              placeholderBuilder: placeholder,
              colorFilter: color == null
                  ? null
                  : ColorFilter.mode(color!, BlendMode.srcIn),
            );
          } else {
            return Image.asset(
              imageResource!,
              width: width,
              height: height,
              fit: fit,
              alignment: alignment,
              color: color,
              colorBlendMode: color == null ? null : BlendMode.srcIn,
            );
          }
        } else if (imageUrl != null) {
          if (imageUrl!.contains(RegExp(r'.*\.svg'))) {
            return SvgPicture.network(
              imageUrl!,
              width: width,
              height: height,
              fit: fit,
              alignment: alignment,
              placeholderBuilder: placeholder,
              colorFilter: color == null
                  ? null
                  : ColorFilter.mode(color!, BlendMode.srcIn),
            );
          } else {
            return CachedNetworkImage(
              width: width,
              height: height,
              fit: fit,
              placeholder: placeholder == null
                  ? null
                  : (context, _) {
                return placeholder!(context);
              },
              alignment: alignment,
              color: color,
              colorBlendMode: color == null ? null : BlendMode.srcIn,
              imageUrl: imageUrl!,
              progressIndicatorBuilder: placeholder != null
                  ? null
                  : (context, url, downloadProgress) {
                return Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 42,
                      maxHeight: 42,
                    ),
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      value: downloadProgress.progress,
                    ),
                  ),
                );
              },
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: Colors.red,
              ),
            );
          }
        } else {
          if (basename(imageFile!.path).contains(RegExp(r'.*\.svg'))) {
            return SvgPicture.file(
              imageFile!,
              width: width,
              height: height,
              fit: fit,
              alignment: alignment,
              placeholderBuilder: placeholder,
              colorFilter: color == null
                  ? null
                  : ColorFilter.mode(color!, BlendMode.srcIn),
            );
          } else {
            return Image.file(
              imageFile!,
              width: width,
              height: height,
              fit: fit,
              alignment: alignment,
              color: color,
              colorBlendMode: color == null ? null : BlendMode.srcIn,
            );
          }
        }
      }.call(),
    );
  }
}