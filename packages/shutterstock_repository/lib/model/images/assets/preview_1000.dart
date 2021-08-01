import 'package:json_annotation/json_annotation.dart';

/// url : "https://ak.picdn.net/shutterstock/photos/1859243170/watermark_1000/5538c0466fe6e110e3368c633baa08d9/preview_1000-1859243170.jpg"
/// width : 1000
/// height : 667
part 'preview_1000.g.dart';

@JsonSerializable()
class Preview_1000 {
  String? _url;
  int? _width;
  int? _height;

  String? get url => _url;

  int? get width => _width;

  int? get height => _height;

  Preview_1000({String? url, int? width, int? height}) {
    _url = url;
    _width = width;
    _height = height;
  }

  factory Preview_1000.fromJson(Map<String, dynamic> json) =>
      _$Preview_1000FromJson(json);
  Map<String, dynamic> toJson() => _$Preview_1000ToJson(this);
}