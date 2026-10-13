import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesAppBar extends ConsumerStatefulWidget {
  const MoviesAppBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MoviesAppBarState();
}

class _MoviesAppBarState extends ConsumerState<MoviesAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar();
  }
}
