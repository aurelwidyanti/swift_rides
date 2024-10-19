import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CarDetailScreen extends StatelessWidget {
  final String name;
  final String type;
  final double price;
  final String imageUrl;

  const CarDetailScreen(
      {super.key,
      required this.name,
      required this.type,
      required this.price,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Car Detail'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 64, 24, 24),
          child: Column(
            children: [
              Image.asset(
                imageUrl,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.14,
                        ),
                      ),
                      Text(type,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.14,
                          )),
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'IDR ${price.toStringAsFixed(0)}K',
                          style: const TextStyle(
                            color: Color.fromRGBO(23, 93, 227, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.14,
                          ),
                        ),
                        const TextSpan(
                          text: '/day',
                          style: TextStyle(
                            color: Color.fromRGBO(178, 176, 176, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 0.14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam faucibus nibh sed diam pharetra condimentum. Vivamus varius, leo at tincidunt placerat, sapien justo congue turpis, sed.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Color.fromRGBO(167, 167, 167, 1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
