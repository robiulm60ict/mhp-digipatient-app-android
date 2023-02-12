// import 'package:flutter/material.dart';
// import 'package:agora_chat_sdk/agora_chat_sdk.dart';
//
// class AgoraChatConfig {
//   static const String appKey = "3acad1aef78b4872a958024772b9aa07";
//   static const String userId = "<#Your created user#>";
//   static const String agoraToken = "<#User Token#>";
// }
//
//
// class AgoraChattingView extends StatefulWidget {
//   const AgoraChattingView({Key? key,}) : super(key: key);
//
//
//   @override
//   State<AgoraChattingView> createState() => _AgoraChattingViewState();
// }
//
// class _AgoraChattingViewState extends State<AgoraChattingView> {
//   ScrollController scrollController = ScrollController();
//   String? _messageContent, _chatId;
//   final List<String> _logText = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _initSDK();
//     _addChatListener();
//   }
//
//   @override
//   void dispose() {
//     ChatClient.getInstance.chatManager.removeEventHandler("UNIQUE_HANDLER_ID");
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Macro Health Plus"),
//       ),
//       body: Container(
//         padding: const EdgeInsets.only(left: 10, right: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             const SizedBox(height: 10),
//             const Text("login userId: ${AgoraChatConfig.userId}"),
//             const Text("agoraToken: ${AgoraChatConfig.agoraToken}"),
//             const SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: TextButton(
//                     onPressed: _signIn,
//                     style: ButtonStyle(
//                       foregroundColor: MaterialStateProperty.all(Colors.white),
//                       backgroundColor:
//                       MaterialStateProperty.all(Colors.lightBlue),
//                     ),
//                     child: const Text("SIGN IN"),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: TextButton(
//                     onPressed: _signOut,
//                     style: ButtonStyle(
//                       foregroundColor: MaterialStateProperty.all(Colors.white),
//                       backgroundColor:
//                       MaterialStateProperty.all(Colors.lightBlue),
//                     ),
//                     child: const Text("SIGN OUT"),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               decoration: const InputDecoration(
//                 hintText: "Enter recipient's userId",
//               ),
//               onChanged: (chatId) => _chatId = chatId,
//             ),
//             TextField(
//               decoration: const InputDecoration(
//                 hintText: "Enter message",
//               ),
//               onChanged: (msg) => _messageContent = msg,
//             ),
//             const SizedBox(height: 10),
//             TextButton(
//               onPressed: _sendMessage,
//               style: ButtonStyle(
//                 foregroundColor: MaterialStateProperty.all(Colors.white),
//                 backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
//               ),
//               child: const Text("SEND TEXT"),
//             ),
//             Flexible(
//               child: ListView.builder(
//                 controller: scrollController,
//                 itemBuilder: (_, index) {
//                   return Text(_logText[index]);
//                 },
//                 itemCount: _logText.length,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _initSDK() async {
//     ChatOptions options = ChatOptions(
//       appKey: AgoraChatConfig.appKey,
//       autoLogin: false,
//     );
//     await ChatClient.getInstance.init(options);
//   }
//
//   void _addChatListener() {
//     ChatClient.getInstance.chatManager.addEventHandler(
//       "UNIQUE_HANDLER_ID",
//       ChatEventHandler(onMessagesReceived: onMessagesReceived),
//     );
//   }
//
//   void _signIn() async {
//     try {
//       await ChatClient.getInstance.loginWithAgoraToken(
//         AgoraChatConfig.userId,
//         AgoraChatConfig.agoraToken,
//       );
//       _addLogToConsole("login succeed, userId: ${AgoraChatConfig.userId}");
//     } on ChatError catch (e) {
//       _addLogToConsole("login failed, code: ${e.code}, desc: ${e.description}");
//     }
//   }
//
//   void _signOut() async {
//     try {
//       await ChatClient.getInstance.logout(true);
//       _addLogToConsole("sign out succeed");
//     } on ChatError catch (e) {
//       _addLogToConsole(
//           "sign out failed, code: ${e.code}, desc: ${e.description}");
//     }
//   }
//
//   void _sendMessage() async {
//     if (_chatId == null || _messageContent == null) {
//       _addLogToConsole("single chat id or message content is null");
//       return;
//     }
//
//     var msg = ChatMessage.createTxtSendMessage(
//       targetId: _chatId!,
//       content: _messageContent!,
//     );
//     msg.setMessageStatusCallBack(MessageStatusCallBack(
//       onSuccess: () {
//         _addLogToConsole("send message: $_messageContent");
//       },
//       onError: (e) {
//         _addLogToConsole(
//           "send message failed, code: ${e.code}, desc: ${e.description}",
//         );
//       },
//     ));
//     ChatClient.getInstance.chatManager.sendMessage(msg);
//   }
//
//   void onMessagesReceived(List<ChatMessage> messages) {
//     for (var msg in messages) {
//       switch (msg.body.type) {
//         case MessageType.TXT:
//           {
//             ChatTextMessageBody body = msg.body as ChatTextMessageBody;
//             _addLogToConsole(
//               "receive text message: ${body.content}, from: ${msg.from}",
//             );
//           }
//           break;
//         case MessageType.IMAGE:
//           {
//             _addLogToConsole(
//               "receive image message, from: ${msg.from}",
//             );
//           }
//           break;
//         case MessageType.VIDEO:
//           {
//             _addLogToConsole(
//               "receive video message, from: ${msg.from}",
//             );
//           }
//           break;
//         case MessageType.LOCATION:
//           {
//             _addLogToConsole(
//               "receive location message, from: ${msg.from}",
//             );
//           }
//           break;
//         case MessageType.VOICE:
//           {
//             _addLogToConsole(
//               "receive voice message, from: ${msg.from}",
//             );
//           }
//           break;
//         case MessageType.FILE:
//           {
//             _addLogToConsole(
//               "receive image message, from: ${msg.from}",
//             );
//           }
//           break;
//         case MessageType.CUSTOM:
//           {
//             _addLogToConsole(
//               "receive custom message, from: ${msg.from}",
//             );
//           }
//           break;
//         case MessageType.CMD:
//           {}
//           break;
//       }
//     }
//   }
//
//   void _addLogToConsole(String log) {
//     _logText.add(_timeString + ": " + log);
//     setState(() {
//       scrollController.jumpTo(scrollController.position.maxScrollExtent);
//     });
//   }
//
//   String get _timeString {
//     return DateTime.now().toString().split(".").first;
//   }
// }

import 'package:flutter/material.dart';

class AgoraChattingView extends StatelessWidget {
  const AgoraChattingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
