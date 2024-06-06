import 'package:url_launcher/url_launcher.dart';

void launchUrlInBrowser(String urlText) async {

  await launchUrl(Uri.parse(urlText),
      mode: LaunchMode.externalApplication);

}