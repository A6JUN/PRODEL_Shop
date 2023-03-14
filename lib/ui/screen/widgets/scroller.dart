import 'package:flutter/material.dart';

class Scroll extends StatelessWidget {
  final List<int> shades = [100, 200, 300, 400, 500, 600, 700, 800, 900];
  final ScrollController _horizontal = ScrollController(),
      _vertical = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: 400,
      child: Scrollbar(
        controller: _vertical,
        thumbVisibility: true,
        trackVisibility: true,
        child: Scrollbar(
          controller: _horizontal,
          thumbVisibility: true,
          trackVisibility: true,
          notificationPredicate: (notif) => notif.depth == 1,
          child: SingleChildScrollView(
            controller: _vertical,
            child: SingleChildScrollView(
              controller: _horizontal,
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(label: Text('Preview')),
                  DataColumn(label: Text('Color')),
                  DataColumn(label: Text('Shade')),
                ],
                rows: [
                  for (var color in Colors.primaries)
                    for (var shade in shades)
                      DataRow(
                        cells: [
                          DataCell(Container(
                              height: 20, width: 50, color: color[shade])),
                          DataCell(Text(color.toString())),
                          DataCell(Text('$shade')),
                        ],
                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
