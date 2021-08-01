
import 'package:json_annotation/json_annotation.dart';

/// height : 300
/// url : "https://image.shutterstock.com/display_pic_with_logo/283466185/1859243170/stock-photo-man-being-in-upside-down-position-inside-a-hole-dug-in-the-snow-at-the-top-of-a-remote-mountain-1859243170.jpg"
/// width : 450
part 'preview.g.dart';

@JsonSerializable()
class Preview {
  int? _height;
  String? _url;
  int? _width;

  int? get height => _height;

  String? get url => _url;

  int? get width => _width;

  Preview({int? height, String? url, int? width}) {
    _height = height;
    _url = url;
    _width = width;
  }

  factory Preview.fromJson(Map<String, dynamic> json) =>
      _$PreviewFromJson(json);
  Map<String, dynamic> toJson() => _$PreviewToJson(this);
}