import 'dart:convert';

EstadoCivilModel estadoCivilModelFromJson(String str) => EstadoCivilModel.fromJson(json.decode(str));

String estadoCivilModelToJson(EstadoCivilModel data) => json.encode(data.toJson());

class EstadoCivilModel {
    EstadoCivilModel({
        required this.id,
        required this.desc,
    });

    late String id;
    late String desc;

    factory EstadoCivilModel.fromJson(Map<String, dynamic> json) => EstadoCivilModel(
        id: json["id"],
        desc: json["desc"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "desc": desc,
    };

    EstadoCivilModel.fromData(String idR,String descR){
      id = idR;
      desc = descR;
    }
}
