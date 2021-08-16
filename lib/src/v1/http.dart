import 'dart:convert';
import 'dart:io';

import 'package:json_rpc_client/src/common/basic_auth.dart';

import 'models.dart';
import 'package:http/http.dart';

abstract class JRPC1Client {
  String get nextId;
  Future<JRPC1Response> callRPC(JRPC1Request req);
}

class JRPC1HttpClient implements JRPC1Client {
  final Uri uri;
  late Client client;
  BasicAuth? basicAuth;

  BigInt _id = BigInt.from(0);

  JRPC1HttpClient(this.uri, {Client? client, this.basicAuth}) {
    this.client = client ?? Client();
  }

  @override
  String get nextId {
    _id = _id + BigInt.one;
    return _id.toString();
  }

  @override
  Future<JRPC1Response> callRPC(JRPC1Request req) async {
    final body = json.encode(req.toJson());
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json-rpc',
      HttpHeaders.acceptHeader: 'application/json-rpc'
    };
    if (basicAuth != null) {
      headers[HttpHeaders.authorizationHeader] = 'Basic $basicAuth';
    }
    final resp = await client.post(uri, headers: headers, body: body);
    return JRPC1Response.fromMap(json.decode(resp.body));
  }
}
