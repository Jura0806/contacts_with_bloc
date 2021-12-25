class Contact{

  String? id;
  String fullname;
  String number;

  Contact({ this.id,required this.fullname, required this.number});

  Contact.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        fullname = json["fullname"],
        number = json["number"];

  Map<String, dynamic> toJson() => {
    "id " : id,
    "fullname" : fullname,
    "number" : number,
  };
}