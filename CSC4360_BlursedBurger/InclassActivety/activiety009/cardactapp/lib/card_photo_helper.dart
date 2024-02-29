class CardModel {
  late int? id = 0;
  late String? photoName = "";
  photo(int i, String imgString) {
    this.photoName = imgString;
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'photoName': photoName,
    };
    return map;
  }

  CardModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    photoName = map['photoName'];
  }
}
