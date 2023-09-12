// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../generated/assets.dart';
// import '../../resources/colors.dart';
// import '../../resources/constants.dart';
//
//
// class ChatView extends StatefulWidget {
//   const ChatView({Key? key}) : super(key: key);
//
//   @override
//   State<ChatView> createState() => _ChatViewState();
// }
//
// class _ChatViewState extends State<ChatView> {
//   TextEditingController messageText = TextEditingController();
//   FocusNode messageFocusNode = FocusNode();
//   final ScrollController _scrollController = ScrollController();
//   GlobalKey lastKey = GlobalKey();
//
//   @override
//   void initState() {
//     super.initState();
//     // Future.delayed(const Duration(seconds: 0, )).then((value) {
//     //   if (_scrollController.hasClients) {
//     //     final position = _scrollController.position.maxScrollExtent;
//     //     _scrollController.jumpTo(position);
//     //   }
//     // });
//     Future.delayed(const Duration(seconds: 2)).then((value) => jumpToEnd());
//     // jumpToEnd();
//     // scrollToEnd();
//   }
//   @override
//   void dispose() {
//     super.dispose();
//     messageText.dispose();
//     messageFocusNode.dispose();
//     _scrollController.dispose();
//   }
//   void add({required String message, required DateTime dateTime, bool isCurrentUser = true }) {
//     setState(() {
//       messageList.add(MessageModel(msg: message, dateTime: dateTime, isCurrentUser: true),);
//     });
//     SchedulerBinding.instance.addPostFrameCallback((_) => scrollToEnd());
//   }
//
//   void scrollToEnd() async {
//
//     await _scrollController.animateTo(
//         _scrollController.position.maxScrollExtent,
//         duration: const Duration(seconds: 2),
//         curve: Curves.easeOut);
//      Scrollable.ensureVisible(lastKey.currentContext!);
//   }
//
//   void jumpToEnd(){
//     Future.delayed(const Duration(seconds: 0)).then((value) {
//     if (_scrollController.hasClients) {
//       final position = _scrollController.position.maxScrollExtent;
//       _scrollController.jumpTo(position);
//     }});
//   }
//   @override
//   Widget build(BuildContext context) {
//     // Size size = MediaQuery.of(context).size;
//     // debugPrint("Height: ${size.height} Width: ${size.width}");
//     return Scaffold(
//       appBar: AppBar(
//         // centerTitle: true,
//         // leadingWidth: 70.w,
//         // leading: Row(
//         //   mainAxisSize: MainAxisSize.min,
//         //   children: const [
//         //     CustomAutoLeadingIcon(),
//         //     CircleAvatar(
//         //       backgroundImage: AssetImage(
//         //         Assets.imagesUser,
//         //       ),
//         //     ),
//         //   ],
//         // ),
//         title: const Text(
//           "Habib",
//           style: TextStyle(),
//         ),
//         actions: [
//           IconButton(onPressed: (){}, icon: Icon(Icons.video_call, color: AppColors.primaryColor,),),
//           SizedBox(width: kPadding.w,),
//           const CircleAvatar(
//             backgroundImage: AssetImage(
//               Assets.imagesAvatar,
//             ),
//           ),
//           SizedBox(
//             width: kPadding.w,
//           ),
//         ],
//       ),
//       body: GestureDetector(
//         onTap: () {
//           messageFocusNode.unfocus();
//         },
//         child: Padding(
//           padding: EdgeInsets.all(kPadding.r),
//           child: Column(
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: messageList.length,
//                   controller: _scrollController,
//                   shrinkWrap: true,
//                   itemBuilder: (context, index) {
//                     bool isCurrentUser = messageList[index].isCurrentUser;
//                     // return Row(
//                     //   mainAxisAlignment: isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
//                     //   children: [
//                     //     Visibility(
//                     //       visible: !isCurrentUser,
//                     //       child: CircleAvatar(
//                     //         backgroundImage: AssetImage(Assets.imagesUser),
//                     //       ),
//                     //     ),
//                     //     SizedBox(
//                     //       width: 8.w,
//                     //     ),
//                     //     Text(
//                     //       "${messageList[index].msg}\n${messageList[index].dateTime?.year}-${messageList[index].dateTime?.month}-${messageList[index].dateTime?.day}-${messageList[index].dateTime?.hour}:${messageList[index].dateTime?.minute}",
//                     //       textAlign: messageList[index].isCurrentUser ? TextAlign.right : TextAlign.left,
//                     //       style: TextStyle(
//                     //           fontSize: 16.sp,
//                     //           fontWeight: FontWeight.w500,
//                     //           color: isCurrentUser ? Colors.grey : AppColors.primaryColor),
//                     //     ),
//                     //   ],
//                     // );
//                     return ListTile(
//                       key: index == messageList.length - 1 ? lastKey : null,
//                       contentPadding: EdgeInsets.symmetric(vertical: 5.h),
//                       leading: !isCurrentUser ? const CircleAvatar(backgroundImage: AssetImage(Assets.imagesAvatar),) : null,
//                       title: Text(messageList[index].msg, textAlign: messageList[index].isCurrentUser ? TextAlign.right : TextAlign.left,
//                           style: TextStyle(
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.w500,
//                               color: isCurrentUser ? Colors.grey : Colors.black),
//                         ),
//                       subtitle: Text(
//                           // formatDate(messageList[index].dateTime, [HH, ':', nn,]),
//                         "10.20",
//                         // "${messageList[index].dateTime?.year}-${messageList[index].dateTime?.month}-${messageList[index].dateTime?.day}-${messageList[index].dateTime?.hour}:${messageList[index].dateTime?.minute}",
//                           textAlign: messageList[index].isCurrentUser ? TextAlign.right : TextAlign.left,
//                           style: TextStyle(
//                               fontSize: 8.sp,
//                               fontWeight: FontWeight.w300,
//                               fontStyle: FontStyle.italic,
//                               color: Colors.black),),
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(
//                 height: kPadding.h,
//               ),
//               TextFormField(
//                 controller: messageText,
//                 focusNode: messageFocusNode,
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                   prefixIcon: const Icon(
//                     Icons.messenger,
//                   ),
//                   suffixIcon: IconButton(
//                     onPressed: () {
//                       if(messageText.text.isNotEmpty){
//                         add(message: messageText.text, dateTime: DateTime.now());
//                         messageText.clear();
//                         messageFocusNode.unfocus();
//                       }else{
//
//                       }
//
//
//                     },
//                     icon: const Icon(
//                       Icons.send,
//                     ),
//                   ),
//                   // hintText: 'email/mobile',
//                   filled: true,
//                   fillColor: Colors.transparent,
//                   contentPadding:
//                       EdgeInsets.symmetric(vertical: 10.h, horizontal: 4.w),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8.r),
//                       borderSide: BorderSide(color: AppColors.primaryColor)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class MessageModel {
//   String msg;
//   DateTime dateTime;
//   bool isCurrentUser;
//
//   MessageModel({required this.msg, required this.dateTime, this.isCurrentUser = false});
// }
//
// List<MessageModel> messageList = [
//   MessageModel(
//     msg: "Hi There!",
//     dateTime: DateTime(2022, 11, 19, 9, 2),
//   ),
//   MessageModel(
//       msg: "What's up?",
//       dateTime: DateTime(2022, 11, 19, 9, 5),
//       isCurrentUser: true),
//   MessageModel(
//     msg: "Good! \nHow are you?",
//     dateTime: DateTime(2022, 11, 19, 9, 6),
//   ),
//   MessageModel(
//       msg: "Also Good!\nWhat do you think about MacroHealthPlus?",
//       dateTime: DateTime(2022, 11, 19, 9, 6),
//       isCurrentUser: true),
//   MessageModel(
//     msg: "MacroHealthPlus is great invention.\nIt is very useful for us.",
//     dateTime: DateTime(2022, 11, 19, 9, 7),
//   ),
//   MessageModel(
//     msg: "It has a lot of functionality.",
//     dateTime: DateTime(2022, 11, 19, 9, 7),
//   ),
//   MessageModel(
//       msg: "Yes you are right",
//       dateTime: DateTime(2022, 11, 19, 9, 7),
//       isCurrentUser: true),
//   MessageModel(
//     msg: "Hi There!",
//     dateTime: DateTime(2022, 11, 19, 9, 2),
//   ),
//   MessageModel(
//       msg: "What's up?",
//       dateTime: DateTime(2022, 11, 19, 9, 5),
//       isCurrentUser: true),
//   MessageModel(
//     msg: "Good! \nHow are you?",
//     dateTime: DateTime(2022, 11, 19, 9, 6),
//   ),
//   MessageModel(
//       msg: "Also Good!\nWhat do you think about MacroHealthPlus?",
//       dateTime: DateTime(2022, 11, 19, 9, 6),
//       isCurrentUser: true),
//   MessageModel(
//     msg: "MacroHealthPlus is great invention.\nIt is very useful for us.",
//     dateTime: DateTime(2022, 11, 19, 9, 7),
//   ),
//   MessageModel(
//     msg: "It has a lot of functionality.",
//     dateTime: DateTime(2022, 11, 19, 9, 7),
//   ),
//   MessageModel(
//       msg: "Yes you are right",
//       dateTime: DateTime(2022, 11, 19, 9, 7),
//       isCurrentUser: true),
//   MessageModel(
//     msg: "Hi There!",
//     dateTime: DateTime(2022, 11, 19, 9, 2),
//   ),
//   MessageModel(
//       msg: "What's up?",
//       dateTime: DateTime(2022, 11, 19, 9, 5),
//       isCurrentUser: true),
//   MessageModel(
//     msg: "Good! \nHow are you?",
//     dateTime: DateTime(2022, 11, 19, 9, 6),
//   ),
//   MessageModel(
//       msg: "Also Good!\nWhat do you think about MacroHealthPlus?",
//       dateTime: DateTime(2022, 11, 19, 9, 6),
//       isCurrentUser: true),
//   MessageModel(
//     msg: "MacroHealthPlus is great invention.\nIt is very useful for us.",
//     dateTime: DateTime(2022, 11, 19, 9, 7),
//   ),
//   MessageModel(
//     msg: "It has a lot of functionality.",
//     dateTime: DateTime(2022, 11, 19, 9, 7),
//   ),
//   MessageModel(
//       msg: "Yes you are right",
//       dateTime: DateTime(2022, 11, 19, 9, 7),
//       isCurrentUser: true),
// ];
