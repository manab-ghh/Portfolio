import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlHelper {
  UrlHelper._();

  static Future<void> launch(String urlString) async {
    try {
      final uri = Uri.parse(urlString);
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.platformDefault,
          webOnlyWindowName: '_blank',
        );
      } else {
        debugPrint('Could not launch url: $urlString');
      }
    } catch (e) {
      debugPrint('Error launching URL ($urlString): $e');
    }
  }

  static Future<void> sendEmail(String email, {String subject = '', String body = ''}) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        if (subject.isNotEmpty) 'subject': subject,
        if (body.isNotEmpty) 'body': body,
      },
    );
    try {
      await launchUrl(emailLaunchUri, mode: LaunchMode.platformDefault);
    } catch (e) {
      debugPrint('Error launching email client: $e');
    }
  }
}
