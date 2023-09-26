import 'package:agora_chat_sdk/agora_chat_sdk.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/view/real_communication/data.dart';
import 'package:digi_patient/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:typed_data';
//
import 'package:agora_rtm/agora_rtm.dart';


class ChatRTMView extends StatefulWidget {
  const ChatRTMView({Key? key}) : super(key: key);


  @override
  ChatRTMViewState createState() => ChatRTMViewState();
}

class ChatRTMViewState extends State<ChatRTMView> {
  bool _isLogin = false;
  bool _isInChannel = false;
  LocalInvitation? _localInvitation;
  RemoteInvitation? _remoteInvitation;

  final _userNameController = TextEditingController();
  final _peerUserIdController = TextEditingController();
  final _peerMessageController = TextEditingController();
  final _invitationController = TextEditingController();
  final _channelNameController = TextEditingController();
  final _channelMessageController = TextEditingController();

  final _infoStrings = <String>[];

  AgoraRtmClient? _client;
  AgoraRtmChannel? _channel;

  @override
  void initState() {
    super.initState();
    _createClient();
  }

  @override
  void dispose() {
    _client?.release();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            leading: const CustomBackButton(),
            title: const Text('Agora Real Time Message'),
            backgroundColor: AppColors.primaryColor,
          ),
          body: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildLogin(),
                _buildQueryOnlineStatus(),
                _buildSubscribeOnlineStatus(),
                _buildSendPeerMessage(),
                _buildLocalInvitation(),
                _buildRemoteInvitation(),
                _buildJoinChannel(),
                _buildGetMembers(),
                _buildSendChannelMessage(),
                _buildInfoList(),
              ],
            ),
          ));
  }

  void _createClient() async {
    _client = await AgoraRtmClient.createInstance(appId);
    _log(await AgoraRtmClient.getSdkVersion());
    await _client?.setParameters('{"rtm.log_filter": 15}');
    await _client?.setLogFile('');
    await _client?.setLogFilter(RtmLogFilter.info);
    await _client?.setLogFileSize(10240);
    _client?.onError = (error) {
      _log("Client error: $error");
    };
    _client?.onConnectionStateChanged2 =
        (RtmConnectionState state, RtmConnectionChangeReason reason) {
      _log('Connection state changed: $state, reason: $reason');
      if (state == RtmConnectionState.aborted) {
        _client?.logout();
        _log('Logout');
        setState(() {
          _isLogin = false;
        });
      }
    };
    _client?.onMessageReceived = (RtmMessage message, String peerId) {
      _log("Peer msg: $peerId, msg: ${message.messageType} ${message.text}");
    };
    _client?.onTokenExpired = () {
      _log("Token expired");
    };
    _client?.onTokenPrivilegeWillExpire = () {
      _log("Token privilege will expire");
    };
    _client?.onPeersOnlineStatusChanged =
        (Map<String, RtmPeerOnlineState> peersStatus) {
      _log("Peers online status changed ${peersStatus.toString()}");
    };

    var callManager = _client?.getRtmCallManager();
    callManager?.onError = (error) {
      _log('Call manager error: $error');
    };
    callManager?.onLocalInvitationReceivedByPeer =
        (LocalInvitation localInvitation) {
      _log(
          'Local invitation received by peer: ${localInvitation.calleeId}, content: ${localInvitation.content}');
    };
    callManager?.onLocalInvitationAccepted =
        (LocalInvitation localInvitation, String response) {
      _log(
          'Local invitation accepted by peer: ${localInvitation.calleeId}, response: $response');
      setState(() {
        _localInvitation = null;
      });
    };
    callManager?.onLocalInvitationRefused =
        (LocalInvitation localInvitation, String response) {
      _log(
          'Local invitation refused by peer: ${localInvitation.calleeId}, response: $response');
      setState(() {
        _localInvitation = null;
      });
    };
    callManager?.onLocalInvitationCanceled = (LocalInvitation localInvitation) {
      _log(
          'Local invitation canceled: ${localInvitation.calleeId}, content: ${localInvitation.content}');
      setState(() {
        _localInvitation = null;
      });
    };
    callManager?.onLocalInvitationFailure =
        (LocalInvitation localInvitation, int errorCode) {
      _log(
          'Local invitation failure: ${localInvitation.calleeId}, errorCode: $errorCode');
      setState(() {
        _localInvitation = null;
      });
    };
    callManager?.onRemoteInvitationReceived =
        (RemoteInvitation remoteInvitation) {
      _log(
          'Remote invitation received by peer: ${remoteInvitation.callerId}, content: ${remoteInvitation.content}');
      setState(() {
        _remoteInvitation = remoteInvitation;
      });
    };
    callManager?.onRemoteInvitationAccepted =
        (RemoteInvitation remoteInvitation) {
      _log(
          'Remote invitation accepted by peer: ${remoteInvitation.callerId}, content: ${remoteInvitation.content}');
      setState(() {
        _remoteInvitation = null;
      });
    };
    callManager?.onRemoteInvitationRefused =
        (RemoteInvitation remoteInvitation) {
      _log(
          'Remote invitation refused by peer: ${remoteInvitation.callerId}, content: ${remoteInvitation.content}');
      setState(() {
        _remoteInvitation = null;
      });
    };
    callManager?.onRemoteInvitationCanceled =
        (RemoteInvitation remoteInvitation) {
      _log(
          'Remote invitation canceled: ${remoteInvitation.callerId}, content: ${remoteInvitation.content}');
      setState(() {
        _remoteInvitation = null;
      });
    };
    callManager?.onRemoteInvitationFailure =
        (RemoteInvitation remoteInvitation, int errorCode) {
      _log(
          'Remote invitation failure: ${remoteInvitation.callerId}, errorCode: $errorCode');
      setState(() {
        _remoteInvitation = null;
      });
    };
  }

  Future<AgoraRtmChannel?> _createChannel(String name) async {
    AgoraRtmChannel? channel = await _client?.createChannel(name);
    if (channel != null) {
      channel.onError = (error) {
        _log("Channel error: $error");
      };
      channel.onMemberCountUpdated = (int memberCount) {
        _log("Member count updated: $memberCount");
      };
      channel.onAttributesUpdated = (List<RtmChannelAttribute> attributes) {
        _log("Channel attributes updated: ${attributes.toString()}");
      };
      channel.onMessageReceived =
          (RtmMessage message, RtmChannelMember member) {
        _log(
            "Channel msg: ${member.userId}, msg: ${message.messageType} ${message.text}");
      };
      channel.onMemberJoined = (RtmChannelMember member) {
        _log('Member joined: ${member.userId}, channel: ${member.channelId}');
      };
      channel.onMemberLeft = (RtmChannelMember member) {
        _log('Member left: ${member.userId}, channel: ${member.channelId}');
      };
    }
    return channel;
  }

  static TextStyle textStyle =
  const TextStyle(fontSize: 18, color: Colors.blue);

  Widget _buildLogin() {
    return Row(children: <Widget>[
      _isLogin
          ? Expanded(
          child: Text('User Id: ${_userNameController.text}',
              style: textStyle))
          : Expanded(
          child: TextField(
              controller: _userNameController,
              decoration:
              const InputDecoration(hintText: 'Input your user id'))),
      OutlinedButton(
        onPressed: _toggleLogin,
        child: Text(_isLogin ? 'Logout' : 'Login', style: textStyle),
      )
    ]);
  }

  Widget _buildQueryOnlineStatus() {
    if (!_isLogin) {
      return Container();
    }
    return Row(children: <Widget>[
      Expanded(
          child: TextField(
              controller: _peerUserIdController,
              decoration:
              const InputDecoration(hintText: 'Input peer user id'))),
      OutlinedButton(
        onPressed: _toggleQueryPeersOnlineStatus,
        child: Text('Query Online', style: textStyle),
      )
    ]);
  }

  Widget _buildSubscribeOnlineStatus() {
    if (!_isLogin) {
      return Container();
    }
    return Row(children: <Widget>[
      OutlinedButton(
        onPressed: _subscribePeersOnlineStatus,
        child: Text('Subscribe Online', style: textStyle),
      ),
      OutlinedButton(
        onPressed: _unsubscribePeersOnlineStatus,
        child: Text('Unsubscribe Online', style: textStyle),
      )
    ]);
  }

  Widget _buildSendPeerMessage() {
    if (!_isLogin) {
      return Container();
    }
    return Row(children: <Widget>[
      Expanded(
          child: TextField(
              controller: _peerMessageController,
              decoration:
              const InputDecoration(hintText: 'Input peer message'))),
      OutlinedButton(
        onPressed: _sendPeerMessage,
        child: Text('Send to Peer', style: textStyle),
      )
    ]);
  }

  Widget _buildLocalInvitation() {
    if (!_isLogin) {
      return Container();
    }
    return Row(children: <Widget>[
      Expanded(
          child: TextField(
              controller: _invitationController,
              decoration:
              const InputDecoration(hintText: 'Input invitation content'))),
      OutlinedButton(
        onPressed: _toggleLocalInvitation,
        child: Text(
            '${_localInvitation == null ? 'Send' : 'Cancel'} local invitation',
            style: textStyle),
      )
    ]);
  }

  Widget _buildRemoteInvitation() {
    if (!_isLogin || _remoteInvitation == null) {
      return Container();
    }
    return Row(children: <Widget>[
      OutlinedButton(
        onPressed: _acceptRemoteInvitation,
        child: Text('accept remote invitation', style: textStyle),
      ),
      OutlinedButton(
        onPressed: _refuseRemoteInvitation,
        child: Text('refuse remote invitation', style: textStyle),
      )
    ]);
  }

  Widget _buildJoinChannel() {
    if (!_isLogin) {
      return Container();
    }
    return Row(children: <Widget>[
      _isInChannel
          ? Expanded(
          child: Text('Channel: ${_channelNameController.text}',
              style: textStyle))
          : Expanded(
          child: TextField(
              controller: _channelNameController,
              decoration:
              const InputDecoration(hintText: 'Input channel id'))),
      OutlinedButton(
        onPressed: _toggleJoinChannel,
        child: Text(_isInChannel ? 'Leave Channel' : 'Join Channel',
            style: textStyle),
      )
    ]);
  }

  Widget _buildSendChannelMessage() {
    if (!_isLogin || !_isInChannel) {
      return Container();
    }
    return Row(children: <Widget>[
      Expanded(
          child: TextField(
              controller: _channelMessageController,
              decoration:
              const InputDecoration(hintText: 'Input channel message'))),
      OutlinedButton(
        onPressed: _sendChannelMessage,
        child: Text('Send to Channel', style: textStyle),
      )
    ]);
  }

  Widget _buildGetMembers() {
    if (!_isLogin || !_isInChannel) {
      return Container();
    }
    return Row(children: <Widget>[
      OutlinedButton(
        onPressed: _getMembers,
        child: Text('Get Members in Channel', style: textStyle),
      ),
      OutlinedButton(
        onPressed: _getMemberCount,
        child: Text('Get Member count in Channel', style: textStyle),
      )
    ]);
  }

  Widget _buildInfoList() {
    return Expanded(
        child: ListView.builder(
          itemExtent: 24,
          itemBuilder: (context, i) {
            return ListTile(
              contentPadding: const EdgeInsets.all(0.0),
              title: Text(_infoStrings[i]),
            );
          },
          itemCount: _infoStrings.length,
        ));
  }

  void _toggleLogin() async {
    if (_isLogin) {
      try {
        await _client?.logout();
        _log('Logout success');

        setState(() {
          _isLogin = false;
          _isInChannel = false;
        });
      } catch (errorCode) {
        _log('Logout error: $errorCode');
      }
    } else {
      String userId = _userNameController.text;
      if (userId.isEmpty) {
        _log('Please input your user id to login');
        return;
      }

      try {
        await _client?.login("007eJxTYPhZk/n+anaEgNrdc2lnPT8/PuZc43/Z6Ootse6khJR7HMsUGAyNzUySTA1TTCwTTU2Mkg0sLVJSzA2MLY1NjRNNTI0MRXh5UhsCGRlOiwqyMDKwMjACIYivwmBibJ6abGJsoGtqYWaga2iYmqqbZJiUqGtsbGpukmZgkmpmkQoAjF8l4w==", userId);
        _log('Login success: $userId');
        setState(() {
          _isLogin = true;
        });
      } catch (errorCode) {
        _log('Login error: $errorCode ');
        // debugPrint("\n\n\n\n\n\n...... ${error}");
      }
    }
  }

  void _toggleQueryPeersOnlineStatus() async {
    String peerUid = _peerUserIdController.text;
    if (peerUid.isEmpty) {
      try {
        List<String>? result = await _client?.queryPeersBySubscriptionOption(
            RtmPeerSubscriptionOption.onlineStatus);
        _log('Query result: $result');
      } catch (errorCode) {
        _log('Query error: $errorCode');
      }
    } else {
      try {
        Map<dynamic, dynamic>? result =
        await _client?.queryPeersOnlineStatus([peerUid]);
        _log('Query result: $result');
      } catch (errorCode) {
        _log('Query error: $errorCode');
      }
    }
  }

  void _subscribePeersOnlineStatus() async {
    String peerUid = _peerUserIdController.text;
    if (peerUid.isEmpty) {
      _log('Please input peer user id to subscribe');
      return;
    }

    try {
      await _client?.subscribePeersOnlineStatus([peerUid]);
      _log('Subscribe success');
    } catch (errorCode) {
      _log('Subscribe error: $errorCode');
    }
  }

  void _unsubscribePeersOnlineStatus() async {
    String peerUid = _peerUserIdController.text;
    if (peerUid.isEmpty) {
      _log('Please input peer user id to unsubscribe');
      return;
    }

    try {
      await _client?.unsubscribePeersOnlineStatus([peerUid]);
      _log('Unsubscribe success');
    } catch (errorCode) {
      _log('Unsubscribe error: $errorCode');
    }
  }

  void _sendPeerMessage() async {
    String peerUid = _peerUserIdController.text;
    if (peerUid.isEmpty) {
      _log('Please input peer user id to send message');
      return;
    }

    String text = _peerMessageController.text;
    if (text.isEmpty) {
      _log('Please input text to send');
      return;
    }

    try {
      RtmMessage? message = _client?.createTextMessage(text);
      if (message != null) {
        _log(message.text);
        await _client?.sendMessageToPeer2(peerUid, message);
        _log('Send peer message success');
      }
    } catch (errorCode) {
      _log('Send peer message error: $errorCode');
    }
  }

  void _toggleLocalInvitation() async {
    String peerUid = _peerUserIdController.text;
    if (peerUid.isEmpty) {
      _log('Please input peer user id to send invitation');
      return;
    }

    String text = _invitationController.text;
    if (text.isEmpty) {
      _log('Please input content to send');
      return;
    }

    if (_localInvitation == null) {
      try {
        LocalInvitation? invitation =
        await _client?.getRtmCallManager().createLocalInvitation(peerUid);
        if (invitation != null) {
          invitation.content = text;
          _log(invitation.content ?? '');
          await _client?.getRtmCallManager().sendLocalInvitation(invitation);
          setState(() {
            _localInvitation = invitation;
          });
          _log('Send local invitation success');
        }
      } catch (errorCode) {
        _log('Send local invitation error: $errorCode');
      }
    } else {
      try {
        await _client
            ?.getRtmCallManager()
            .cancelLocalInvitation(_localInvitation!);
        _log('Cancel local invitation success');
      } catch (errorCode) {
        _log('Cancel local invitation error: $errorCode');
      }
    }
  }

  void _acceptRemoteInvitation() async {
    if (_remoteInvitation == null) {
      _log('No remote invitation');
      return;
    }

    try {
      await _client
          ?.getRtmCallManager()
          .acceptRemoteInvitation(_remoteInvitation!);
      _log('Accept remote invitation success');
    } catch (errorCode) {
      _log('Accept remote invitation error: $errorCode');
    }
  }

  void _refuseRemoteInvitation() async {
    if (_remoteInvitation == null) {
      _log('No remote invitation');
      return;
    }

    try {
      await _client
          ?.getRtmCallManager()
          .refuseRemoteInvitation(_remoteInvitation!);
      _log('Refuse remote invitation success');
    } catch (errorCode) {
      _log('Refuse remote invitation error: $errorCode');
    }
  }

  void _toggleJoinChannel() async {
    if (_isInChannel) {
      try {
        await _channel?.leave();
        _log('Leave channel success');
        await _channel?.release();
        _channelMessageController.clear();

        setState(() {
          _isInChannel = false;
        });
      } catch (errorCode) {
        _log('Leave channel error: $errorCode');
      }
    } else {
      String channelId = _channelNameController.text;
      if (channelId.isEmpty) {
        _log('Please input channel id to join');
        return;
      }

      try {
        _channel = await _createChannel(channelId);
        await _channel?.join();
        _log('Join channel success');

        setState(() {
          _isInChannel = true;
        });
      } catch (errorCode) {
        _log('Join channel error: $errorCode');
      }
    }
  }

  void _getMembers() async {
    try {
      List<RtmChannelMember>? members = await _channel?.getMembers();
      _log('Members: ${members.toString()}');
    } catch (errorCode) {
      _log('GetMembers failed: $errorCode');
    }
  }

  void _getMemberCount() async {
    String channelId = _channelNameController.text;
    if (channelId.isEmpty) {
      _log('Please input channel id to get');
      return;
    }

    try {
      List<RtmChannelMemberCount>? members =
      await _client?.getChannelMemberCount([channelId]);
      _log('Members: ${members.toString()}');
    } catch (errorCode) {
      _log('GetMembers failed: $errorCode');
    }
  }

  void _sendChannelMessage() async {
    String text = _channelMessageController.text;
    if (text.isEmpty) {
      _log('Please input text to send');
      return;
    }

    try {
      RtmMessage? message =
      _client?.createRawMessage(Uint8List.fromList([]), text);
      if (message != null) {
        _log(message.text);
        await _channel?.sendMessage2(message);
        _log('Send channel message success');
      }
    } catch (errorCode) {
      _log('Send channel message error: $errorCode');
    }
  }

  void _log(String info) {
    debugPrint(info);
    setState(() {
      _infoStrings.insert(0, info);
    });
  }
}

