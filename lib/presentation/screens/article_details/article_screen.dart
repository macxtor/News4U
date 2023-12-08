import 'package:flutter/material.dart';

import '../../../domain/models/article_model.dart';
import '../../widgets/custom_tag.dart';
import '../../widgets/image_container.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  static const routeName = '/article';

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as Article;
    return ImageContainer(
      width: double.infinity,
      imageUrl: article.imageUrl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: ListView(
          children: [_NewsHeadline(article: article), _NewsBody(article: article)],
        ),
      ),
    );
  }
}

class _NewsBody extends StatelessWidget {
  const _NewsBody({
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              CustomTag(
                backgroundColor: Colors.black,
                children: [
                  Text(
                    article.source,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              CustomTag(
                backgroundColor: Colors.grey.shade200,
                children: [
                  const Icon(
                    Icons.timer,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${DateTime.now().difference(article.publishedAt).inHours}h ago',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            article.title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            article.description,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.5),
          ),
          const SizedBox(height: 20),
          GridView.builder(
              shrinkWrap: true,
              itemCount: 2,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.25,
              ),
              itemBuilder: (context, index) {
                return ImageContainer(
                  width: MediaQuery.of(context).size.width * 0.42,
                  imageUrl: article.imageUrl,
                  margin: const EdgeInsets.only(right: 5.0, bottom: 5.0),
                );
              })
        ],
      ),
    );
  }
}

class _NewsHeadline extends StatelessWidget {
  const _NewsHeadline({
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          CustomTag(
            backgroundColor: Colors.grey.withAlpha(150),
            children: [
              Text(
                article.categories.first,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            article.title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.25,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            article.keywords,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
