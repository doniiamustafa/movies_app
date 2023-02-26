class Results {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  Map<String, String> origin;
  Map<String, String> location;
  String image;
  List<String> episode;
  String url;
  String created;

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
}

class Characters {
  List<Results> results;
  Characters(this.results);
}
