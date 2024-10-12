import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BackgroundNetworkImage extends StatelessWidget {
  const BackgroundNetworkImage({
    super.key,
    required this.imageUrl,
    this.child,
    this.width,
    this.height,
    this.borderRadius,
    this.alignment,
    this.fit,
  });

  final String imageUrl;
  final Widget? child;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Alignment? alignment;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (_, imageProvider) => buildChild(imageProvider: imageProvider),
      errorWidget: (context, url, error) => buildChild(),
      placeholder: (context, url) => buildChild(),
    );
  }

  Widget buildChild({ImageProvider? imageProvider}) {
    return Container(
      width: width,
      height: height,
      alignment: alignment,
      decoration: BoxDecoration(
        image: imageProvider != null
            ? DecorationImage(
                image: imageProvider,
                fit: fit,
              )
            : null,
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}
