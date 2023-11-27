import 'package:flutter/material.dart';

class ZikeySwitchWidget extends StatelessWidget {
  const ZikeySwitchWidget({
    Key? key,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  final bool isActive;
  final Function(bool isActive) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(!isActive);
      },
      child: Container(
        width: 70,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isActive ? Colors.lightGreen : Colors.grey,
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              alignment:
              isActive ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 26,
                height: 26,
                margin: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: isActive ? Alignment.centerLeft : Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  isActive ? 'فعال' : 'غیر فعال',
                  style: TextStyle(
                    color: isActive ? Colors.white : Colors.black,
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}