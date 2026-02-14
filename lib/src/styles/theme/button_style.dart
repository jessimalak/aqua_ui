import 'package:flutter/cupertino.dart';

class ButtonStyle {
  //PRIMARY STYLES
  static const LinearGradient primaryBorderGradient = LinearGradient(
    colors: [Color(0xff1d3caa), Color(0xff758ad5)],
    begin: Alignment.topCenter,
    end: Alignment.topCenter,
  );
  static const LinearGradient primaryBackgroundGradient = LinearGradient(
    colors: [Color(0xFF0099FF), Color(0xFFB5EEFE)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  //SECONDARY STYLES
  static const LinearGradient secondaryBorderGradient = LinearGradient(
    colors: [Color(0xff666666), Color(0xffc0c0c0)],
    begin: Alignment.topCenter,
    end: Alignment.topCenter,
  );
  static const LinearGradient secondaryBackgroundGradient = LinearGradient(
    colors: [Color(0xFFacacac), Color(0xFFffffff)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

enum ButtonShineSize {
  small(height: 4, topRadius: 5, bottomRadius: 2),
  normal(height: 12, topRadius: 32, bottomRadius: 10);

  const ButtonShineSize({required this.height, required this.topRadius, required this.bottomRadius});
  final double topRadius;
  final double bottomRadius;
  final double height;
}

class ButtonTopShine extends StatelessWidget {
  static const _white = Color.fromRGBO(255, 255, 255, 0.6);
  static const _transparent = Color.fromRGBO(255, 255, 255, 0.0);
  final ButtonShineSize size;
  const ButtonTopShine({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(size.topRadius),
          bottom: Radius.circular(size.bottomRadius),
        ),
        gradient: LinearGradient(
          colors: const [_white, _transparent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        // boxShadow: [
        //   BoxShadow(color: Color.fromRGBO(255, 255, 255, 0.5), blurRadius: 3),
        // ],
      ),
      child: SizedBox(height: size.height),
    );
  }
}
