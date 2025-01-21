import 'package:elm_task/generated/l10n.dart';
import 'package:elm_task/src/domain/entity/incidents/media.dart';
import 'package:flutter/material.dart';

class MediaWidget extends StatelessWidget {
  final List<Media> media;

  const MediaWidget({
    super.key,
    required this.media,
  });

  @override
  Widget build(BuildContext context) {
    return media.isEmpty
        ? Text(
            S.of(context).noMediaFound,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).media,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: media.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: Image.network(
                        media[index].url,
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.broken_image,
                            size: 120,
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}
