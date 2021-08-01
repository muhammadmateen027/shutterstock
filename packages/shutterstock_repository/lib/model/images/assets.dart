import 'package:json_annotation/json_annotation.dart';

import 'assets/assets.dart';
/// preview : {"height":300,"url":"https://image.shutterstock.com/display_pic_with_logo/283466185/1859243170/stock-photo-man-being-in-upside-down-position-inside-a-hole-dug-in-the-snow-at-the-top-of-a-remote-mountain-1859243170.jpg","width":450}
/// small_thumb : {"height":67,"url":"https://thumb1.shutterstock.com/thumb_small/283466185/1859243170/stock-photo-man-being-in-upside-down-position-inside-a-hole-dug-in-the-snow-at-the-top-of-a-remote-mountain-1859243170.jpg","width":100}
/// large_thumb : {"height":100,"url":"https://thumb1.shutterstock.com/thumb_large/283466185/1859243170/stock-photo-man-being-in-upside-down-position-inside-a-hole-dug-in-the-snow-at-the-top-of-a-remote-mountain-1859243170.jpg","width":150}
/// huge_thumb : {"height":260,"url":"https://image.shutterstock.com/image-photo/man-being-upsidedown-position-inside-260nw-1859243170.jpg","width":390}
/// preview_1000 : {"url":"https://ak.picdn.net/shutterstock/photos/1859243170/watermark_1000/5538c0466fe6e110e3368c633baa08d9/preview_1000-1859243170.jpg","width":1000,"height":667}
/// preview_1500 : {"url":"https://image.shutterstock.com/z/stock-photo-man-being-in-upside-down-position-inside-a-hole-dug-in-the-snow-at-the-top-of-a-remote-mountain-1859243170.jpg","width":1500,"height":1000}
part 'assets.g.dart';

@JsonSerializable(explicitToJson: true)
class Assets {
  Preview? _preview;
  SmallThumb? _smallThumb;
  LargeThumb? _largeThumb;
  HugeThumb? _hugeThumb;
  Preview_1000? _preview1000;
  Preview_1500? _preview1500;

  Preview? get preview => _preview;

  SmallThumb? get smallThumb => _smallThumb;

  LargeThumb? get largeThumb => _largeThumb;

  HugeThumb? get hugeThumb => _hugeThumb;

  Preview_1000? get preview1000 => _preview1000;

  Preview_1500? get preview1500 => _preview1500;

  Assets(
      {Preview? preview,
        SmallThumb? smallThumb,
        LargeThumb? largeThumb,
        HugeThumb? hugeThumb,
        Preview_1000? preview1000,
        Preview_1500? preview1500}) {
    _preview = preview;
    _smallThumb = smallThumb;
    _largeThumb = largeThumb;
    _hugeThumb = hugeThumb;
    _preview1000 = preview1000;
    _preview1500 = preview1500;
  }

  factory Assets.fromJson(Map<String, dynamic> json) =>
      _$AssetsFromJson(json);
  Map<String, dynamic> toJson() => _$AssetsToJson(this);
  
}
