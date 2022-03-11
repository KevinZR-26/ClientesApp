import 'dart:convert';

ClienteModel clienteModelFromJson(String str) => ClienteModel.fromJson(json.decode(str));

String clienteModelToJson(ClienteModel data) => json.encode(data.toJson());

class ClienteModel {
    ClienteModel({
        required this.id,
        required this.descripcion,
        required this.correoelectronico,
        required this.telefono,
        required this.nombre,
        required this.estadocivil,
    });

     

    late String id;
    late String descripcion;
    late String correoelectronico;
    late String telefono;
    late String nombre;
    late int estadocivil;

    factory ClienteModel.fromJson(Map<String, dynamic> json) => ClienteModel(
        id: json["id"],
        descripcion: json["descripcion"],
        correoelectronico: json["correoelectronico"],
        telefono: json["telefono"],
        nombre: json["nombre"],
        estadocivil: json["estadocivil"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
        "correoelectronico": correoelectronico,
        "telefono": telefono,
        "nombre": nombre,
        "estadocivil" : estadocivil,
    };

    ClienteModel.fromData(String idR,String descripcionR,String correoR,String nombreR,String telefonoR,int estadocivilR){
      id = idR;
      descripcion = descripcionR;
      correoelectronico = correoR;
      nombre = nombreR;
      telefono = telefonoR;
      estadocivil = estadocivilR;
    }
}
