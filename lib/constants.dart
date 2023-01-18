import 'package:rocket_chat_connector_flutter/services/http_service.dart';
import 'package:rocket_chat_example/env.dart';

final Uri rocketChatBaseUrl = Uri.parse(Env.rocketChatBaseUrl);
const String rocketChatWebSocketUrl = Env.rocketChatWebSocketUrl;
final HttpService rocketChatHttpService = HttpService(rocketChatBaseUrl);
