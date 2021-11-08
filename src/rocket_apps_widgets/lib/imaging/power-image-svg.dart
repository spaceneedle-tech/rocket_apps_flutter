import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class PowerImageSvg extends StatelessWidget {
  //late Align _align;
  late Padding _padding;
  late SvgPicture _image;
  late Widget _container;

  PowerImageSvg(
    String name, {
    Key? key,
    Alignment? alignment,
    Positioned? positioned,
    double? widthFactor,
    double? heightFactor,
    EdgeInsetsGeometry? padding,
    AssetBundle? bundle,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    double? left,
    double? top,
    double? right,
    double? bottom,
    Color? color,
    Clip clipBehavior = Clip.hardEdge,
    bool allowDrawingOutsideViewBox = false,
    BlendMode colorBlendMode = BlendMode.srcIn,
    BoxFit fit = BoxFit.contain,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    bool matchTextDirection = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    Widget? loadingBuilder,
  }) : super(key: key) {
    if (padding == null) {
      padding = EdgeInsets.zero;
    }
    // if (package == null) {
    //   package = App.PackageName;
    // }

    bool useAlignement = (left == null &&
        top == null &&
        right == null &&
        bottom == null &&
        alignment != null);

    if (alignment != null) {
      _image = SvgPicture.asset(name,
          bundle: bundle,
          excludeFromSemantics: excludeFromSemantics,
          width: width,
          height: height,
          color: color,
          colorBlendMode: colorBlendMode,
          allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
          fit: fit,
          matchTextDirection: matchTextDirection,
          alignment: alignment,
          package: package);
    } else {
      _image = SvgPicture.asset(name,
          bundle: bundle,
          excludeFromSemantics: excludeFromSemantics,
          width: width,
          height: height,
          color: color,
          colorBlendMode: colorBlendMode,
          allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
          fit: fit,
          matchTextDirection: matchTextDirection,
          package: package);
    }

    _padding = Padding(padding: padding, child: _image);

    if (useAlignement) {
      _container = Align(
          child: _padding,
          alignment: alignment,
          widthFactor: widthFactor,
          heightFactor: heightFactor);
    } else {
      if (left == null) {
        left = 0;
      }

      if (top == null) {
        top = 0;
      }

      if (right == null) {
        right = 0;
      }

      if (bottom == null) {
        bottom = 0;
      }

      // _container = _padding;

      // return;
      _container = Positioned(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
        child: _padding,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _container;
  }
}
