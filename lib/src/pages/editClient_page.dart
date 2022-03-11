import 'package:catalogoclientes/src/providers/provider.dart';
import 'package:catalogoclientes/src/utils/alertas_utils.dart';
import 'package:catalogoclientes/src/utils/colors_utils.dart';
import 'package:catalogoclientes/src/widgets/customAppBar_widet.dart';
import 'package:catalogoclientes/src/widgets/inputTextField_widget.dart';
import 'package:catalogoclientes/src/providers/globals.dart' as globals;
import 'package:flutter/material.dart';

class EditClientPage extends StatefulWidget {
  EditClientPage({Key? key}) : super(key: key);
  @override
  State<EditClientPage> createState() => _EditClientPageState();
}

class _EditClientPageState extends State<EditClientPage> {
  final provider = Provider();

  TextEditingController nombre =  TextEditingController(text: globals.clienteMostrar.nombre);
  TextEditingController desc =  TextEditingController(text: globals.clienteMostrar.descripcion);
  TextEditingController tel = TextEditingController(text: globals.clienteMostrar.telefono);
  TextEditingController email = TextEditingController(text: globals.clienteMostrar.correoelectronico);
  TextEditingController ec = TextEditingController(text: globals.clienteMostrar.estadocivil.toString());
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: getColor('colorFondo'),
      appBar: appbar('Agregar cliente'),
      body: _body(),
    );
  }

  Widget _body(){
    return SingleChildScrollView(
      child: Column(
        children: [
          _subtitle(),
          inputTextWidget(Icons.person, 'Nombre', 10.0, nombre, false, false, TextInputType.name,80),
          inputTextWidget(Icons.description, 'Descripción', 10.0, desc, false, false, TextInputType.name,250),
          inputTextWidget(Icons.email, 'Correo Electrónico', 10.0, email, false, false, TextInputType.emailAddress,250),
          inputTextWidget(Icons.phone_android, 'Teléfono', 10.0, tel, false, false, TextInputType.phone,10),
          _ddbEstadoCivil(),
          _btnSave(),
        ],
      ),
    );
  }

  Widget _subtitle(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
      child: Text(
        'Puede modificar cada uno de los campos.',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18.0,
          color: getColor('colorTextSecundario'),
        ),
      ),
    );
  }

  Widget _ddbEstadoCivil(){
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(int.parse('0xFFDCDFE7')),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      margin: const EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
      child: Row(
        children: [
          Container(
            width: 50.0,
            child: Icon(
              Icons.group,
              size: 25.0,
              color: Color(int.parse('0xFF9FADBD')),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide.none,
                  left: BorderSide(
                    color: Color(int.parse('0xFFDCDFE7')),
                    width: 1.0,
                  ),
                  bottom: BorderSide.none,
                  right: BorderSide.none,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal:12),
              child: DropdownButton<String>(
                items: List<DropdownMenuItem<String>>.generate(
                  globals.estadocivilList.length,
                  (int index) => DropdownMenuItem<String>(
                    value:  globals.estadocivilList[index].id,
                    child: Text( globals.estadocivilList[index].desc,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                style: TextStyle(
                  fontSize: 18.0,
                  color: getColor('colorPrimary'),
                ),
                underline: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide.none
                    )
                  )
                ),
                isExpanded: true,
                hint: Text('Estado civil'),
                onChanged: (val) {
                  ec.text = (val.toString());
                  setState((){});
                },
                value: ec.text,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _btnSave(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 40.0),
      height: 50.0,
      child: ElevatedButton(
        onPressed: (){
          if(nombre.text.isNotEmpty && desc.text.isNotEmpty && email.text.isNotEmpty && tel.text.isNotEmpty && ec.text.isNotEmpty){
            alertConfirmEdit(context, globals.clienteMostrar.id, '¿Desea actualizar este cliente?',nombre.text, desc.text, email.text, tel.text, int.parse(ec.text));
          }else{
            alertGenerica(context, 'Debe de rellenar todos los campos');
          }
          
          //provider.saveCliente(nombre.text, desc.text, email.text, tel.text, int.parse(ec.text));
          //log(nombre.text + ' ' + desc.text + ' ' + email.text + ' ' + tel.text + ' ' + ec.text);
        }, 
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(
            double.maxFinite,
            45,
          ),
          primary: getColor('colorEnfoque'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        child: Text('ACTUALIZAR'),
      ),
    );
  }
}