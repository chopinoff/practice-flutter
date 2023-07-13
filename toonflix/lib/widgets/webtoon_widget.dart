import 'package:flutter/material.dart';
import 'package:toonflix/screens/webtoon_app/detail_screen.dart';
import 'package:toonflix/widgets/webtoon_card.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;
  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                DetailScreen(title: title, thumb: thumb, id: id),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return Stack(
                children: [
                  SlideTransition(
                    position: Tween(
                      begin: const Offset(1.0, 0.0),
                      end: const Offset(0.0, 0.0),
                    ).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.ease,
                      ),
                    ),
                    child: child,
                  ),
                  SlideTransition(
                    position: Tween(
                      begin: const Offset(0.0, 0.0),
                      end: const Offset(1.0, 0.0),
                    ).animate(
                      CurvedAnimation(
                        parent: secondaryAnimation,
                        curve: Curves.ease,
                      ),
                    ),
                  ),
                ],
              );
            },
            transitionDuration: const Duration(milliseconds: 300),
            reverseTransitionDuration: const Duration(milliseconds: 300),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          // Hero : Hero의 tag가 같은 Widget은 화면 전환 시 같은 Widget처럼 움직임
          // Webtoon과 DetailScreen에 포함된 WebtoonCard를 Hero로 감싸준 후, tag: id로 지정
          Hero(
            tag: id,
            child: WebtoonCard(title: title, thumb: thumb, id: id),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
