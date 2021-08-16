import 'package:json_rpc_client/json_rpc_client.dart';

Future<void> main() async {
  final client = JRPCHttpClient(Uri.parse('http://localhost:8080/rpc'));
  final resp1 = await client.callRPCv1(
      JRPC1Request(id: client.nextId, method: 'examplev1', params: [1, 2]));
  print('error: ${resp1.error} result: ${resp1.result}');
}
