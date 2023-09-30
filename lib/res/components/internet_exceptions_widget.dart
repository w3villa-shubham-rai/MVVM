import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Internetexceptionwidget extends StatefulWidget {
  final VoidCallback onpress;
  const Internetexceptionwidget({super.key,required this.onpress});

  @override
  State<Internetexceptionwidget> createState() =>
      _InternetexceptionwidgetState();
}

class _InternetexceptionwidgetState extends State<Internetexceptionwidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Container(
              color: const Color.fromARGB(239, 197, 6, 6),
              child: const Text("No Internet"),
            ),
          ),
        ),
        const Icon(
          Icons.cloud_off,
          size: 50,
        ),
        SizedBox(
          height: 30,
        ),
        InkWell(
          onTap: widget.onpress,  
          child: Container(
            height: 44,
            width: 160,
            color: Colors.deepOrangeAccent,
            child: Center(child: Text('Retry')),
          ),
        )
      ],
    );
  }
}
