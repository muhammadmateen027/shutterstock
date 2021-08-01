import 'package:json_annotation/json_annotation.dart';

import 'image_data.dart';
/// page : 2
/// per_page : 2
/// total_count : 161330
/// search_id : "31427539-19bc-45d9-9ab0-1723b17f992b"
/// data : [{"id":"1859243170","aspect":1.5,"assets":{"preview":{"height":300,"url":"https://image.shutterstock.com/display_pic_with_logo/283466185/1859243170/stock-photo-man-being-in-upside-down-position-inside-a-hole-dug-in-the-snow-at-the-top-of-a-remote-mountain-1859243170.jpg","width":450},"small_thumb":{"height":67,"url":"https://thumb1.shutterstock.com/thumb_small/283466185/1859243170/stock-photo-man-being-in-upside-down-position-inside-a-hole-dug-in-the-snow-at-the-top-of-a-remote-mountain-1859243170.jpg","width":100},"large_thumb":{"height":100,"url":"https://thumb1.shutterstock.com/thumb_large/283466185/1859243170/stock-photo-man-being-in-upside-down-position-inside-a-hole-dug-in-the-snow-at-the-top-of-a-remote-mountain-1859243170.jpg","width":150},"huge_thumb":{"height":260,"url":"https://image.shutterstock.com/image-photo/man-being-upsidedown-position-inside-260nw-1859243170.jpg","width":390},"preview_1000":{"url":"https://ak.picdn.net/shutterstock/photos/1859243170/watermark_1000/5538c0466fe6e110e3368c633baa08d9/preview_1000-1859243170.jpg","width":1000,"height":667},"preview_1500":{"url":"https://image.shutterstock.com/z/stock-photo-man-being-in-upside-down-position-inside-a-hole-dug-in-the-snow-at-the-top-of-a-remote-mountain-1859243170.jpg","width":1500,"height":1000}},"contributor":{"id":"283466185"},"description":"Man being in upside-down position inside a hole dug in the snow at the top of a remote mountain","image_type":"photo","has_model_release":true,"media_type":"image"}]
part 'shutterstock_images.g.dart';

@JsonSerializable(explicitToJson: true)
class ShutterstockImages {
  int? _page;
  int? _perPage;
  int? _totalCount;
  String? _searchId;
  List<Data>? _data;

  int? get page => _page;

  int? get perPage => _perPage;

  int? get totalCount => _totalCount;

  String? get searchId => _searchId;

  List<Data>? get data => _data;

  ShutterstockImages(
      {int? page,
      int? perPage,
      int? totalCount,
      String? searchId,
      List<Data>? data}) {
    _page = page;
    _perPage = perPage;
    _totalCount = totalCount;
    _searchId = searchId;
    _data = data;
  }

  factory ShutterstockImages.fromJson(Map<String, dynamic> json) =>
      _$ShutterstockImagesFromJson(json);
  Map<String, dynamic> toJson() => _$ShutterstockImagesToJson(this);
}









