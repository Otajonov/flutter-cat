import 'package:flutter/material.dart';

class ContainerCard extends StatelessWidget {

  final double padding;
  final double margin;

  final String title;
  final List<Widget> actions;
  final Widget child;

  final double? width;
  final double? height;
  final Color? color;

  final VoidCallback? onTap;


  const ContainerCard({super.key,
    this.padding = 10.0,
    this.margin = 5.0,
    this.actions = const [],
    this.title = "",
    this.child = const SizedBox(),
    this.width,
    this.height,
    this.color,
    this.onTap,


  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
        child: Container(
      //padding: EdgeInsets.all(padding),
      margin: EdgeInsets.all(margin),
      width: width, height: height,
      decoration: BoxDecoration(
        //color: color ?? Colors.deepPurpleAccent.withOpacity(0.1),
        gradient: LinearGradient(
            colors: [
              color ?? Theme.of(context).primaryColor.withOpacity(0.1),
              getLighterColor(color ?? Theme.of(context).primaryColor.withOpacity(0.1))
            ]),

        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [


          if (title.isNotEmpty || actions.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(10),
        child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

            Text(title, style: const TextStyle(fontWeight: FontWeight.bold) ),

            Row( children: actions ),

          ]
          )),

          Padding(padding: EdgeInsets.all(padding),
          child: child,
          )



        ],
      ),
    ));
  }

  Color getLighterColor(Color color, {int amount = 50}) {
    int red = (color.red + amount).clamp(0, 255);
    int green = (color.green + amount).clamp(0, 255);
    int blue = (color.blue + amount).clamp(0, 255);

    return Color.fromARGB(color.alpha, red, green, blue);
  }

}
