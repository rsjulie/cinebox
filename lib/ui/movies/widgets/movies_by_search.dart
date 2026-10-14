import 'package:cinebox/ui/movies/widgets/movies_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesBySearch extends ConsumerStatefulWidget {
  const MoviesBySearch({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MoviesByGenderState();
}

class _MoviesByGenderState extends ConsumerState<MoviesBySearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 140),
      child: MoviesBox(
        title: 'Filmes Encontrados',
        vertical: true,
      ),
    );
  }
}
