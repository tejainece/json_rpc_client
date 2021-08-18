import 'package:json_rpc_client/src/model/model.dart';

export 'package:json_rpc_client/src/model/model.dart';
export 'http.dart';

abstract class JRPCClient {
  String get nextId;
  Future<JRPC1Response> callRPCv1(JRPC1Request req,
      {String? pathSuffix, Uri? uri});
  Future<JRPC2Response> callRPCv2(JRPC2Request req,
      {String? pathSuffix, Uri? uri});
}
