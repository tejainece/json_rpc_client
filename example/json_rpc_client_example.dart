import 'package:json_rpc_client/json_rpc_client.dart';

Future<void> main() async {
  // Create a JSON RPC HTTP client
  final client = JRPCHttpClient(Uri.parse('http://localhost:8080/rpc'));

  // Make a JSON RPC v1 call
  final resp1 = await client.callRPCv1(
      JRPC1Request(id: client.nextId, method: 'examplev1', params: [1, 2]));
  print('error: ${resp1.error} result: ${resp1.result}');

  // Make a JSON RPC v2 call
  final resp2 = await client.callRPCv2(JRPC2Request(
      id: client.nextId,
      method: 'examplev2',
      params: {'param1': 'hello', 'param2': 10}));
  print('error: ${resp1.error} result: ${resp1.result}');
}
