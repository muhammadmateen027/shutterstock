import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

//We have used CachedNetworkImage as a image load. It'll help to load image if
// the internet is not available. As per base manager, the file duration is
// Duration maxAge = const Duration(days: 30),

class ImageView extends StatelessWidget {
  const ImageView({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder: (context, url) => const Center(
        child: SizedBox(
          width: double.maxFinite,
          height: 100,
        ),
      ),
      errorWidget: (_, message, state) {
        return const Center(
          child: SizedBox(
            width: double.maxFinite,
            height: 100,
          ),
        );
      },
      fit: BoxFit.fitWidth,
      imageUrl: imageUrl,
    );
  }
}
