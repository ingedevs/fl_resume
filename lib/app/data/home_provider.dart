import 'dart:convert';

import 'package:fl_resume/app/domain/resume.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = FutureProvider<Resume>((ref) async {
  String file = await rootBundle.loadString('assets/cv.json');
  Map<String, dynamic> json = jsonDecode(file);
  return Resume.fromJson(json);
});
