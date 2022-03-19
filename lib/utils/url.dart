import 'dart:io' show Platform;

import 'package:url_launcher/url_launcher.dart';

openMap(String address, String city, String country) async {
  final String query = '$address, $city, $country';
  String url;
  if (Platform.isIOS) {
    url = 'http://maps.apple.com/?q=$query';
  } else {
    url = 'https://www.google.com/maps/search/?api=1&query=$query';
  }
  openUrl(url);
}

openUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
