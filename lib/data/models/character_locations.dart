class CharacterLocation {
  late String characterLocation;
  CharacterLocation(this.characterLocation);

  CharacterLocation.fromJson(Map<String, dynamic> json) {
    characterLocation = json["name"];
  }
}
