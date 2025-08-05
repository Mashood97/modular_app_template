import 'package:flutter/material.dart';
import 'package:profile/l10n/arb/profile_localization.dart';

extension AppLocalizationsX on BuildContext {
  ProfileLocalizations get l10n => ProfileLocalizations.of(this);
}
