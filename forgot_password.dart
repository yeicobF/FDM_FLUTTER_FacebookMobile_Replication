import 'package:flutter/material.dart';

Widget ForgotPassword(Color fontColor) {
  // PREFERIRÍA PONER UN "EXPANDED" en lugar de un "PADDING", pero como tengo
  // los elementos en distintas columnas y contenedores, cuando utilizo el
  // EXPANDED, la pantalla solo se ve del contenedor del primer contenedor, así
  // que mejor utilicé el PADDING, pero esto le quita la responsividad y solo se
  // vería igual en el mismo dispositivo (Google Pixel 2).
  //
  // - ESTO DE ARRIBA ERA PORQUE HABÍA PUESTO PADDING.


  // CON EXPANDED SE TOMA TODO EL TAMAÑO RESTANTE DE LA PANTALLA, POR LO QUE
  // TIENE CIERTO GRADO DE RESPONSIVIDAD.
  return Expanded(
    // padding: const EdgeInsets.only(top: 150),

    // ALINEAMOS EL BOTÓN AL FONDO DEL TAMAÑO RESTANTE DE LA PANTALLA.
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
            height: 40,
            // QUE EL ANCHO SEA EL MÁXIMO POSIBLE.
            // https://stackoverflow.com/questions/50014342/button-width-match-parent
            width: double.infinity,
            child: Container(
              child: Center(
                child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 16.5,
                      fontWeight: FontWeight.w700,
                      color: fontColor,
                    )
                ),
              ),
            )
        ),
      )
  );
}
