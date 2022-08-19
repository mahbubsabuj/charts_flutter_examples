import 'package:flutter/material.dart';

class ChartTile extends StatelessWidget {
  const ChartTile(
      {Key? key,
      required this.navigate,
      required this.title,
      required this.icon})
      : super(key: key);
  final Function navigate;
  final String title;
  final IconData icon;
  void _onPressed() {
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: false,
      shadowColor: Colors.white,
      child: GridTile(
        header: GridTileBar(
          title: Center(
            child: Text(title),
          ),
          backgroundColor: Colors.blue,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.blue,
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: _onPressed,
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.blue),
          ),
          child: Icon(icon, size: 80, color: Colors.red),
        ),
      ),
    );
  }
}
