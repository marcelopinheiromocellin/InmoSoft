class ReponseEntity {
  String message;
  int errorCode;

  ReponseEntity({this.message, this.errorCode});

  ReponseEntity.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    errorCode = json['errorCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['errorCode'] = this.errorCode;
    return data;
  }
}
