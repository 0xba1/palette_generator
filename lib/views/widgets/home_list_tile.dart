import 'package:flutter/material.dart';

class HomeListTile extends StatelessWidget {
  const HomeListTile({Key? key, required this.title, required this.onTap})
      : super(key: key);
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: ListTile(
            title: Text(title),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ),
      ),
    );
  }
}
