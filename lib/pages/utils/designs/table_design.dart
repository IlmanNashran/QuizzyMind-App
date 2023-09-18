import 'package:flutter/material.dart';

class TableDesign extends StatelessWidget {
  final Widget leftColumn1;
  final Widget rightColumn1;
  final Widget leftColumn2;
  final Widget rightColumn2;
  final Widget leftColumn3;
  final Widget rightColumn3;

  TableDesign({
    required this.leftColumn1,
    required this.rightColumn1,
    required this.leftColumn2,
    required this.rightColumn2,
    required this.leftColumn3,
    required this.rightColumn3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(
          255, 255, 255, 255), // Adjust the border radius as needed

      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: const {
          0: IntrinsicColumnWidth(flex: 1), // Left column width
          1: IntrinsicColumnWidth(flex: 2), // Right column width
        },
        children: [
          TableRow(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0), // Adjust padding as needed
                decoration: const BoxDecoration(
                  color: Color.fromARGB(
                      255, 255, 255, 255), // Background color of the cell
                ),
                child: leftColumn1,
              ),
              Container(
                padding: EdgeInsets.all(16.0), // Adjust padding as needed
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of the cell
                  borderRadius: BorderRadius.circular(13.0),
                ),
                child: rightColumn1,
              ),
            ],
          ),
          TableRow(
            children: [
              Container(
                padding: EdgeInsets.all(8.0), // Adjust padding as needed
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of the cell
                  borderRadius: BorderRadius.circular(13.0),
                ),
                child: leftColumn2,
              ),
              Container(
                padding: EdgeInsets.all(16.0), // Adjust padding as needed
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of the cell
                  borderRadius: BorderRadius.circular(13.0),
                ),
                child: rightColumn2,
              ),
            ],
          ),
          TableRow(
            children: [
              Container(
                padding: EdgeInsets.all(8.0), // Adjust padding as needed
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of the cell
                  borderRadius: BorderRadius.circular(13.0),
                ),
                child: leftColumn3,
              ),
              Container(
                padding: EdgeInsets.all(16.0), // Adjust padding as needed
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of the cell
                  borderRadius: BorderRadius.circular(13.0),
                ),
                child: rightColumn3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