// class ChatRView extends StatefulWidget {
//   const ChatRView({super.key, required this.chatKey, required this.userId, required this.agoraToken});
//   final String chatKey;
//   final String userId;
//   final String agoraToken;
//
//   @override
//   State<ChatRView> createState() => _ChatRViewState();
// }
//
// class _ChatRViewState extends State<ChatRView> {
//
//   ScrollController scrollController = ScrollController();
//
//   @override
//   void initState() {
//     super.initState();
//     _initSDK();
//     _addChatListener();
//     _signIn();
//   }
//
//   void _initSDK() async {
//     ChatOptions options = ChatOptions(
//       appKey: widget.chatKey,
//       autoLogin: false,
//     );
//     await ChatClient.getInstance.init(options);
//     await ChatClient.getInstance.startCallback();
//   }
//
//   void _addChatListener() {
//     ChatClient.getInstance.chatManager.addMessageEvent(
//         "UNIQUE_HANDLER_ID",
//         ChatMessageEvent(
//           onSuccess: (msgId, msg) {
//             debugPrint(
//                 "send message succeed: ${(msg.body as ChatTextMessageBody).content}");
//             _addMessage(
//               DemoMessage(
//                   text: (msg.body as ChatTextMessageBody).content,
//                   senderId: widget.userId),
//             );
//           },
//           onProgress: (msgId, progress) {
//             debugPrint("send message succeed");
//           },
//           onError: (msgId, msg, error) {
//             debugPrint(
//               "send message failed, code: ${error.code}, desc: ${error.description}",
//             );
//           },
//         ));
//
//     ChatClient.getInstance.chatManager.addEventHandler(
//       "UNIQUE_HANDLER_ID",
//       ChatEventHandler(onMessagesReceived: onMessagesReceived),
//     );
//   }
//
//   void _signIn() async {
//     try {
//       await ChatClient.getInstance.loginWithAgoraToken(
//         widget.userId,
//         widget.agoraToken,
//       );
//       debugPrint("login succeed, userId: ${widget.userId}");
//     } on ChatError catch (e) {
//       debugPrint("login failed, code: ${e.code}, desc: ${e.description}");
//     }
//   }
//
//   /// display on dispose
//   void _signOut() async {
//     ChatClient.getInstance.chatManager.removeMessageEvent("UNIQUE_HANDLER_ID");
//     ChatClient.getInstance.chatManager.removeEventHandler("UNIQUE_HANDLER_ID");
//     try {
//       await ChatClient.getInstance.logout(true);
//       debugPrint("sign out succeed");
//     } on ChatError catch (e) {
//       debugPrint(
//           "sign out failed, code: ${e.code}, desc: ${e.description}");
//     }
//   }
//
//
//   void onMessagesReceived(List<ChatMessage> messages) {
//     for (var msg in messages) {
//       switch (msg.body.type) {
//         case MessageType.TXT:
//           {
//             ChatTextMessageBody body = msg.body as ChatTextMessageBody;
//             debugPrint(
//               "receive text message: ${body.content}, from: ${msg.from}",
//             );
//             _addMessage(
//               DemoMessage(text: body.content, senderId: msg.from),
//             );
//           }
//           break;
//         default:
//           break;
//       }
//     }
//   }
//
//   void _addMessage(DemoMessage message) {
//     _messages.add(message);
//     setState(() {
//       scrollController.jumpTo(scrollController.position.maxScrollExtent + 40);
//     });
//   }
//
//   /// send message
//   void _sendMessage(String sentTo, String? message) async {
//     if (message == null) {
//       debugPrint("single chat id or message content is null");
//       return;
//     }
//
//     var msg = ChatMessage.createTxtSendMessage(
//       targetId: sentTo,
//       content: message,
//     );
//
//     ChatClient.getInstance.chatManager.sendMessage(msg);
//
//     setState(() {
//       _messageController.text = "";
//     });
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _signOut();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: ListView.builder(
//         controller: scrollController,
//         itemCount: _messages.length,
//         itemBuilder: (_, index) {
//           //show first 10 characters
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 2),
//               if (widget.userId != _messages[index].senderId)
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: Colors.lightBlue[100],
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Text(
//                     _messages[index].text!,
//                   ),
//                 )
//               else
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Flexible(
//                       child: Container(
//                         padding: const EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           color: Colors.lightGreen[100],
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Text(
//                           _messages[index].text!,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//             ],
//           );
//         },),
//     );
//   }
// }
///
// import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
// import 'package:chatgpt/consts.dart';

class AgoraChatPageView extends StatefulWidget {
  const AgoraChatPageView({
    super.key,
    required this.chatKey,
    required this.userId,
    required this.agoraToken,
    required this.receiverId,
  });
  final String chatKey;
  final String userId;
  final String agoraToken;
  final String receiverId;

  @override
  State<AgoraChatPageView> createState() => _AgoraChatPageViewState();
}

class DemoMessage {
  final String? text;
  final String? senderId;

  DemoMessage({required this.text, required this.senderId});
}

class _AgoraChatPageViewState extends State<AgoraChatPageView> {
  ScrollController scrollController = ScrollController();
  final TextEditingController _messageController = TextEditingController();
  final List<DemoMessage> _messages = [];

  // final openAI = OpenAI.instance.build(token: openAIToken);
  bool _isWaitingResponse = false;

  void _onTapSendHappyMessage() async {
    setState(() {
      _isWaitingResponse = true;
    });

    final List<DemoMessage> otherMessages = _messages
        .where((element) => element.senderId != widget.userId)
        .toList();

    // String response = await _sendAIMessage(
    //   "Give me a happy response to the message: ${otherMessages.last.text}",
    // );

    // setState(() {
    //   _isWaitingResponse = false;
    //   _messageController.text = response.trim();
    // });
  }

  // void _onTapSendAngryMessage() async {
  //   setState(() {
  //     _isWaitingResponse = true;
  //   });
  //
  //   final List<DemoMessage> otherMessages = _messages
  //       .where((element) => element.senderId != widget.userId)
  //       .toList();
  //
  //   String response = await _sendAIMessage(
  //     "Give me an angry response to the message: ${otherMessages.last.text}",
  //   );
  //   setState(() {
  //     _isWaitingResponse = false;
  //     _messageController.text = response.trim();
  //   });
  // }

  // Future<String> _sendAIMessage(String message) async {
  //   final request = CompleteText(
  //     prompt: message,
  //     model: Model.textDavinci3,
  //     maxTokens: 200,
  //   );
  //
  //   final response = await openAI.onCompletion(
  //     request: request,
  //   );
  //   return response!.choices.first.text;
  // }

  void _signIn() async {
    try {
      await ChatClient.getInstance.loginWithAgoraToken(
        widget.userId,
        widget.agoraToken,
      );
      debugPrint("login succeed, userId: ${widget.userId}");
    } on ChatError catch (e) {
      debugPrint("login failed, code: ${e.code}, desc: ${e.description}");
    }
  }

  void _signOut() async {
    ChatClient.getInstance.chatManager.removeMessageEvent("UNIQUE_HANDLER_ID");
    ChatClient.getInstance.chatManager.removeEventHandler("UNIQUE_HANDLER_ID");
    try {
      await ChatClient.getInstance.logout(true);
      debugPrint("sign out succeed");
    } on ChatError catch (e) {
      debugPrint("sign out failed, code: ${e.code}, desc: ${e.description}");
    }
  }

  void _sendMessage(String sentTo, String? message) async {
    if (message == null) {
      debugPrint("single chat id or message content is null");
      return;
    }

    var msg = ChatMessage.createTxtSendMessage(
      targetId: sentTo,
      content: message,
    );

    ChatClient.getInstance.chatManager.sendMessage(msg);

    setState(() {
      _messageController.text = "";
    });
  }

  void _initSDK() async {
    ChatOptions options = ChatOptions(
      appKey: widget.chatKey,
      autoLogin: false,
    );
    await ChatClient.getInstance.init(options);
    await ChatClient.getInstance.startCallback();
    _addChatListener();
    _signIn();
  }

  void _addChatListener() {
    ChatClient.getInstance.chatManager.addMessageEvent(
        "UNIQUE_HANDLER_ID",
        ChatMessageEvent(
          onSuccess: (msgId, msg) {
            debugPrint(
                "send message succeed: ${(msg.body as ChatTextMessageBody).content}");
            _addMessage(
              DemoMessage(
                  text: (msg.body as ChatTextMessageBody).content,
                  senderId: widget.userId),
            );
          },
          onError: (msgId, msg, error) {
            debugPrint(
              "send message failed, code: ${error.code}, desc: ${error.description}",
            );
          },
        ));

    ChatClient.getInstance.chatManager.addEventHandler(
      "UNIQUE_HANDLER_ID",
      ChatEventHandler(onMessagesReceived: onMessagesReceived),
    );
  }

  void onMessagesReceived(List<ChatMessage> messages) {
    for (var msg in messages) {
      switch (msg.body.type) {
        case MessageType.TXT:
          {
            ChatTextMessageBody body = msg.body as ChatTextMessageBody;
            debugPrint(
              "receive text message: ${body.content}, from: ${msg.from}",
            );
            _addMessage(
              DemoMessage(text: body.content, senderId: msg.from),
            );
          }
          break;
        default:
          break;
      }
    }
  }

  void _addMessage(DemoMessage message) {
    _messages.add(message);
    setState(() {
      scrollController.jumpTo(scrollController.position.maxScrollExtent + 40);
    });
  }

  @override
  void initState() {
    super.initState();
    _initSDK();
  }

  @override
  void dispose() {
    _signOut();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverId),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: ListView.builder(
                controller: scrollController,
                itemCount: _messages.length,
                itemBuilder: (_, index) {
                  //show first 10 characters
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 2),
                      if (widget.userId != _messages[index].senderId)
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.lightBlue[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            _messages[index].text!,
                          ),
                        )
                      else
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Flexible(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.lightGreen[100],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  _messages[index].text!,
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  );
                },
              ),
            ),
            // if (_isWaitingResponse)
            //   const Center(child: CircularProgressIndicator())
            // else
            //   Row(
            //     mainAxisSize: MainAxisSize.max,
            //     children: [
            //       Expanded(
            //         child: TextButton(
            //           onPressed: () => _onTapSendHappyMessage(),
            //           style: ButtonStyle(
            //             foregroundColor:
            //             MaterialStateProperty.all(Colors.white),
            //             backgroundColor:
            //             MaterialStateProperty.all(Colors.blue[300]),
            //           ),
            //           child: const Text("   HAPPY AI   "),
            //         ),
            //       ),
            //       const SizedBox(
            //         width: 20,
            //       ),
            //       Expanded(
            //         child: TextButton(
            //           onPressed: () => _onTapSendAngryMessage(),
            //           style: ButtonStyle(
            //             foregroundColor:
            //             MaterialStateProperty.all(Colors.white),
            //             backgroundColor:
            //             MaterialStateProperty.all(Colors.red[300]),
            //           ),
            //           child: const Text("   ANGRY AI   "),
            //         ),
            //       ),
            //     ],
            //   ),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: "Enter message",
                      border: InputBorder.none,
                    ),
                    maxLines: 2,
                    controller: _messageController,
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () => _sendMessage(
                        widget.receiverId, _messageController.text),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor:
                      MaterialStateProperty.all(Colors.lightBlue),
                    ),
                    icon: const Icon(Icons.send),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}