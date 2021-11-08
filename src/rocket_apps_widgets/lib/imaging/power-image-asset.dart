import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class PowerImageAsset extends StatelessWidget {
  late Align _align;
  Padding? _padding;
  late Image _image;

  PowerImageAsset(
    String name, {
    Key? key,
    Alignment alignment = Alignment.center,
    double? widthFactor,
    double? heightFactor,
    EdgeInsets? padding,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
    Widget? loadingBuilder,
  }) : super(key: key) {
    // if (package == null) {
    //   package = App.PackageName;
    // }

    if (padding == null) {
      padding = EdgeInsets.zero;
    }

    _image = Image.asset(name,
        bundle: bundle,
        frameBuilder: frameBuilder,
        errorBuilder: errorBuilder,
        semanticLabel: semanticLabel,
        excludeFromSemantics: excludeFromSemantics,
        scale: scale,
        width: width,
        height: height,
        color: color,
        colorBlendMode: colorBlendMode,
        fit: fit,
        alignment: alignment,
        repeat: repeat,
        centerSlice: centerSlice,
        matchTextDirection: matchTextDirection,
        gaplessPlayback: gaplessPlayback,
        isAntiAlias: isAntiAlias,
        package: package,
        filterQuality: filterQuality,
        cacheWidth: cacheWidth,
        cacheHeight: cacheHeight);

    _padding = Padding(padding: padding, child: _image);

    _align = Align(
        child: _padding,
        alignment: alignment,
        widthFactor: widthFactor,
        heightFactor: heightFactor);
  }

  @override
  Widget build(BuildContext context) {
    return _align;
  }
}
