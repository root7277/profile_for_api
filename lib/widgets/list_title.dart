import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListTitleWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  final String image;
  const ListTitleWidget({super.key, required this.title, required this.subtitle, required this.image});

  @override
  State<ListTitleWidget> createState() => _ListTitleWidgetState();
}

class _ListTitleWidgetState extends State<ListTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: ListTile(
        leading: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.white,
          child: SvgPicture.asset(widget.image),
        ),
        title: Text(widget.title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF181D27))),
        subtitle: Text(widget.subtitle, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: Color(0xFFABABAB))),
        trailing: SvgPicture.asset('assets/icon_arrow.svg'),
      ),
    );
  }
}