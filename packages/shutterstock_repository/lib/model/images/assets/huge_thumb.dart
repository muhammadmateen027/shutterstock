
import 'package:json_annotation/json_annotation.dart';

/// height : 260
/// url : "https://image.shutterstock.com/image-photo/man-being-upsidedown-position-inside-260nw-1859243170.jpg"
/// width : 390
part 'huge_thumb.g.dart';

@JsonSerializable()
class HugeThumb {
  int? _height;
  String? _url;
  int? _width;

  int? get height => _height;

  String? get url => _url;

  int? get width => _width;

  HugeThumb({int? height, String? url, int? width}) {
    _height = height;
    _url = url;
    _width = width;
  }

  factory HugeThumb.fromJson(Map<String, dynamic> json) =>
      _$HugeThumbFromJson(json);
  Map<String, dynamic> toJson() => _$HugeThumbToJson(this);
}