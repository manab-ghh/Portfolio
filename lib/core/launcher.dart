import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launch(String url) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    debugPrint('Could not launch $url');
  }
}
