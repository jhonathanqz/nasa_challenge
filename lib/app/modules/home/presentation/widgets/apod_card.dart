import 'package:flutter/material.dart';
import 'package:nasa_challenge/app/modules/apod/domain/entities/apod_entity.dart';
import 'package:nasa_challenge/app/modules/home/presentation/widgets/apod_view.dart';
import 'package:nasa_challenge/app/shared/style/style_theme.dart';

class ApodCard extends StatelessWidget {
  const ApodCard({super.key, required this.apodEntity, required this.onFavorite, required this.onDetails, required this.isHightQuality});
  final ApodEntity apodEntity;
  final bool isHightQuality;
  final Function(ApodEntity)? onFavorite;
  final Function(ApodEntity)? onDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Style.edgeInsets.bmin,
      child: Column(
        children: [
          ApodView(
            apodEntity: apodEntity,
            isHightQuality: isHightQuality,
          ),
          Container(
            margin: Style.edgeInsets.tmin,
            width: double.infinity,
            padding: Style.edgeInsets.minAll,
            decoration: Style.inputBorder.borderRadius.copyWith(
              color: Style.theme.grey3,
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    '${apodEntity.title}\n${apodEntity.datePtBR}',
                    style: Style.fieldStyle.title16Bold,
                  ),
                  subtitle: Text(
                    apodEntity.explanation,
                    style: Style.fieldStyle.simpleDarkStyle,
                  ),
                ),
                Visibility(
                  visible: onFavorite != null && onDetails != null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () => onDetails!(apodEntity),
                        icon: Icon(Icons.visibility),
                      ),
                      Style.spacing.smW,
                      IconButton(
                        onPressed: () => onFavorite!(apodEntity),
                        icon: Icon(
                          Icons.favorite,
                          color: apodEntity.isFavorite ? Style.theme.redColor : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
