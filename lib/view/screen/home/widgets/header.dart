import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    required this.name,
    required this.width,
    required this.height,
  });

  final String name;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
              // style: DefaultTextStyle.of(cxt).style,
              children: <TextSpan>[
                const TextSpan(
                    text: 'Good evening\n',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    )),
                TextSpan(
                  text: name,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700]),
                ),
              ]),
        ),
        Container(
          alignment: Alignment.center,
          width: width * .125,
          height: height * .06,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
