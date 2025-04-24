import 'package:flutter/material.dart';
import '../containers/pedidoContainer.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  int _selectedIndex = 2;

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
  return ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(), // ya estás en un scroll externo
    itemCount: 6,
    itemBuilder: (context, i) {
      return pedidoContainer(
            nombreTienda: "nombreTienda", 
            costo: 40, 
            descripcionProducto: "descripcionProducto", 
            fechaFinalizacion: DateTime.now().add(Duration(days: 1)), 
            onAportar: () {
              print('Aportar presionado');
            },
            onCancelar: () {
              print('Cancelar presionado');
            },
            );
    },
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

