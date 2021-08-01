import 'package:flutter/material.dart';
import 'package:shutterstock_repository/shutterstock_repository.dart';

class ArtistListItem extends StatelessWidget {
  const ArtistListItem({Key? key, required this.imageAssets}) : super(key: key);

  final Assets imageAssets;

  @override
  Widget build(BuildContext context) {
    return  Container(
      constraints: BoxConstraints(
        minWidth: 100,
        minHeight: 100,
        maxHeight: double.parse(imageAssets.preview!.height!.toString()),
        maxWidth: double.parse(imageAssets.preview!.width!.toString()),
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageAssets.preview!.url!)
        )
      ),
    );
  }
}
