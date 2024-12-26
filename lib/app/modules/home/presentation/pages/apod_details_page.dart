import 'package:flutter/material.dart';
import 'package:nasa_challenge/app/modules/apod/domain/entities/apod_entity.dart';
import 'package:nasa_challenge/app/modules/home/presentation/widgets/apod_card.dart';
import 'package:nasa_challenge/app/shared/style/style_theme.dart';
import 'package:nasa_challenge/app/shared/widgets/appbar/app_bar_default.dart';
import 'package:nasa_challenge/app/shared/widgets/scaffold/scaffold_app.dart';

class ApodDetailsPage extends StatelessWidget {
  const ApodDetailsPage({
    super.key,
    required this.apodEntity,
  });
  final ApodEntity apodEntity;

  @override
  Widget build(BuildContext context) {
    return ScaffoldApp(
      appBar: AppBarDefault(
        title: 'Detalhes',
      ),
      child: Container(
        color: Style.theme.white,
        padding: Style.edgeInsets.sdAll,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ApodCard(
                apodEntity: apodEntity,
                onFavorite: null,
                onDetails: null,
                isHightQuality: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
