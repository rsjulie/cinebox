import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenresBox extends ConsumerStatefulWidget {
  const GenresBox({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GenresBoxState();
}

class _GenresBoxState extends ConsumerState<GenresBox> {
  final selectedGenre = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 8),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                selectedGenre.value = index;
              },
              child: ValueListenableBuilder(
                  valueListenable: selectedGenre,
                  builder: (_, value, __) {
                    return Container(
                      decoration: BoxDecoration(
                        color: value == index ? AppColors.redColor : AppColors.darkGrey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Center(
                        child: Text(
                          'data$index',
                          style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400),
                        ),
                      ),
                    );
                  }),
            ),
          );
        },
        itemCount: 20,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 16),
      ),
    );
  }
}
