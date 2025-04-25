import 'package:flutter/material.dart';
import '../../models/pedido.dart';
import '../../containers/pedidoContainer.dart';

List<Widget> construirPedidos(List<Pedido> pedidos) {
  return pedidos.map((pedido) {
    return pedidoContainer(
      nombreTienda: pedido.nombreTienda,
      costo: pedido.costo,
      descripcionProducto: pedido.descripcionProducto,
      fechaFinalizacion: pedido.fechaFinalizacion,
      onAportar: () {
        print('Aportar presionado para ${pedido.nombreTienda}');
      },
      onCancelar: () {
        print('Cancelar presionado para ${pedido.nombreTienda}');
      },
    );
  }).toList();
}
