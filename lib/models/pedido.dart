class Pedido {
  final String nombreTienda;
  final double costo;
  final String descripcionProducto;
  final DateTime fechaFinalizacion;
  final String imagen;

  Pedido({
    required this.nombreTienda,
    required this.costo,
    required this.descripcionProducto,
    required this.fechaFinalizacion,
    this.imagen = 'default_image.jpg'
  });
}
