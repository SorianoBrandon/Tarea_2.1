import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:redit_clone_bs/src/widgets/carrousel.dart';

class DetalleProductoPage extends StatelessWidget {
  const DetalleProductoPage({super.key, required this.id, this.extras});

  final String id;
  final Map? extras;

  @override
  Widget build(BuildContext context) {
    print(extras);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => context.pop(), icon: Icon(Icons.arrow_back_ios_new_rounded), color: Colors.teal[600], iconSize: 30,),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline_rounded, color: Colors.teal[600], size: 30,))
          ],
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Carrousel(items: [extras?['image'], extras?['image2'], extras?['image3']]),
            Padding(padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15), child: 
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.amber[600], size: 30,),
                  Text('${extras?['rating']['rate']}', style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber[600]
                  ),),
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(40), right: Radius.circular(40)),
                      color: Colors.blueGrey[100],
                    ),
                    child: Text('${extras?['rating']['count']} Reviews', style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),),
                  )
                ],
              )
            ),
            Padding(padding: EdgeInsets.only(left: 10), child: Text(_parsedTitle(extras?['title']), style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.teal[600]
            ),),),
            Padding(padding: EdgeInsets.only(left: 10), child: Text(_parsedDescription(extras?['description']), style: TextStyle(
              fontSize: 12,
              color: Colors.blueGrey[800]
            ),),),
            Spacer(),
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey.withValues(alpha: 0.3), // Color de la sombra
                    spreadRadius: 0, // Cuánto se extiende la sombra
                    blurRadius: 10, // Qué tan difusa es la sombra
                    offset: Offset(0, -4), // Posición: solo hacia arriba
                  ),
                ]
              ),
              child: Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Row(
                children: [
                  Text('USD ${extras?['price']}', style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.teal[900]
                  ),),
                  Spacer(),
                  ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[600],
                    fixedSize: Size(180, 70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)
                    )
                  ), child: Text('Add to Cart', style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),))
                ],
              ),)
            )
          ],
        ),
      ),
    );
  }

  String _parsedDescription(String title) {
    if (title.length > 180) {
      return '${title.substring(0, 180).trim()}...';
    }
    return title;
  }

  String _parsedTitle(String title) {
    if (title.length > 20) {
      return '${title.substring(0, 20).trim()}...';
    }
    return title;
  }
}
