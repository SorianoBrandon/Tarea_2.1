import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:redit_clone_bs/src/views/home_view.dart';
import 'package:redit_clone_bs/src/views/detalle_producto_page.dart';

final paths = GoRouter(
  initialLocation: '/home',
  routes: [
  GoRoute(
    path: '/home',
    name: 'Inicio',
    builder: (context, settings) => Home_View(),
    routes: [GoRoute(
      path: '/:productoId', // /productos/4
          name: 'detalle-producto',
          builder: (BuildContext context, GoRouterState settings) {
            final id = settings.pathParameters['productoId'];

            final extras = settings.extra as Map;
            print(extras);

            return DetalleProductoPage(
              id: '$id',
              extras: extras,
            );
          },
          )
      ]    
    )],
    
    );