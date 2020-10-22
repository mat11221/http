Future<String> postWithClientCertificate() async {
  final serverEndpoint = 'https://1991269db78887f9e.ngrok.io';
  HttpClient client = new HttpClient();
  var data = createSamplePayment().toJson();
  var request = await client.openUrl('POST', Uri.parse(serverEndpoint + '/paymentrequests'));
  request.headers.set(HttpHeaders.contentTypeHeader, 'APPLICATION/JSON');
  request.write(json.encode(data));
  var response = await request.close();
  String reply = await response.transform(utf8.decoder).join();
  print(reply);
  //DetailsModel details = DetailsModel.fromJson(response);
  final Map response1 = json.decode(response);
  

  print(response.statusCode);
  var token = response.headers.value('paymentrequesttoken');
  //print(reply);
  return token;
}
