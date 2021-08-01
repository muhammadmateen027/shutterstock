
import 'package:json_annotation/json_annotation.dart';

/// height : 100
/// url : "https://thumb1.shutterstock.com/thumb_large/283466185/1859243170/stock-photo-man-being-in-upside-down-position-inside-a-hole-dug-in-the-snow-at-the-top-of-a-remote-mountain-1859243170.jpg"
/// width : 150
part 'large_thumb.g.dart';

@JsonSerializable()
class LargeThumb {
  int? _height;
  String? _url;
  int? _width;

  int? get height => _height;

  String? get url => _url;

  int? get width => _width;

  LargeThumb({int? height, String? url, int? width}) {
    _height = height;
    _url = url;
    _width = width;
  }

  factory LargeThumb.fromJson(Map<String, dynamic> json) =>
      _$LargeThumbFromJson(json);
  Map<String, dynamic> toJson() => _$LargeThumbToJson(this);
}