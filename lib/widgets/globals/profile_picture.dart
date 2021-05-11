// ARCHIVO EN DONDE VAN A HABER MÉTODOS PARA GENERAR FOTOS DE PERFIL CON UN
// CÍRCULO, DEL CUAL HABRÁN VARIAS VARIANTES:
//
// - Número de notificaciones: Círuclo rojo en esquina superior derecha con el
//    número de notificaciones pendientes.
// - Si estás conectado: Círculo verde.
// - Si no estás conectado: Círculo rojo.

import 'package:flutter/material.dart';
import '../../globals/global_values.dart' as global_values;

// Crear la foto de perfil sin nada más (notificaciones, etc).
Widget createBareProfilePicture(
  double size, String assetImagePath, EdgeInsetsGeometry customMargin) {
  
  return Container(
    // 60 es el tamaño promedio.
    width: size,
    height: size,
    // color: Colors.white,
    margin: customMargin,
    // PARA HACER EL CÍRCULO SEGUÍ LO SIGUIENTE:
    // https://stackoverflow.com/questions/50522237/flutter-circle-design/50524531
    decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
      // Ya que tiene un borde establecido por default se lo quitamos.
      border: Border.all(width: 0),
      image: DecorationImage(
        image: AssetImage(assetImagePath),
        fit: BoxFit.cover,
      )
    ),
  );
}

// Crear la foto de perfil con un círculo verde  en la esquina inferior derecha,
// indicando que un usuario está conectado.
Widget createConnectedProfilePicture() {

}

// Crear foto de perfil con un número de notificaciones en un círculo rojo en la
// esquina superior derecha
Widget createProfilePictureWithNotifications(
  int notificationsNumber, double size,
  String assetImagePath, EdgeInsetsGeometry customMargin) {

    return Container(
      width: size,
      height: size,
      color: Colors.transparent,
      margin: customMargin,
      child: Stack(
        children: [
          // AQUÍ NECESITAMOS ENVIAR UN MARGEN DE 0, YA QUE SI NO, SE MODIFICA
          // EL TAMAÑO DEL WODGET DE LA FOTO DE PERFIL Y NO QUEDAN BIEN LOS
          // ELEMENTOS.
          // - CREAMOS LA FOTO DE PERFIL.
          createBareProfilePicture(size, assetImagePath, const EdgeInsets.all(0)),
          // AQUÍ CREAREMOS EL ÍCONO QUE INDICA LAS NOTIFICACIONES, el cual hay
          // que alinear en la esquina superior derecha.
          Align(
            alignment: Alignment.topRight,
            // Contenedor con el número de notificaciones.
            child: Container(

              width: size / 2.8,
              height: size / 2.8,
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // Color rojo.
                color: const Color(0xFFea2945),
                border: Border.all(
                  color: global_values.darkBackground,
                  width: 2,
                )
              ),
              // AQUÍ VA EL NÚMERO DE NOTIFICACIONES.
              child: Center(
                child: Text(
                  notificationsNumber.toString(),
                  style: const TextStyle(
                    color: Color(0xFFffffff),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )
          ),
        ],
      ),

    );
}
