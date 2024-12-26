import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nasa_challenge/app/modules/home/presentation/controller/apod_favorites_controller.dart';
import 'package:nasa_challenge/app/modules/home/presentation/store/favorite_store.dart';
import 'package:nasa_challenge/app/modules/home/presentation/widgets/apod_card.dart';
import 'package:nasa_challenge/app/shared/style/style_theme.dart';
import 'package:nasa_challenge/app/shared/widgets/appbar/app_bar_default.dart';
import 'package:nasa_challenge/app/shared/widgets/scaffold/scaffold_app.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({
    super.key,
    required this.controller,
  });
  final ApodFavoritesController controller;

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late ApodFavoritesController controller;
  late FavoriteStore store;

  @override
  void initState() {
    controller = widget.controller;
    store = controller.favoriteStore;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getAllFavorites();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ScaffoldApp(
        isLoading: store.isLoading,
        appBar: AppBarDefault(
          title: 'Favoritos',
          leading: Container(),
        ),
        child: Container(
          padding: Style.edgeInsets.sdAll,
          child: store.favorites.isEmpty
              ? Center(
                  child: Text('Nenhum favorito encontrado'),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: store.favorites.length,
                        itemBuilder: (context, index) {
                          final favorite = store.favorites[index];
                          return ApodCard(
                            isHightQuality: false,
                            apodEntity: favorite,
                            onFavorite: (e) => controller.saveFavorite(e),
                            onDetails: (e) => controller.navigateToDetails(e),
                          );
                        },
                      ),
                    )
                  ],
                ),
        ),
      );
    });
  }
}
