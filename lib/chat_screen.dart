import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:rocket_chat_connector_flutter/models/authentication.dart';
import 'package:rocket_chat_connector_flutter/models/room.dart';
import 'package:rocket_chat_connector_flutter/services/room_service.dart';
import 'package:rocket_chat_connector_flutter/web_socket/web_socket_service.dart';
import 'package:rocket_chat_example/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatScreen extends StatefulWidget {
  final String roomId;

  const ChatScreen({
    required this.roomId,
    Key? key,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late List<types.Message> _messages;
  late StreamController<List<types.Message>> _messageStream;
  late types.User _user;
  late WebSocketService _ws;
  late RoomService _roomService;
  WebSocketChannel? _channel;
  StreamSubscription? _subs;

  @override
  void initState() {
    _ws = WebSocketService();
    _roomService = RoomService(rocketChatHttpService);
    _messages = [];
    _messageStream = StreamController();
    _messageStream.sink.add(_messages);
    super.initState();
  }

  @override
  void dispose() {
    _messageStream.close();
    _subs?.cancel();
    if (_channel != null) {
      _ws.streamRoomMessagesUnsubscribe(_channel!, Room(id: widget.roomId));
    }
    super.dispose();
  }

  Future<void> _initialize() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    var authentication = Authentication.fromMap(
      jsonDecode(
        sharedPreferences.getString('authentication')!,
      ),
    );
    _user = types.User(
      id: authentication.data!.userId!,
      firstName: authentication.data!.me!.username!,
    );
    var messages =
        await _roomService.messages(Room(id: widget.roomId), authentication);
    _messages.addAll(
      messages.messages!.map(
        (message) => types.TextMessage(
          id: message.id!,
          author: types.User(
            id: message.user!.id!,
            firstName: message.user!.username!,
          ),
          text: message.msg!,
        ),
      ),
    );
    _channel = _ws.connectToWebSocket(rocketChatWebSocketUrl, authentication);
    _ws.streamRoomMessagesSubscribe(
      _channel!,
      Room(
        id: widget.roomId,
      ),
    );
    _subs = _channel!.stream.listen((event) {
      var jsonData = jsonDecode(event) as Map<String, dynamic>;
      log('$jsonData');
      if (jsonData.containsKey('collection') &&
          jsonData['collection'] == 'stream-room-messages' &&
          jsonData['fields']['eventName'] == widget.roomId) {
        _messages.insert(
          0,
          types.TextMessage(
            id: jsonData['fields']['args'][0]['_id'],
            author: types.User(
              id: jsonData['fields']['args'][0]['u']['_id'],
              firstName: jsonData['fields']['args'][0]['u']['username'],
            ),
            text: jsonData['fields']['args'][0]['msg'],
          ),
        );
        _messageStream.sink.add(_messages);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: FutureBuilder(
        future: _initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder<List<types.Message>>(
              stream: _messageStream.stream,
              builder: (context, snapshot) {
                return Chat(
                  messages: snapshot.hasData ? snapshot.data! : _messages,
                  onSendPressed: _handleSendPressed,
                  user: _user,
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  void _handleSendPressed(types.PartialText message) {
    if (_channel != null) {
      _ws.sendMessageOnRoom(message.text, _channel!, Room(id: widget.roomId));
    }
  }
}
