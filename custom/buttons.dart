import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  const Btn({
    required this.text,
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              side: BorderSide(color: Colors.white, width: 1)),
          textStyle: Theme.of(context).textTheme.button,
          onPrimary: Theme.of(context).colorScheme.onPrimary,
          elevation: 0,
          minimumSize: Size(size.width, 40.0)),
      child: Text(
        text,
      ),
    );
  }
}


// ElevatedButton(
//                             style: ButtonStyle(
//                                 foregroundColor:
//                                     MaterialStateProperty.all<Color>(
//                                         Colors.white),
//                                 backgroundColor:
//                                     MaterialStateProperty.all<Color>(
//                                         const Color(0xff1A8FE3)),
//                                 shape: MaterialStateProperty.all<
//                                         RoundedRectangleBorder>(
//                                     RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10),)
                                