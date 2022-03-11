import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';
import 'package:catalogoclientes/src/models/cliente_model.dart';
import 'package:catalogoclientes/src/models/estadocivil_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:catalogoclientes/src/providers/globals.dart' as globals;

class Provider{
  //metodo para recuperar la lista de clientes
  Future<String> getAllClientes() async{
    try{
      CollectionReference collectionReference = FirebaseFirestore.instance.collection('clientes');
      QuerySnapshot clientes = await collectionReference.get();
      //si la lista esta vacia regreso esto para mostrar el mensaje
      if(clientes.docs.length == 0){
        return 'Vacio';
      }
      //se limpia la lista global de clientes antes de ser llenada nuevamente
      globals.clientesList.clear();
      for(var doc in clientes.docs){
        //log(doc.data().toString());
        final clienteTemp = ClienteModel(id: doc.id, descripcion: doc.get('descripcion'), correoelectronico: doc.get('correoelectronico'), telefono: doc.get('telefono'), nombre: doc.get('nombre'),estadocivil: doc.get('estadocivil'));
        globals.clientesList.add(clienteTemp);
      }
      //log(globals.clientesList[0].estadocivil.toString());
      //log(globals.clientesList[1].estadocivil.toString());
      //log(globals.clientesList[2].estadocivil.toString());
      return 'Exito';
    }catch (e){
      print(e);
    }
    return 'Error';
  }

  //recuperar catalogo de estado civil
  Future<int> getAllEstadoCivil() async{
    try{
      CollectionReference collectionReference = FirebaseFirestore.instance.collection('estadocivil');
      QuerySnapshot estados = await collectionReference.get();
      //se limpia la lista global de estados antes de ser llenada nuevamente
      globals.estadocivilList.clear();
      if(estados.docs.length == 0){
        globals.estadocivilList.add(EstadoCivilModel(id: "1", desc: 'Casado.'));
        globals.estadocivilList.add(EstadoCivilModel(id: "2", desc: 'Divorciado.'));
        globals.estadocivilList.add(EstadoCivilModel(id: "3", desc: 'Unión libre.'));
        globals.estadocivilList.add(EstadoCivilModel(id: "4", desc: 'Soltero.'));
      }else{
        for(var doc in estados.docs){
          //log(doc.data().toString());
          final ecTemp = EstadoCivilModel(id: doc.id, desc: doc.get('desc'));
          globals.estadocivilList.add(ecTemp);
        }
      }
      //log(globals.estadocivilList[3].desc.toString());
    }catch (e){
      print(e);
      globals.estadocivilList.clear();
      globals.estadocivilList.add(EstadoCivilModel(id: "1", desc: 'Casado.'));
      globals.estadocivilList.add(EstadoCivilModel(id: "2", desc: 'Divorciado.'));
      globals.estadocivilList.add(EstadoCivilModel(id: "3", desc: 'Unión libre.'));
      globals.estadocivilList.add(EstadoCivilModel(id: "4", desc: 'Soltero.'));
    }

    return 1;
  }

  Future<String> saveCliente(String nombre,String desc,String email,String tel,int ec) async{
    try{
      CollectionReference collectionReference = FirebaseFirestore.instance.collection('clientes');
      QuerySnapshot clientes = await collectionReference.get();
      collectionReference.doc().set({'descripcion': desc, 'correoelectronico': email, 'telefono': tel, 'nombre': nombre,'estadocivil':ec});
      log(nombre + ' ' + desc + ' ' + email + ' ' + tel + ' ' + ec.toString());
      return 'Exito';
    }catch (e){
      print(e);
    }
    return 'Error';
  }

  Future<String> deleteCliente(String id) async{
    try{
      CollectionReference collectionReference = FirebaseFirestore.instance.collection('clientes');
      QuerySnapshot clientes = await collectionReference.get();
      collectionReference.doc(id).delete();
      return 'Exito';
    }catch (e){
      print(e);
    }
    return 'Error';
  }

  Future<String> updateCliente(String id,String nombre,String desc,String email,String tel,int ec) async{
    try{
      CollectionReference collectionReference = FirebaseFirestore.instance.collection('clientes');
      QuerySnapshot clientes = await collectionReference.get();
      collectionReference.doc(id).update({'descripcion': desc, 'correoelectronico': email, 'telefono': tel, 'nombre': nombre,'estadocivil':ec});
      log(id);
      return 'Exito';
    }catch (e){
      print(e);
    }
    return 'Error';
  }
}
