import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(),
      child: ListView(
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(),
            child: Center(
              child: FlutterLogo(
                size: 100,
              ),
            ),
          ),
          ListTile(
            title: Text('Sobre mi'),
          ),
          ListTile(
            title: Text('Proyectos destacados'),
          ),
          ListTile(
            title: Text('Habilidades'),
          ),
          ListTile(
            title: Text('Experiencia laboral'),
          ),
          ListTile(
            title: Text('Testimonios'),
          ),
          ListTile(
            title: Text('Contacto'),
          ),
        ],
      ),
    );
  }
}
