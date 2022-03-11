import 'package:catalogoclientes/src/providers/provider.dart';
import 'package:catalogoclientes/src/utils/colors_utils.dart';
import 'package:catalogoclientes/src/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
//alerta para correcto
Widget alertGenericSimple(BuildContext context, String title, String content,int returnT) {
  return AlertDialog(
        title: Center(
          child: Icon(
            Icons.priority_high,
            color: getColor('colorEnfoque'),
            size: 35.0,
          ),//Text(title),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                color: getColor('colorTextSecundario'),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); 
              if(returnT == 1){
                Navigator.pop(context); 
                Navigator.pushReplacementNamed(context, 'home');
              }
              if(returnT == 2){
                Navigator.pop(context); 
                Navigator.pop(context); 
                Navigator.pushReplacementNamed(context, 'home');
              }
            },
            child: Text(
              'Ok',
              style: TextStyle(
                fontSize: 15.0,
                color: getColor('colorSecundary'),
              ),
            )
          ),
        ],
      );
}



//alerta para error
Widget alertGenericSimpleError(BuildContext context, String content) {
  return AlertDialog(
        title: const Center(
          child: Icon(
            Icons.error,
            color: Colors.red,
            size: 35.0,
          ),//Text(title),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                color: getColor('colorTextSecundario'),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Ok',
              style: TextStyle(
                fontSize: 15.0,
                color: getColor('colorSecundary'),
              ),
            )
          ),
        ],
      );
}



//alerta generica 
alertGenerica(BuildContext context, String content) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: Center(
          child: Icon(
            Icons.priority_high,
            color: getColor('colorEnfoque'),
            size: 35.0,
          ),///Text(title),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                color: getColor('colorTextSecundario'),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Ok',
              style: TextStyle(
                fontSize: 15.0,
                color: getColor('colorSecundary'),
              ),
            )
          ),
        ],
      );
    },
  );
}
///////////////////////Alertas guardar///////////////////////////////////////

alertConfirmSave(BuildContext context, String title, String content,String nombre,String desc,String email,String tel,int ec) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: Center(
          child: Icon(
            Icons.priority_high,
            color: getColor('colorEnfoque'),
            size: 35.0,
          ),//Text(title),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                color: getColor('colorTextSecundario'),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              alertSaving(context, content, nombre, desc, email, tel, ec);
            },
            child: Text(
              'Confirmar',
              style: TextStyle(
                fontSize: 15.0,
                color: getColor('colorSecundary'),
              ),
            )
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancelar',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.red,
              ),
            )
          ),
        ],
      );
    },
  );
}

alertSaving(BuildContext context, String content,String nombre,String desc,String email,String tel,int ec) {
  final provider = Provider();
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return FutureBuilder(
        future: provider.saveCliente(nombre, desc, email, tel, ec),
        builder: (context,AsyncSnapshot<String> snapshot){
          if(snapshot.hasData){
            final data = snapshot.data;
            if(data != null && data.contains('Exito')){
              return alertGenericSimple(context, '', 'Cliente guardado con éxito',1);
            }else{
              return alertGenericSimpleError(context, "Ocurrió un error al guardar, intente nuevamente");
            }
          }
          return AlertDialog(
            content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text('Guardando nuevo cliente...', style: TextStyle(color: Colors.grey[400])),
                ],
              ),
          );
        },
      );
    },
  );
}



///////////////////////Alertas eliminar///////////////////////////////////////
alertConfirmDelete(BuildContext context, String id, String content) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: Center(
          child: Icon(
            Icons.priority_high,
            color: getColor('colorEnfoque'),
            size: 35.0,
          ),//Text(title),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                color: getColor('colorTextSecundario'),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              alertDeliting(context, id, content);
            },
            child: Text(
              'Confirmar',
              style: TextStyle(
                fontSize: 15.0,
                color: getColor('colorSecundary'),
              ),
            )
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancelar',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.red,
              ),
            )
          ),
        ],
      );
    },
  );
}


alertDeliting(BuildContext context, String id, String content) {
  final provider = Provider();
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return FutureBuilder(
        future: provider.deleteCliente(id),
        builder: (context,AsyncSnapshot<String> snapshot){
          if(snapshot.hasData){
            final data = snapshot.data;
            if(data != null && data.contains('Exito')){
              return alertGenericSimple(context, '', 'Cliente eliminado',1);
            }else{
              return alertGenericSimpleError(context, "Ocurrió un error al eliminar, intente nuevamente");
            }
          }
          return AlertDialog(
            content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text('Eliminando cliente...', style: TextStyle(color: Colors.grey[400])),
                ],
              ),
          );
        },
      );
    },
  );
}

///////////////////////Alertas editar cliente///////////////////////////////////////
alertConfirmEdit(BuildContext context, String id, String content,String nombre,String desc,String email,String tel,int ec) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: Center(
          child: Icon(
            Icons.priority_high,
            color: getColor('colorEnfoque'),
            size: 35.0,
          ),//Text(title),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                color: getColor('colorTextSecundario'),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              alertEditing(context,id, content, nombre, desc, email, tel, ec);
            },
            child: Text(
              'Confirmar',
              style: TextStyle(
                fontSize: 15.0,
                color: getColor('colorSecundary'),
              ),
            )
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancelar',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.red,
              ),
            )
          ),
        ],
      );
    },
  );
}

alertEditing(BuildContext context, String id,String content,String nombre,String desc,String email,String tel,int ec) {
  final provider = Provider();
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return FutureBuilder(
        future: provider.updateCliente(id,nombre, desc, email, tel, ec),
        builder: (context,AsyncSnapshot<String> snapshot){
          if(snapshot.hasData){
            final data = snapshot.data;
            if(data != null && data.contains('Exito')){
              return alertGenericSimple(context, '', 'Cliente actualizado',2);
            }else{
              return alertGenericSimpleError(context, "Ocurrió un error al actualizar, intente nuevamente");
            }
          }
          return AlertDialog(
            content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text('Actualizando cliente...', style: TextStyle(color: Colors.grey[400])),
                ],
              ),
          );
        },
      );
    },
  );
}