import 'package:flutter/material.dart';
import 'package:shutterstock_repository/shutterstock_repository.dart';

class ArtistListItem extends StatelessWidget {
  const ArtistListItem({Key? key, required this.imageAssets}) : super(key: key);

  final Assets imageAssets;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 100,
        minHeight: 100,
        maxHeight: double.parse(imageAssets.preview!.height!.toString()),
        maxWidth: double.parse(imageAssets.preview!.width!.toString()),
      ),
      child: Image.network(
        imageAssets.preview!.url!,
        fit: BoxFit.cover,
        loadingBuilder: (_, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }

          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        errorBuilder: (context, Object exception, StackTrace? stackTrace) {
          return const Center(child: Text('Unable to load image'));
        },
      ),
    );
  }
}
