import 'package:example_get_clean/infrastructure/extensions/socket_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';

class MessageSocket extends GetxService {
  late final Socket socket;
  late final List<String> roomIdList;
  late final String SEND_MESSAGE_KEY = 'send-message';
  late final String RECEIVE_MESSAGE_KEY = 'receive-message';

  @override
  void onInit() {
    super.onInit();
    socket = io(
      'http://sample.socket.com',
      OptionBuilder().setTransports(['websocket']).disableAutoConnect().build(),
    );
    socket.connect();
    socket.onConnect((_) {
      if (kDebugMode) {
        print('Socket connected');
      }
    });
    roomIdList = [
      // using room id list fetched from api
    ];
  }

  @override
  void onReady() {
    super.onReady();
    socket.joinRoom(roomIdList);
    socket.on(
      RECEIVE_MESSAGE_KEY,
      (data) {
        if (kDebugMode) {
          print('receive-message: $data');
        }
      },
    );
  }

  void sendMessage(String message, String roomId) {
    socket.emit(
      SEND_MESSAGE_KEY,
      {
        'roomId': roomId,
        'message': message,
      },
    );
  }

  @override
  void onClose() {
    super.onClose();
    socket.leaveRoom(roomIdList);
    socket.disconnect();
  }
}
