import 'package:flutter/material.dart';

class CardHome extends StatelessWidget {
  String icon;
  String title;
  double quantidade;
  String preQuantidade;
  VoidCallback onPress;

  CardHome({
    Key? key,
    required this.icon,
    required this.onPress,
    required this.preQuantidade,
    required this.quantidade,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(icon, width: 80, height: 80),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(221, 49, 49, 49)),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('$preQuantidade: ${quantidade.toString()}',
                          style: const TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(221, 49, 49, 49))),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Material(
                        color: const Color.fromRGBO(157, 255, 206, 1),
                        child: InkWell(
                          onTap: onPress,
                          child: const Padding(
                            padding: EdgeInsets.all(6),
                            child: Icon(
                              Icons.arrow_forward_rounded,
                              color: Color.fromARGB(255, 58, 58, 58),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
