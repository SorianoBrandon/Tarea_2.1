import 'package:flutter/material.dart';
import 'package:redit_clone_bs/src/widgets/side_menu.dart';
import 'package:redit_clone_bs/src/api/productos.dart';
import 'package:redit_clone_bs/src/widgets/item_list.dart';

class Home_View extends StatefulWidget {
  const Home_View({super.key});

  @override
  State<Home_View> createState() => _Home_ViewState();
}

class _Home_ViewState extends State<Home_View> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        leading: Builder(
          builder: (BuildContext contexto) {
            return IconButton(onPressed: () => Scaffold.of(contexto).openDrawer(), icon: Icon(Icons.menu, color: Colors.teal[900], size: 30,));
          }),
        title: Row(children: [
          Text('Random Store', style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.teal[600],
            fontSize: 23,
          ),),
          Spacer(),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications, color: Colors.teal[600], size: 30,)),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart, color: Colors.teal[600], size: 30,)),
        ],),
      ),
      drawer: SideMenu(),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        // onPageChanged: (value) => {
        //   currentIndex = value,
        //   setState(() {}),
        // },
        children: [
          ProductosFragment(),
          PerfilFragment(),
        ],
      ),
      floatingActionButton: currentIndex == 1
          ? FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.settings),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          currentIndex = index;
          // pageController.jumpToPage(index);
          pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.easeIn);
          setState(() {});
        },
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Productos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

class PerfilFragment extends StatelessWidget {
  const PerfilFragment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print('Creando perfil fragment');
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text('Perfil'),
      ),
    );
  }
}

class ProductosFragment extends StatelessWidget {
  const ProductosFragment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print('Creando productos fragment');
    return ListView.builder(
      itemCount: productos.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemList(producto: productos[index]);
      },
    );
  }
}