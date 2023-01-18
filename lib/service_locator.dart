import 'package:get_it/get_it.dart';
import 'package:rocket_chat_connector_flutter/services/authentication_service.dart';
import 'package:rocket_chat_connector_flutter/services/channel_service.dart';
import 'package:rocket_chat_connector_flutter/services/http_service.dart';
import 'package:rocket_chat_connector_flutter/services/message_service.dart';
import 'package:rocket_chat_connector_flutter/services/room_service.dart';
import 'package:rocket_chat_connector_flutter/services/subscription_service.dart';
import 'package:rocket_chat_connector_flutter/services/user_service.dart';
import 'package:rocket_chat_connector_flutter/web_socket/web_socket_service.dart';
import 'package:rocket_chat_example/env.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerSingletonAsync<SharedPreferences>(
      () async => await SharedPreferences.getInstance());

  getIt.registerLazySingleton<HttpService>(
      () => HttpService(Uri.parse(Env.rocketChatBaseUrl)));
  getIt.registerLazySingleton<WebSocketService>(() => WebSocketService());

  getIt.registerLazySingleton<AuthenticationService>(
      () => AuthenticationService(getIt<HttpService>()));
  getIt.registerLazySingleton<ChannelService>(
      () => ChannelService(getIt<HttpService>()));
  getIt.registerLazySingleton<MessageService>(
      () => MessageService(getIt<HttpService>()));
  getIt.registerLazySingleton<RoomService>(
      () => RoomService(getIt<HttpService>()));
  getIt.registerLazySingleton<SubscriptionService>(
      () => SubscriptionService(getIt<HttpService>()));
  getIt.registerLazySingleton<UserService>(
      () => UserService(getIt<HttpService>()));
}
