import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app03/data/models/news_model.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({Key? key, required this.data}) : super(key: key);
  final Article data;

  @override
  Widget build(BuildContext context) {
    final screensSize = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FancyShimmerImage(
           imageUrl: data.urlToImage ?? "https://images.wsj.net/im-768786/social",
              height: 115,
              width: screensSize.width / 3,
        ),
        const SizedBox(
          width: 7,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.title ?? "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:  Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                data.description ?? "",
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 15, color: Colors.grey),
              ),
              Text(
                data.publishedAt ?? "",
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey),
              ),
            ],
          ),
        )
      ],
    );
  }
}
