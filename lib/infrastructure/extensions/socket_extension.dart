import 'package:socket_io_client/socket_io_client.dart';

extension SocketExtension on Socket {
  void joinRoom(List<String> roomIdList) => emit('join-room', roomIdList);
  void leaveRoom(List<String> roomIdList) => emit('leave-room', roomIdList);
}