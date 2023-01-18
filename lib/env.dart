import 'package:envify/envify.dart';

part 'env.g.dart';

@Envify()
abstract class Env {
  static const rocketChatBaseUrl = _Env.rocketChatBaseUrl;
  static const rocketChatWebSocketUrl = _Env.rocketChatWebSocketUrl;
}
