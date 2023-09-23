class VideoCallToken {
  String? token;
  String? channelName;

  VideoCallToken({this.token, this.channelName});

  VideoCallToken.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    channelName = json['channel_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['channel_name'] = channelName;
    return data;
  }
}
