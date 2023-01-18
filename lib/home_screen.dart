import 'package:flutter/material.dart';
import 'package:rocket_chat_connector_flutter/models/authentication.dart';
import 'package:rocket_chat_connector_flutter/models/subscription.dart';
import 'package:rocket_chat_connector_flutter/services/subscription_service.dart';
import 'package:rocket_chat_connector_flutter/web_socket/web_socket_service.dart';
import 'package:rocket_chat_example/chat_screen.dart';
import 'package:rocket_chat_example/constants.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomeScreen extends StatefulWidget {
  final Authentication authentication;

  const HomeScreen({
    required this.authentication,
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late WebSocketService webSocketService;
  late WebSocketChannel webSocketChannel;
  late SubscriptionService subscriptionService;

  @override
  void initState() {
    // webSocketService = WebSocketService();
    // webSocketChannel = webSocketService.connectToWebSocket(
    //   rocketChatWebSocketUrl,
    //   widget.authentication,
    // );
    subscriptionService = SubscriptionService(rocketChatHttpService);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: FutureBuilder<Subscription>(
          future: subscriptionService.getSubscriptions(widget.authentication),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.data!.update != null &&
                snapshot.data!.update!.isNotEmpty) {
              return SingleChildScrollView(
                child: Column(
                  children: snapshot.data!.update!
                      .map(
                        (update) => ListTile(
                          title: Text(update.name!),
                          subtitle: Text(
                            update.updatedAt.toString(),
                          ),
                          trailing: update.unread! > 0
                              ? Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                  ),
                                  child: Text(
                                    update.unread.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : null,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ChatScreen(
                                  roomId: update.rid!,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                      .toList(),
                ),
              );
            } else {
              return const Center(
                child: Text('No message'),
              );
            }
          }),
    );
  }
}
