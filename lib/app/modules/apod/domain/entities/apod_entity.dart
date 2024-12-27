// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:intl/intl.dart';

class ApodEntity {
  final String date;
  final String explanation;
  final String hdurl;
  final String mediaType;
  final String serviceVersion;
  final String title;
  final String url;
  final bool isFavorite;

  const ApodEntity({
    required this.date,
    required this.explanation,
    required this.hdurl,
    required this.mediaType,
    required this.serviceVersion,
    required this.title,
    required this.url,
    required this.isFavorite,
  });

  bool get isImage => mediaType == 'image';

  String get datePtBR {
    DateTime parsedDate = DateTime.parse(date);
    String formattedDate = DateFormat('dd/MM/yyyy').format(parsedDate);
    return formattedDate;
  }

  ApodEntity copyWith({
    String? date,
    String? explanation,
    String? hdurl,
    String? mediaType,
    String? serviceVersion,
    String? title,
    String? url,
    bool? isFavorite,
  }) {
    return ApodEntity(
      date: date ?? this.date,
      explanation: explanation ?? this.explanation,
      hdurl: hdurl ?? this.hdurl,
      mediaType: mediaType ?? this.mediaType,
      serviceVersion: serviceVersion ?? this.serviceVersion,
      title: title ?? this.title,
      url: url ?? this.url,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'explanation': explanation,
      'hdurl': hdurl,
      'media_type': mediaType,
      'serviceVersion': serviceVersion,
      'title': title,
      'url': url,
      'isFavorite': isFavorite,
    };
  }

  factory ApodEntity.fromMap(Map<String, dynamic> map) {
    return ApodEntity(
      date: map['date'] != null ? map['date'] as String : '',
      explanation: map['explanation'] != null ? map['explanation'] as String : '',
      hdurl: map['hdurl'] != null ? map['hdurl'] as String : '',
      mediaType: map['media_type'] != null ? map['media_type'] as String : '',
      serviceVersion: map['serviceVersion'] != null ? map['serviceVersion'] as String : '',
      title: map['title'] != null ? map['title'] as String : '',
      url: map['url'] != null ? map['url'] as String : '',
      isFavorite: map['isFavorite'] != null ? map['isFavorite'] as bool : false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ApodEntity.fromJson(String source) => ApodEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ApodEntity && other.date == date && other.explanation == explanation && other.hdurl == hdurl && other.mediaType == mediaType && other.serviceVersion == serviceVersion && other.title == title && other.url == url && other.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    return date.hashCode ^ explanation.hashCode ^ hdurl.hashCode ^ mediaType.hashCode ^ serviceVersion.hashCode ^ title.hashCode ^ url.hashCode ^ isFavorite.hashCode;
  }
}
