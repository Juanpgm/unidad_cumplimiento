import 'package:flutter/material.dart';

class DescripcionExpandible extends StatefulWidget {
  final String descripcion;

  const DescripcionExpandible({Key? key, required this.descripcion}) : super(key: key);

  @override
  _DescripcionExpandibleState createState() => _DescripcionExpandibleState();
}

class _DescripcionExpandibleState extends State<DescripcionExpandible> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            width: double.infinity,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: isExpanded ? null : 100, // Establece la altura inicial a 100 píxeles
              child: Stack(
                children: [
                  SingleChildScrollView(
                    physics: isExpanded ? const NeverScrollableScrollPhysics() : const BouncingScrollPhysics(),
                    child: Text(
                      widget.descripcion,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  if (!isExpanded)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.white.withOpacity(0.0), Colors.white],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}