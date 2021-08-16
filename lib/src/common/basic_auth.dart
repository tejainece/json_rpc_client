import 'dart:convert';

class BasicAuth {
  final String username;
  final String password;
  BasicAuth({required this.username, required this.password});
  String encode() {
    return base64Encode(utf8.encode('$username:$password'));
  }

  @override
  String toString() => encode();
}
