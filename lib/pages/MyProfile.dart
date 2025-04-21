import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  int _selectedIndex = 3;

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
          'Mi perfil',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(flex: 4, child: _buildProfileHeader(context)),
          Expanded(flex: 6, child: _buildOptionsList())
        ],
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

  
  Widget _buildProfileHeader(BuildContext context) {

    return SizedBox(
        width: double.infinity,
        child: Container(
          color: Color(0xFF89B786),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/images/userProfile.jpg'),
              ),
              SizedBox(height: 10),
              Text(
                'ResQ',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
  }

  Widget _buildOptionsList() {
  return Container(
    color: Color(0xFF89B786), // Fondo verde
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 2)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ListTile(
            leading: Icon(
              Icons.inventory,
              size: 35, // Tamaño del ícono
              color: Colors.green, // Color del ícono
            ),
            title: Text('Cant. pedidos', style: estiloOptionsList()),
            trailing: Text('10', style: estiloOptionsList()),
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.cloud_outlined,
              size: 35, // Tamaño del ícono
              color: Colors.green, // Color del ícono
            ),
            title: Text('CO2 ahorrado', style: estiloOptionsList()),
            trailing: Text('20', style: estiloOptionsList()),
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.savings,
              size: 35, // Tamaño del ícono
              color: Colors.green, // Color del ícono
            ),
            title: Text('Dinero ahorrado', style: estiloOptionsList()),
            trailing: Text('30', style: estiloOptionsList()),
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.place_outlined,
              size: 35, // Tamaño del ícono
              color: Colors.green, // Color del ícono
            ),
            title: Text('Ubicación', style: estiloOptionsList()),
            trailing: Text('40', style: estiloOptionsList()),
          ),
          const Divider(),
        ],
      ),
    ),
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

