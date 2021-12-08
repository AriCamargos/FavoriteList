import 'package:favorite_list/hero_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'heroes_controller.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  _buildList() {
    HeroesController heroesController = Provider.of<HeroesController>(context);

    //Recebe o heroescontrole
    return ListView.builder(
      itemCount:
          heroesController.heroes.length, //Quantidade total de itens do laço cm length
      itemBuilder: (context, index) {
        return _buildItems(heroesController.heroes[index]);
      },
    );
  }

  _buildItems(HeroModel model) {
    HeroesController heroesController = Provider.of<HeroesController>(context);

    return ListTile(
      onTap: () {
        heroesController.checkFavorite(model);
      },
      title: Text(model.name!,
      style: TextStyle(color: Colors.purple,
      fontWeight: FontWeight.w400,
      ),),
      trailing: //Condição ternária para colocar a estrela correta no momento correto.
          model.isFavorite!
              ? Icon(
                  Icons.star,
                  color: Colors.yellow[600],
                )
              : Icon(Icons.star_border), //Coloca o widget a direita.
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Favoritos - Provider'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.purple,
                Colors.pink,
              ]),
            ),
        ),
        leading: Consumer<HeroesController>(
          builder: (context, heroesController, widget) {
            return Center(
              child: Text(
                "${heroesController.heroes.where((i) => i.isFavorite!).length}",
              ),);
          }
        ),  
      ),
      body: Consumer<HeroesController>(
          //Para recuperar o provider tem que tipar o consumer
        builder: (context, heroesController, widget) {
          return _buildList();
        },
      ),
    );
  }
}