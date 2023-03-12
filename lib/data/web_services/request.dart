import 'package:json_annotation/json_annotation.dart';

part 'request.g.dart';

@JsonSerializable()
class LocationRequest {
  @JsonKey(name: 'id')
  final int id;

  const LocationRequest({required this.id});

  factory LocationRequest.fromJson(Map<String, dynamic> json) =>
      _$LocationRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LocationRequestToJson(this);
}
