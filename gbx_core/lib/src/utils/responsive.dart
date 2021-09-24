import '../../gbx_core.dart';

double responsiveValue({
  required double sm,
  required double md,
  required double lg,
  required double xl,
}) {
  switch (ResponsiveUtils.screenSize) {
    case ScreenSize.sm:
      return sm;
    case ScreenSize.md:
      return md;
    case ScreenSize.lg:
      return lg;
    default:
      return xl;
  }
}

enum ScreenSize { sm, md, lg, xl }

class ResponsiveUtils {
  static ScreenSize get screenSize {
    var w = Get.mediaQuery.size.width;
    if (w < 600) return ScreenSize.sm;
    if (w < 960) return ScreenSize.md;
    if (w < 1280) return ScreenSize.lg;
    return ScreenSize.xl;
  }

  static double responsive({
    required double sm,
    required double md,
    required double lg,
    required double xl,
  }) {
    switch (ResponsiveUtils.screenSize) {
      case ScreenSize.sm:
        return sm;
      case ScreenSize.md:
        return md;
      case ScreenSize.lg:
        return lg;
      default:
        return xl;
    }
  }
}
