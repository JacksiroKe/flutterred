import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../data/base/event_object.dart';
import '../utils/api_utils.dart';

//fetch questions lists
Future<EventObject> getTodos(String limit) async {
  try {
    String apiUrl = ApiConstants.baseUrl + ApiOperations.todos + "?_limit=$limit";
    var request = http.Request('GET', Uri.parse(apiUrl));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == ApiResponseCode.scOK) {
      String apiResponse = await response.stream.bytesToString();

      List<Map<String, dynamic>> rawlist = List<Map<String, dynamic>>.from(json.decode(apiResponse));
      return EventObject(id: EventConstants.requestSuccessful, object: rawlist);
    } else {
      return EventObject(id: EventConstants.requestUnsuccessful);
    }
  } catch (Exception) {
    return EventObject();
  } on TimeoutException catch (_) {
    return EventObject(id: EventConstants.requestUnsuccessful);
  }
}
