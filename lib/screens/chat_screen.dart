import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:rocket_chat_connector_flutter/models/authentication.dart';
import 'package:rocket_chat_connector_flutter/models/channel.dart';
import 'package:rocket_chat_connector_flutter/models/room.dart';
import 'package:rocket_chat_connector_flutter/services/channel_service.dart';
import 'package:rocket_chat_connector_flutter/services/room_service.dart';
import 'package:rocket_chat_connector_flutter/web_socket/web_socket_service.dart';
import 'package:rocket_chat_example/models/communication_type.dart';
import 'package:rocket_chat_example/env.dart';
import 'package:rocket_chat_example/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatScreen extends StatefulWidget {
  final CommunicationType type;
  final String id;

  const ChatScreen({
    required this.type,
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final RoomService _roomService = getIt<RoomService>();
  final ChannelService _channelService = getIt<ChannelService>();
  final WebSocketService _webSocketService = getIt<WebSocketService>();

  late List<types.Message> _messages;
  late StreamController<List<types.Message>> _messageStream;
  late types.User _user;

  WebSocketChannel? _channel;
  StreamSubscription? _subs;

  @override
  void initState() {
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
      if (widget.type == CommunicationType.room) {
        _webSocketService.streamRoomMessagesUnsubscribe(
            _channel!, Room(id: widget.id));
      } else {
        _webSocketService.streamChannelMessagesSubscribe(
            _channel!, Channel(id: widget.id));
      }
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
    if (widget.type == CommunicationType.room) {
      var messages =
          await _roomService.messages(Room(id: widget.id), authentication);
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
    } else {
      var messages = await _channelService.messages(
          Channel(id: widget.id), authentication);
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
    }
    _channel = _webSocketService.connectToWebSocket(
        Env.rocketChatWebSocketUrl, authentication);
    if (widget.type == CommunicationType.room) {
      _webSocketService.streamRoomMessagesSubscribe(
        _channel!,
        Room(
          id: widget.id,
        ),
      );
      _subs = _channel!.stream.listen((event) {
        var jsonData = jsonDecode(event) as Map<String, dynamic>;
        log('$jsonData');
        if (jsonData.containsKey('collection') &&
            jsonData['collection'] == 'stream-room-messages' &&
            jsonData['fields']['eventName'] == widget.id) {
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
    } else {
      _webSocketService.streamChannelMessagesSubscribe(
        _channel!,
        Channel(
          id: widget.id,
        ),
      );
      _subs = _channel!.stream.listen((event) {
        var jsonData = jsonDecode(event) as Map<String, dynamic>;
        log('$jsonData');
        if (jsonData.containsKey('collection') &&
            jsonData['collection'] == 'stream-room-messages' &&
            jsonData['fields']['eventName'] == widget.id) {
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
      if (widget.type == CommunicationType.room) {
        _webSocketService.sendMessageOnRoom(
          message.text,
          _channel!,
          Room(
            id: widget.id,
          ),
        );
      } else {
        _webSocketService.sendMessageOnChannel(
          message.text,
          _channel!,
          Channel(
            id: widget.id,
          ),
        );
      }
    }
  }
}
