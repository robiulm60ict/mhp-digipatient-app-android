import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:agora_chat_sdk/agora_chat_sdk.dart';

class AgoraChatConfig {
  static const String appKey = "41828119#1201697";
  static const String userId = "habib";
  static const String chatAppUserTempToken = "007eJxTYFhwKXaTcnx8QGZbZ47S0X2auptUbf7+6c4Ka53i0ffQb4ECg6GxmUmSqWGKiWWiqYlRsoGlRUqKuYGxpbGpcaKJqZHhfE2G1IZARgbhJ4qMjAysDIxACOKrMFgkGqSmmVoa6JoamiTqGhqmpupaWqaY6yYmGVmmmRsbpVgamAIA4w4lEw==";
  static const String chatAppTempToken = "007eJxTYNCbHDvj146Zy//Nrq2bM+1K1K34G/NO/PGv+OzUrLX+sH+hAoOhsZlJkqlhiolloqmJUbKBpUVKirmBsaWxqXGiiamR4UxNhtSGQEaGxw90WRgZWBkYGZgYQHwGBgBkIh+9";
  static const String agoraToken = "007eJxTYMjdz7hqiVOTzaYHyvN43/pcf/CI22TjGbvj83/zG6/m49yiwGBobGaSZGqYYmKZaGpilGxgaZGSYm5gbGlsapxoYmpkeEKdIbUhkJEh9/BvRkYGCATxBRhSMtMz4wsSSzJT80riEwsKGBgAxaMjlA==";
  static const String chatAppName = "1201697";
  static const String chatOrgName = "41828119";
}

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {

  ScrollController scrollController = ScrollController();
  String? _messageContent, _chatId;
  final List<String> _logText = [];
  TextEditingController userIdController = TextEditingController();
  TextEditingController msgController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _initSDK();
    _addChatListener();
  }

  @override
  void dispose() {
    ChatClient.getInstance.chatManager.removeMessageEvent("UNIQUE_HANDLER_ID");
    ChatClient.getInstance.chatManager.removeEventHandler("UNIQUE_HANDLER_ID");
    userIdController.dispose();
    msgController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text("Chat"),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 10),
          const Text("login userId: ${AgoraChatConfig.userId}"),
          const Text("agoraToken: ${AgoraChatConfig.agoraToken}"),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: _signIn,
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor:
                    MaterialStateProperty.all(Colors.lightBlue),
                  ),
                  child: const Text("SIGN IN"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextButton(
                  onPressed: _signOut,
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor:
                    MaterialStateProperty.all(Colors.lightBlue),
                  ),
                  child: const Text("SIGN OUT"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: const InputDecoration(
              hintText: "Enter recipient's userId",
            ),
            onChanged: (chatId) => _chatId = chatId,
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: "Enter message",
            ),
            onChanged: (msg) => _messageContent = msg,
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: _sendMessage,
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
            ),
            child: const Text("SEND TEXT"),
          ),
          Flexible(
            child: ListView.builder(
              controller: scrollController,
              itemBuilder: (_, index) {
                return Text(_logText[index]);
              },
              itemCount: _logText.length,
            ),
          ),
        ],
      ),
    );
  }
  void _initSDK() async {
    ChatOptions options = ChatOptions(
      appKey: AgoraChatConfig.appKey,
      autoLogin: false,
    );
    await ChatClient.getInstance.init(options);
    await ChatClient.getInstance.startCallback();
  }

  void _signIn() async {
    try {

      await ChatClient.getInstance.loginWithAgoraToken(
        AgoraChatConfig.userId,
        AgoraChatConfig.agoraToken,
      );
      // await ChatClient.getInstance.login(AgoraChatConfig.userId, AgoraChatConfig.userId,);
      _addLogToConsole("login succeed, userId: ${AgoraChatConfig.userId}");
    } on ChatError catch (e) {
      _addLogToConsole("login failed, code: ${e.code}, desc: ${e.description}");
    }
  }

  void _signOut() async {
    try {
      await ChatClient.getInstance.logout(true);
      _addLogToConsole("sign out succeed");
    } on ChatError catch (e) {
      _addLogToConsole(
          "sign out failed, code: ${e.code}, desc: ${e.description}");
    }
  }

  void _sendMessage() async {
    if (_chatId == null || _messageContent == null) {
      _addLogToConsole("single chat id or message content is null");
      return;
    }

    debugPrint(_messageContent);
    var msg = ChatMessage.createTxtSendMessage(
      targetId: _chatId!,
      content: _messageContent!,
    );
    debugPrint(msg.body.toString());
    ChatClient.getInstance.chatManager.sendMessage(msg);
  }

  void onMessagesReceived(List<ChatMessage> messages) {
    for (var msg in messages) {
      switch (msg.body.type) {
        case MessageType.TXT:
          {
            ChatTextMessageBody body = msg.body as ChatTextMessageBody;
            _addLogToConsole(
              "receive text message: ${body.content}, from: ${msg.from}",
            );
          }
          break;
        case MessageType.IMAGE:
          {
            _addLogToConsole(
              "receive image message, from: ${msg.from}",
            );
          }
          break;
        case MessageType.VIDEO:
          {
            _addLogToConsole(
              "receive video message, from: ${msg.from}",
            );
          }
          break;
        case MessageType.LOCATION:
          {
            _addLogToConsole(
              "receive location message, from: ${msg.from}",
            );
          }
          break;
        case MessageType.VOICE:
          {
            _addLogToConsole(
              "receive voice message, from: ${msg.from}",
            );
          }
          break;
        case MessageType.FILE:
          {
            _addLogToConsole(
              "receive image message, from: ${msg.from}",
            );
          }
          break;
        case MessageType.CUSTOM:
          {
            _addLogToConsole(
              "receive custom message, from: ${msg.from}",
            );
          }
          break;
        case MessageType.CMD:
          {
            // Receiving command messages does not trigger the `onMessagesReceived` event, but triggers the `onCmdMessagesReceived` event instead.
          }
          break;
      }
    }
  }

  void _addChatListener() {
    ChatClient.getInstance.chatManager.addMessageEvent(
        "UNIQUE_HANDLER_ID",
        ChatMessageEvent(
          onSuccess: (msgId, msg) {
            _addLogToConsole("send message succeed");
          },
          onProgress: (msgId, progress) {
            _addLogToConsole("send message succeed");
          },
          onError: (msgId, msg, error) {
            _addLogToConsole(
              "send message failed, code: ${error.code}, desc: ${error.description}",
            );
          },
        ));

    ChatClient.getInstance.chatManager.addEventHandler(
      "UNIQUE_HANDLER_ID",
      ChatEventHandler(onMessagesReceived: onMessagesReceived),
    );
  }


  // void _initSDK() async {
  // }
  // void _addChatListener() {
  // }
  // void _signIn() async {
  // }
  // void _signOut() async {
  // }
  // void _sendMessage() async {
  // }
  void _addLogToConsole(String log) {
    _logText.add("$_timeString: $log");
    setState(() {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }
  String get _timeString {
    return DateTime.now().toString().split(".").first;
  }
}




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
//     _logText.add("$_timeString: $log");
//     setState(() {
//       scrollController.jumpTo(scrollController.position.maxScrollExtent);
//     });
//   }
//
//   String get _timeString {
//     return DateTime.now().toString().split(".").first;
//   }
// }

// import 'package:flutter/material.dart';
//
// class AgoraChattingView extends StatelessWidget {
//   const AgoraChattingView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//     );
//   }
// }
