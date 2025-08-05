import 'package:flutter/material.dart';
import 'arb/authentication_localization.dart';

extension AppLocalizationsX on BuildContext {
  AuthLocalizations get l10n => AuthLocalizations.of(this);
}
