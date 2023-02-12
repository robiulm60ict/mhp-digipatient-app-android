import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../resources/constants.dart';
import '../../view_model/communication view model/communication_view_model.dart';
import '../../widgets/communication_custom.dart';

class CommunicationInterfaceView extends StatefulWidget {
  const CommunicationInterfaceView({Key? key}) : super(key: key);

  @override
  State<CommunicationInterfaceView> createState() =>
      _CommunicationInterfaceViewState();
}

class _CommunicationInterfaceViewState
    extends State<CommunicationInterfaceView> {
  TextEditingController textEditingController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
    searchFocusNode.dispose();
  }

  onSearchTextChanged(String text) async {
    context.read<CommunicationViewModel>().searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    context
        .read<CommunicationViewModel>()
        .communicationModelList
        .forEach((userDetail) {
      if (userDetail.userName.toLowerCase().contains(text.toLowerCase())) {
        context.read<CommunicationViewModel>().addUser(userDetail);
      }
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    CommunicationViewModel provider =
        Provider.of<CommunicationViewModel>(context);
    return Scaffold(
      appBar: AppBar(
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          searchFocusNode.unfocus();
        },
        child: Padding(
          padding: EdgeInsets.all(kPadding.r),
          child: Column(
            children: [
              TextField(
                controller: textEditingController,
                focusNode: searchFocusNode,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.cancel),
                    onPressed: () {
                      textEditingController.clear();
                      onSearchTextChanged("");
                    },
                  ),
                ),
                onChanged: onSearchTextChanged,
              ),
              // SearchBarAnimation(
              //   isOriginalAnimation: false,
              //   buttonBorderColour: Colors.black45,
              //   textEditingController: textEditingController, trailingWidget: IconButton(
              //   icon:  Icon(Icons.cancel, size: 18.h,),
              //   onPressed: () {
              //     textEditingController.clear();
              //     onSearchTextChanged("");
              //   },
              // ), secondaryButtonWidget: const Icon(Icons.search), buttonWidget: const Icon(Icons.search),
              // ),
              SizedBox(
                height: kPadding.h,
              ),
              Expanded(
                child: provider.searchResult.isNotEmpty ||
                        textEditingController.text.isNotEmpty
                    ? ListView.separated(
                        itemCount: provider.searchResult.length,
                        itemBuilder: (context, index) {
                          final pr = provider.searchResult[index];
                          return CommunicationCustom(
                              userName: pr.userName, message: pr.message);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 7.h,
                          );
                        },
                      )
                    : ListView.separated(
                        itemCount: provider.communicationModelList.length,
                        itemBuilder: (context, index) {
                          final pr = provider.communicationModelList[index];
                          return CommunicationCustom(
                              userName: pr.userName, message: pr.message);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 7.h,
                          );
                        },
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
