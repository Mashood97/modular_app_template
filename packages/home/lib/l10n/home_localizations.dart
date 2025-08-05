import 'package:flutter/material.dart';
import 'package:home/l10n/arb/home_localization.dart';

extension AppLocalizationsX on BuildContext {
  HomeLocalizations get l10n => HomeLocalizations.of(this);
}
