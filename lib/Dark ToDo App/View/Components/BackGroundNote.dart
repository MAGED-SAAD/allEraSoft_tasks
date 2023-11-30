import 'package:flutter/material.dart';

class BackGroundNote extends StatelessWidget {
  final Color Bordercolor;
  final Widget? childd;
  final void Function()? onTap;

  const BackGroundNote({
    super.key,
    required this.Bordercolor,
    required this.childd,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 19, 19, 19),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Bordercolor, strokeAlign: 3, width: 3),
        ),
        child: childd,
      ),
    );
  }
}
