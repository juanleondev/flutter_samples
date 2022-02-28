import 'package:flutter/material.dart';

class TemplateImage extends StatelessWidget {
  const TemplateImage({
    Key? key,
    required this.userName,
    required this.imagePath,
    required this.funnyPhrase,
  }) : super(key: key);

  final String userName;
  final String imagePath;
  final String funnyPhrase;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1200,
      height: 1200,
      color: const Color(0xff05172A),
      child: Stack(
        children: [
          const Positioned(
            top: 80,
            right: 80,
            child: SizedBox(
              height: 70,
              child: FlutterLogo(
                size: 70,
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            right: 0,
            child: SizedBox(height: 400, child: Image.asset(imagePath)),
          ),
          const Positioned(
            top: 112,
            left: 105,
            child: Text(
              'Tu secreto',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w700,
                color: Color(0xff05F0D4),
              ),
            ),
          ),
          Positioned(
            top: 342,
            left: 119,
            child: SizedBox(
              width: 990,
              child: Text(
                '$userName, $funnyPhrase',
                style:
                    const TextStyle(fontSize: 96, fontWeight: FontWeight.w700),
              ),
            ),
          )
        ],
      ),
    );
  }
}
