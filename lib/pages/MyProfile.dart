import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar( 
        title: const Text(
          'Mi perfil',
          style: const TextStyle(
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
          // Frames declarados por separado
            Expanded(
              flex: 4,
              child: _buildProfileHeader(context)
            ),
            Expanded(
              flex: 6,
              child: _buildOptionsList()
            )
            
        ],
      )
    );
  }

  
  Widget _buildProfileHeader(BuildContext context) {

    return SizedBox(
        width: double.infinity,
        child: Container(
          color: Colors.green,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://www.example.com/your_profile_image.jpg'),
              ),
              SizedBox(height: 10),
              Text(
                'Nombre de Usuario',
                style: TextStyle(
                  fontSize: 22,
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
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:  [
          ListTile(
            leading: const Icon(Icons.inventory),
            title: Text('Cant. pedidos', style: estiloOptionsList()),
            trailing: Text('10'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.cloud),
            title: Text('CO2 ahorrado', style: estiloOptionsList()),
            trailing: Text('20'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.savings),
            title: Text('Dinero ahorrado', style: estiloOptionsList()),
            trailing: Text('30'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.place),
            title: Text('Ubicacion', style: estiloOptionsList()),
            trailing: Text('40'),
          ),
          const Divider(),
        ],
      ),
    );
  }

  TextStyle estiloOptionsList(){
    return const TextStyle(
      fontSize: 20,
      fontFamily: 'Inria Serif',
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }
}

