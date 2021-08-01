import 'package:flutter/material.dart';
import 'package:shutterstock/shutterstock/global/global.dart';
import 'package:shutterstock_repository/shutterstock_repository.dart';

import 'artist_list_item.dart';

class ImagesListView extends StatelessWidget {
  ImagesListView({Key? key, required this.shutterstockImages})
      : super(key: key);
  final ShutterstockImages shutterstockImages;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: shutterstockImages.data!.length,
      separatorBuilder: (_, index) => const SizedBox(height: 6),
      itemBuilder: (_, int index) {
        return index >= shutterstockImages.data!.length
            ? BottomLoader()
            : ArtistListItem(
                imageAssets: shutterstockImages.data![index].assets!,
              );
      },
    );
  }
}
