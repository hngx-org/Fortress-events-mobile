import 'package:event_app/src/core/utils/theme/theme_helper.dart';
import 'package:flutter/material.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyMediumBluegray500 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray500,
      );
  static get bodySmallBluegray300 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray300,
      );
  static get bodySmallSFProTextWhiteA700 =>
      theme.textTheme.bodySmall!.sFProText.copyWith(
        color: appTheme.whiteA700,
        fontSize: 12,
      );
  static get bodySmallSFProTextWhiteA70012 =>
      theme.textTheme.bodySmall!.sFProText.copyWith(
        color: appTheme.whiteA700,
        fontSize: 12,
      );
  // Label text style
  static get labelLargeSFProTextWhiteA700 =>
      theme.textTheme.labelLarge!.sFProText.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
  // Title text style
  static get titleSmallBluegray600 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray600,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallBluegray900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallBluegray90001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray90001,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallTeal900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.teal900,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallTeal900Bold => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.teal900,
        fontWeight: FontWeight.w700,
      );
}

extension on TextStyle {
  TextStyle get sFProText {
    return copyWith(
      fontFamily: 'SF Pro Text',
    );
  }

  TextStyle get plusJakartaSans {
    return copyWith(
      fontFamily: 'Plus Jakarta Sans',
    );
  }
}
