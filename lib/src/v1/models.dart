class JRPC1Request {
  final String jsonrpc;
  final String id;
  final String method;
  final Object? params;

  JRPC1Request({
    this.jsonrpc = '1.0',
    required this.id,
    required this.method,
    this.params,
  });

  Map<String, dynamic> toJson() {
    final ret = <String, dynamic>{
      'jsonrpc': jsonrpc,
      'id': id,
      'method': method,
    };
    if (params != null) {
      ret['params'] = params;
    }
    return ret;
  }

  static JRPC1Request fromMap(Map<String, dynamic> map) {
    return JRPC1Request(
        id: map['id'],
        method: map['method'],
        jsonrpc: map['jsonrpc'],
        params: map['params']);
  }
}

class JRPC1Response {
  final String jsonrpc;
  final String? id;
  final Object? result;
  final Object? error;

  JRPC1Response({this.jsonrpc = '2.0', this.id, this.result, this.error});

  Map<String, dynamic> toJson() {
    final ret = <String, dynamic>{
      'jsonrpc': jsonrpc,
      'id': id,
    };
    if (result != null) {
      ret['result'] = result;
    }
    if (error != null) {
      ret['error'] = error;
    }
    return ret;
  }

  static JRPC1Response fromMap(Map<String, dynamic> map) => JRPC1Response(
    jsonrpc: map['jsonrpc'] ?? '1.0',
    id: map['id'],
    result: map['result'],
    error: map['error'],
  );
}

class JRPC1Error {
  final int code;
  final String message;
  final Object? data;
  JRPC1Error(this.code, this.message, {this.data});

  Map<String, dynamic> toJson() {
    final ret = <String, dynamic>{'code': code, 'message': message};
    if (data != null) {
      ret['data'] = data;
    }
    return {'code': code, 'message': message};
  }

  static JRPC1Error fromMap(Map<String, dynamic> map) =>
      JRPC1Error(map['code'], map['message'], data: map['data']);
}