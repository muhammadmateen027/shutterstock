import 'package:json_annotation/json_annotation.dart';

import 'assets.dart';
/// id : "1859243170"
/// aspect : 1.5
/// assets : {"preview":{"height":300,"url":"https://image.shutterstock.com/display_pic_with_logo/283466185/1859243170/stock-photo-man-being-in-upside-down-position-inside-a-hole-dug-in-the-snow-at-the-top-of-a-remote-mountain-1859243170.jpg","width":450},"small_thumb":{"height":67,"url":"https://thumb1.shutterstock.com/thumb_small/283466185/1859243170/stock-photo-man-being-in-upside-down-position-inside-a-hole-dug-in-the-snow-at-the-top-of-a-remote-mountain-1859243170.jpg","width":100},"large_thumb":{"height":100,"url":"https://thumb1.shutterstock.com/thumb_large/283466185/1859243170/stock-photo-man-being-in-upside-down-position-inside-a-hole-dug-in-the-snow-at-the-top-of-a-remote-mountain-1859243170.jpg","width":150},"huge_thumb":{"height":260,"url":"https://image.shutterstock.com/image-photo/man-being-upsidedown-position-inside-260nw-1859243170.jpg","width":390},"preview_1000":{"url":"https://ak.picdn.net/shutterstock/photos/1859243170/watermark_1000/5538c0466fe6e110e3368c633baa08d9/preview_1000-1859243170.jpg","width":1000,"height":667},"preview_1500":{"url":"https://image.shutterstock.com/z/stock-photo-man-being-in-upside-down-position-inside-a-hole-dug-in-the-snow-at-the-top-of-a-remote-mountain-1859243170.jpg","width":1500,"height":1000}}
/// contributor : {"id":"283466185"}
/// description : "Man being in upside-down position inside a hole dug in the snow at the top of a remote mountain"
/// image_type : "photo"
/// has_model_release : true
/// media_type : "image"
part 'image_data.g.dart';

@JsonSerializable(explicitToJson: true)
class Data {
  String? _id;
  double? _aspect;
  Assets? _assets;
  String? _description;
  String? _imageType;
  bool? _hasModelRelease;
  String? _mediaType;

  String? get id => _id;

  double? get aspect => _aspect;

  Assets? get assets => _assets;

  String? get description => _description;

  String? get imageType => _imageType;

  bool? get hasModelRelease => _hasModelRelease;

  String? get mediaType => _mediaType;

  Data(
      {String? id,
        double? aspect,
        Assets? assets,
        String? description,
        String? imageType,
        bool? hasModelRelease,
        String? mediaType}) {
    _id = id;
    _aspect = aspect;
    _assets = assets;
    _description = description;
    _imageType = imageType;
    _hasModelRelease = hasModelRelease;
    _mediaType = mediaType;
  }

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}