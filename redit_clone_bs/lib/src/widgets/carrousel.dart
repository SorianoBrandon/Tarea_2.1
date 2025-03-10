import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Carrousel extends StatelessWidget {
  const Carrousel({super.key, required this.items});

  final List<dynamic> items;

  List<String> handler(List<dynamic> item){
    return item
      .where((element) => element is String) // Verificar si el elemento es String
      .cast<String>() // Convertir la lista a una lista de Strings
      .toList();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
        enlargeCenterPage: true,
      ),
      items: handler(items).map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            child: CachedNetworkImage(
                  imageUrl: i,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(
                    Icons.signal_cellular_connected_no_internet_4_bar_rounded,
                    color: Colors.red[800],
                    size: 150,
                  ),
                ),
          );
        },
      );
    }).toList(),
  );
  }
}