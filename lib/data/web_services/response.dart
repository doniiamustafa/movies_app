import 'package:json_annotation/json_annotation.dart';
part 'response.g.dart';

@JsonSerializable()
class AllCharactersResponse {
  @JsonKey(name: 'info')
  final Info info;
  @JsonKey(name: 'results')
  final List<Character> results;

  const AllCharactersResponse({
    required this.info,
    required this.results,
  });

  factory AllCharactersResponse.fromJson(Map<String, dynamic> json) =>
      _$AllCharactersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AllCharactersResponseToJson(this);
}

@JsonSerializable()
class Info {
  @JsonKey(name: 'count')
  final int count;
  @JsonKey(name: 'pages')
  final int pages;
  @JsonKey(name: 'next')
  final String next;
  @JsonKey(name: 'prev')
  final dynamic prev;

  const Info(
      {required this.count,
      required this.pages,
      required this.next,
      required this.prev});

  factory Info.fromJson(Map<String, dynamic> json) =>
      _$InfoFromJson(json);
  Map<String, dynamic> toJson() => _$InfoToJson(this);
}

@JsonSerializable()
class Character {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'status')
  final String status;
  @JsonKey(name: 'species')
  final String species;
  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'gender')
  final String gender;
  @JsonKey(name: 'origin')
  final Map<String, String> origin;
  @JsonKey(name: 'location')
  final Map<String, String> location;
  @JsonKey(name: 'image')
  final String image;
  @JsonKey(name: 'episode')
  final List episode;
  @JsonKey(name: 'url')
  final String url;
  @JsonKey(name: 'created')
  final String created;

  const Character(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.origin,
      required this.location,
      required this.image,
      required this.episode,
      required this.url,
      required this.created});

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}
