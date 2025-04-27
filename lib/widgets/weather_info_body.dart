import 'package:flutter/material.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Alexandria",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
        ),
        Text(
          'updated at 23:46',
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey[600],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/cloudy.png'),
            const Text(
              '23°',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w500,
              ),
            ),
            Column(
              children: [
                Text('max: 25°'),
                Text('min: 20°'),
              ],
            ),
          ],
        ),
        Text(
          'sunny',
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
