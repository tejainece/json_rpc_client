import 'dart:convert';
import 'dart:io';

import 'package:json_rpc_client/src/client/client.dart';
import 'package:json_rpc_client/src/common/basic_auth.dart';

import 'package:http/http.dart';

export 'package:json_rpc_client/src/common/basic_auth.dart';

class JRPCHttpClient implements JRPCClient {
  final Uri uri;
  late Client client;
  BasicAuth? basicAuth;

  BigInt _id = BigInt.from(0);

  JRPCHttpClient(this.uri, {Client? client, this.basicAuth}) {
    this.client = client ?? Client();
  }

  @override
  String get nextId {
    _id = _id + BigInt.one;
    return _id.toString();
  }

  @override
  Future<JRPC1Response> callRPCv1(JRPC1Request req) async {
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

  @override
  Future<JRPC2Response> callRPCv2(JRPC2Request req) async {
    final body = json.encode(req.toJson());
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json-rpc',
      HttpHeaders.acceptHeader: 'application/json-rpc'
    };
    if (basicAuth != null) {
      headers[HttpHeaders.authorizationHeader] = 'Basic $basicAuth';
    }
    final resp = await client.post(uri, headers: headers, body: body);
    return JRPC2Response.fromMap(json.decode(resp.body));
  }
}
