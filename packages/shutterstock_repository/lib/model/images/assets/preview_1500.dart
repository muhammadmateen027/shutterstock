import 'package:json_annotation/json_annotation.dart';

/// url : "https://image.shutterstock.com/z/stock-photo-man-being-in-upside-down-position-inside-a-hole-dug-in-the-snow-at-the-top-of-a-remote-mountain-1859243170.jpg"
/// width : 1500
/// height : 1000
part 'preview_1500.g.dart';

@JsonSerializable()
class Preview_1500 {
  String? _url;
  int? _width;
  int? _height;

  String? get url => _url;

  int? get width => _width;

  int? get height => _height;

  Preview_1500({String? url, int? width, int? height}) {
    _url = url;
    _width = width;
    _height = height;
  }

  factory Preview_1500.fromJson(Map<String, dynamic> json) =>
      _$Preview_1500FromJson(json);
  Map<String, dynamic> toJson() => _$Preview_1500ToJson(this);
}