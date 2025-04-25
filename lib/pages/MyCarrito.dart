import 'package:flutter/material.dart';
import '../functions/widgets/construirPedidos.dart';
import '../models/pedido.dart';

class MyCarrito extends StatefulWidget {
  const MyCarrito({super.key});

  @override
  State<MyCarrito> createState() => _MyCarritoState();
}

class _MyCarritoState extends State<MyCarrito> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navegación a otras páginas según el índice
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/orders');
        break;
      case 2:
        Navigator.pushNamed(context, '/notifications');
        break;
      case 3:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mi carrito',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _listaPedidos()
          ],
        ),
    ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color(0xFF89B786),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Notificaciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }

  Widget _listaPedidos() {
  return ListView(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    children: construirPedidos(listaPedidos),
  );
  }



  TextStyle estiloOptionsList(){
    return const TextStyle(
      fontSize: 20,
      //fontFamily: 'Inria Serif',
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }
}


final List<Pedido> listaPedidos = [
  Pedido(
    nombreTienda: "Sanborns",
    costo: 40,
    descripcionProducto: "Producto de panaderia",
    fechaFinalizacion: DateTime.now().add(Duration(hours: 7)),
    imagen: 'sanborns.png'
  ),
  Pedido(
    nombreTienda: "Carlsjr reforma",
    costo: 70,
    descripcionProducto: "hamburgesas restantes",
    fechaFinalizacion: DateTime.now().add(Duration(hours: 7)),
    imagen: 'carlsjr.png'
  ),
  Pedido(
    nombreTienda: "soriana",
    costo: 60,
    descripcionProducto: "Carne de res",
    fechaFinalizacion: DateTime.now().add(Duration(hours: 7)),
    imagen: 'soriana.jpeg'
  )
];

