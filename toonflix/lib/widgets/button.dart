import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  // Text와 Color들을 커스터마이징 할 수 있는 Widget
  final String text;
  final Color bgColor;
  final Color textColor;

  // 위에서 Code Actions의 Create constructor for final fields 선택하면 자동으로 생성
  const Button({
    super.key,
    required this.text,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(55),
      ),
      // 특정 값 대신 변수(text, textColor)가 들어가서 더이상 const가 아님
      // 자식 Widget이 모두 const인 경우에는 부모 Widget 하나에 const를 작성
      // 자식 Widget 중 일부만 const인 경우에는 해당 Widget에만 const를 작성
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 40,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
