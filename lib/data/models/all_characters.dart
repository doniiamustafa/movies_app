class Results {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Map<String, String>? origin;
  Map<String, String>? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  Results(
      this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.origin,
      this.location,
      this.image,
      this.episode,
      this.url,
      this.created);

  Results.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    status = json["status"];
    species = json["species"];
    type = json["type"];
    gender = json["gender"];
    origin = json["origin"];
    location = json["location"];
    image = json["image"];
    episode = json["episode"];
    url = json["url"];
    created = json["created"];
  }
}

class AllCharacters {
  List<Results>? results;
  AllCharacters(this.results);

  AllCharacters.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }
}
