import 'package:flutter/material.dart';
import 'package:orders/l10n/arb/order_localization.dart';

extension AppLocalizationsX on BuildContext {
  OrderLocalizations get l10n => OrderLocalizations.of(this);
}
