// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cinebox/ui/core/widgets/movie_card.dart';
import 'package:flutter/material.dart';

class MoviesBox extends StatelessWidget {
  final String title;

  const MoviesBox({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 32, bottom: 24),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 253,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return MovieCard();
            },
            separatorBuilder: (context, index) => SizedBox(
              width: 14, //TODO width space
            ),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(
              left: 20,
            ),
          ),
        ),
      ],
    );
  }
}
