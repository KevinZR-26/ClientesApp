import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:catalogoclientes/src/utils/colors_utils.dart';
import 'package:catalogoclientes/src/widgets/customAppBar_widet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:catalogoclientes/src/providers/provider.dart';
import 'package:catalogoclientes/src/widgets/loader_widget.dart';
import 'package:catalogoclientes/src/providers/globals.dart' as globals;


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final provider = Provider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recuperarTamSc();
    //bloquear rotacion de la pantalla
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getColor('colorFondo'),
      appBar: appbar('Mis Clientes'),
      body: _prebody(),
      floatingActionButton: _flbutton(),
    );
  }

  Widget _prebody(){
    return FutureBuilder(
      future: provider.getAllClientes(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot){
        if(snapshot.hasData){
          final result = snapshot.data;
          if(result!= null && result.contains('Vacio')){
            return _body(true);
          }
          if(result!= null && result.contains('Exito')){
            return _body(false);
          }
        }
        return loader('Recuperando clientes...');
      },
    );
  }

  Widget _body(bool vacio){
    if(vacio){
      return const Center(
        child:  Text(
          'Aún no ha registrado clientes',
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }
    return Container(
      child: _listClientes(),
    );
  }

  Widget _listClientes(){
    return ListView.builder(
      itemCount: globals.clientesList.length,
      itemBuilder: (context,index){
        return _itemList(index);
      },
    );
  }

  Widget _itemList(int index) {
    return GestureDetector(
      onTap: () {
        globals.clienteMostrar = globals.clientesList[index];
        Navigator.pushNamed(context, 'clientInfo');
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10,vertical:3),
        height: 70.0,
        child: Card(
          color: Colors.white,
          child:  Row(
            children:  <Widget>[
              _iconCliente(),
              _dataCliente(index),
              _arrowIcon(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconCliente(){
    return Container(
      margin: EdgeInsets.only(left: 8.0),
      child: const Icon(
        Icons.person,
        size: 35,
      ),
    );
  }

  Widget _dataCliente(int index) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _nombre(index),
            _descripcion(index),
          ],
        );
  }

  Widget _nombre(int index) {
    return Container(
      margin: EdgeInsets.only(left: 8.0,top: 8.0,bottom: 2.0),
      width: globals.width*0.665,
      child: Text(
        globals.clientesList[index].nombre,
        style: TextStyle(
          fontSize: 18.0,
          color: getColor('colorTextoPrincipal'),
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
  Widget _descripcion(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      width: globals.width*0.598,
      child: Text(
        globals.clientesList[index].descripcion,
        style: TextStyle(
          fontSize: 15.0,
          color: getColor('colorTextSecundario'),
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget _arrowIcon(){
    return Expanded(
      child: Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(left: 8.0),
        child: const Icon(
          Icons.arrow_right_sharp,
          size: 35,
        ),
      ),
    );
  }

  Widget _flbutton() {
    return FloatingActionButton(
      backgroundColor: getColor('colorEnfoque'),
      child: const Icon(
        Icons.person_add,
      ),
      onPressed: () => Navigator.pushNamed(context, 'addClient'),
    );
  }

  void recuperarTamSc() async{
    await Future.delayed(Duration(microseconds: 1));
    globals.width = MediaQuery. of(context). size. width;
    globals.height = MediaQuery. of(context). size. height;
    provider.getAllEstadoCivil();
    //log(globals.height.toString());
    //log(globals.width.toString());
  }

}