// ignore_for_file: depend_on_referenced_packages
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../constant/variable.dart';

class PlacesService {
  String key = Constant.googleApiKey;

  Future getAutocomplete(String search) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&key=$key&sessiontoken=1234567890&types=(cities)&components=country:in';
    var response = await http.get(Uri.parse(url));
    log("...$key..." + response.body);
    return response.body;
  }

  getPlace(String placeId) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/details/json?parameters&key=$key&place_id=$placeId';
    var response = await http.get(Uri.parse(url));

    return response.body;
  }
}
