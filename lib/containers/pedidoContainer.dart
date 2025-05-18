import 'package:flutter/material.dart';

Widget pedidoContainer({
  required String nombreTienda,
  required double costo,
  required String descripcionProducto,
  required DateTime fechaFinalizacion,
  required VoidCallback onAportar,
  required VoidCallback onCancelar,
  required String imagen,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Logo a la izquierda
        SizedBox(
          height: 158,
          child: Container(
            width: 120,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
              ),
            ),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/companies/$imagen',
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
        // Contenido principal
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Fila superior con nombre de tienda y costo
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      nombreTienda,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '\$${costo.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                // Descripción del producto
                Text(
                  descripcionProducto,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                SizedBox(height: 8),
                // Fecha de finalización
                Text(
                  'Finaliza: ${fechaFinalizacion.toString().substring(0, 16)}',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
                SizedBox(height: 12),
                // Botones
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: onAportar,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      child: Text('Aportar'),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: onCancelar,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text('Cancelar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

/*
ejemplo de uso:
pedidoContainer(
  nombreTienda: 'Tienda 1',
  costo: 20.0,
  descripcionProducto: 'Producto 1: Descripción breve del producto solicitado',
  fechaFinalizacion: DateTime.now().add(Duration(days: 1)),
  onAportar: () {
    print('Aportar presionado');
  },
  onCancelar: () {
    print('Cancelar presionado');
  },
)
*/
