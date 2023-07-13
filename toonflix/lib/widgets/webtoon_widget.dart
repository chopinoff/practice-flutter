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
    // GestureDetector : 제스처에 따라 이벤트를 발생하는 Widget
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, route) : route에 해당하는 페이지로 이동
        // route는 StatelessWidget을 지원하지 않음 > Route로 변경해야 함
        // 1. MetarialPageRoute : StatelessWidget을 route로 감싸주는 Widget
        // 운영 체제에 따라 다른 interface 제공 (넘어가는 방향 등)
        // 2. PageRouteBuilder
        // 운영 체제에 구애받지 않고 애니메이션 적용
        // https://docs.flutter.dev/cookbook/animation/page-route-animation
        // https://api.flutter.dev/flutter/widgets/PageRouteBuilder/buildTransitions.html

        Navigator.push(
          context,
          PageRouteBuilder(
            // 1. pageBuilder : 이동할 페이지(Widget)을 반환하는 함수
            pageBuilder: (context, animation, secondaryAnimation) =>
                DetailScreen(title: title, thumb: thumb, id: id),
            // 2. transitionsBuilder : 이동 시 애니메이션을 설정하는 함수
            // - animation : 라우터 이동 시 애니메이션
            // - secondaryAnimation : 페이지 빠져나올 시 애니메이션
            // - child : 애니메이션 적용 할 컴포넌트
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              // SlideTransition을 반환
              // 여러 개(animation, secondaryAnimation)를 설정하는 경우, Stack에 담아서 반환
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
                    // child : SlideTransition을 실행할 Widget
                    // SlideTransition이 여러 개일 경우에도 한 번만 설정해줌 (child를 동일한 Widget으로 중복 설정하면 에러 발생)
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
            // duration : animation, secondaryAnimation의 시간 설정
            transitionDuration: const Duration(milliseconds: 300),
            reverseTransitionDuration: const Duration(milliseconds: 300),
            // fullscreenDialog : true면 닫기 버튼, false면 뒤로가기 버튼
            fullscreenDialog: true,
          ),
        );
      },
      // WebtoonCard Widget 분리
      child: Column(
        children: [
          WebtoonCard(title: title, thumb: thumb, id: id),
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
