import 'dart:developer';

import 'package:flutter/foundation.dart';

void debugLog(dynamic data) {
  if (kDebugMode) {
    log("[DEGUBG] $data");
  }
}
