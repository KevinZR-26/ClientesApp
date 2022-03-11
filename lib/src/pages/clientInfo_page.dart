import 'package:catalogoclientes/src/providers/provider.dart';
import 'package:catalogoclientes/src/utils/alertas_utils.dart';
import 'package:catalogoclientes/src/utils/colors_utils.dart';
import 'package:catalogoclientes/src/widgets/customAppBar_widet.dart';
import 'package:flutter/material.dart';

import 'package:catalogoclientes/src/providers/globals.dart' as globals;

class ClientInfoPage extends StatefulWidget {
  ClientInfoPage({Key? key}) : super(key: key);
  @override
  State<ClientInfoPage> createState() => _ClientInfoPageState();
}

class _ClientInfoPageState extends State<ClientInfoPage> {
  final provider = Provider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getColor('colorFondo'),
      appBar: appbar('Detalle cliente'),
      body:_body(),
    );
  }

  Widget _body(){
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0,vertical: 30),
            width: globals.width,
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _iconCliente(),
                  _nomM(),
                  _ecM(),
                  _descM(), 
                  _emailM(),
                  _telM(),
                  const SizedBox(height: 30.0),
                ],
              ),
            ),
          ),
          _btns(),
        ],
      ),
    );
  }

  Widget _iconCliente(){
    return Container(
      margin: EdgeInsets.only(left: 8.0),
      child: const Icon(
        Icons.person,
        size: 100,
      ),
    );
  }
  
  Widget _nomM(){
    return Container(
      margin: EdgeInsets.only(left: 8.0,top: 8.0,bottom: 2.0),
      width: globals.width*0.665,
      child: Text(
        globals.clienteMostrar.nombre,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.0,
          color: getColor('colorTextoPrincipal'),
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget _descM(){
    return Container(
      margin: EdgeInsets.only(left: 8.0,top: 8.0,bottom: 2.0),
      width: globals.width*0.665,
      child: Text(
        globals.clienteMostrar.descripcion,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15.0,
          color: getColor('colorTextSecundario'),
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget _telM(){
    return Container(
      margin: EdgeInsets.only(left: 8.0,top: 8.0,bottom: 2.0),
      width: globals.width*0.665,
      child: Text(
        globals.clienteMostrar.telefono,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15.0,
          color: getColor('colorTextSecundario'),
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget _emailM(){
    return Container(
      margin: EdgeInsets.only(left: 8.0,top: 8.0,bottom: 2.0),
      width: globals.width*0.665,
      child: Text(
        globals.clienteMostrar.correoelectronico,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15.0,
          color: getColor('colorTextSecundario'),
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget _ecM(){
    return Container(
      margin: EdgeInsets.only(left: 8.0,top: 8.0,bottom: 2.0),
      width: globals.width*0.665,
      child: Text(
        globals.estadocivilList[globals.clienteMostrar.estadocivil-1].desc,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15.0,
          color: getColor('colorTextSecundario'),
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget _btns(){
    return Container(
      margin: EdgeInsets.only(left: 15,right: 15,bottom: 30),
      width: globals.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _btnDelete(),
          _btnEdit(),
        ],
      ),
    );
  }



  Widget _btnDelete(){
    return Container(
      height: 50.0,
      width: globals.width*0.45,
      child: ElevatedButton(
        onPressed: (){
          alertConfirmDelete(context, globals.clienteMostrar.id, '¿Esta seguro que desea eliminar este cliente?');
          //provider.deleteCliente(globals.clienteMostrar.id);
        }, 
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(
            double.maxFinite,
            45,
          ),
          primary: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        child: Text('ELIMINAR'),
      ),
    );
  }

  Widget _btnEdit(){
    return Container(
      height: 50.0,
      width: globals.width*0.45,
      child: ElevatedButton(
        onPressed: (){
          Navigator.pushNamed(context, 'editClient');
        }, 
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(
            double.maxFinite,
            45,
          ),
          primary: getColor('colorSecundary'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        child: Text('EDITAR'),
      ),
    );
  }

}