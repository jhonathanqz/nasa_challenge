// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ApiModelException {
  final String? message;

  ApiModelException({
    this.message,
  });

  ApiModelException copyWith({
    String? message,
  }) {
    return ApiModelException(
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
    };
  }

  factory ApiModelException.fromMap(Map<String, dynamic> map) {
    return ApiModelException(
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiModelException.fromJson(String source) => ApiModelException.fromMap(json.decode(source) as Map<String, dynamic>);
}
