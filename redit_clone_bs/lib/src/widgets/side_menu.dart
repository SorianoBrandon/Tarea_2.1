import 'package:flutter/material.dart';
import 'package:redit_clone_bs/src/widgets/header_side_menu.dart';
import 'package:redit_clone_bs/src/widgets/menu_item.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            HeaderSideMenu(
              title: 'Brandon Soriano',
              email: 'sorianobrandon2003@gmail.com',
            ),
            MenuItem(
              texto: 'Inicio',
              icon: Icons.home,
              sideIcon: Icons.arrow_forward_ios_rounded,
              ontap: () {},
            ),
            MenuItem(
              texto: 'Usuario',
              icon: Icons.verified_user,
              sideIcon: Icons.arrow_forward_ios_rounded,
              ontap: () {},
            ),
            MenuItem(
              texto: 'Pedidos',
              sideIcon: Icons.shop_2_rounded,
              icon: Icons.place,
              ontap: () {},
            ),
            MenuItem(
              texto: 'Entregas',
              sideIcon: Icons.motorcycle_outlined,
              subtitulo: 'Estado de Entrega',
              icon: Icons.backpack_rounded,
              ontap: () {},
            ),
            MenuItem(
              texto: 'Crear Comunidad',
              subtitulo: 'Pantalla Principal',
              sideIcon: Icons.arrow_forward_ios_rounded,
              icon: Icons.people,
              ontap: () {},
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              thickness: 2,
              ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              child: Text(
                'Ajustes de la cuenta',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            MenuItem(
              icon: Icons.settings,
              sideIcon: Icons.arrow_forward_ios_rounded,
              texto: 'Configuración',
              ontap: () {},
              // subtitle: Text('Pantalla principal de reseñas'),
            ),
          ],
        ),
      ),
    );
  }
}
