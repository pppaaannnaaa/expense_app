import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  String label;
  final double spendingAmount;
  final double spendingPctOfTotal;
  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, conts) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: conts.maxHeight * 0.15,
              width: 10,
              child: FittedBox(
                child: Text('\u{20B9} ${spendingAmount.toStringAsFixed(0)}'),
              ),
            ),
            SizedBox(
              height: conts.maxHeight * 0.03,
            ),
            Container(
              height: conts.maxHeight * 0.5,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: conts.maxHeight * (spendingPctOfTotal / 100),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: conts.maxHeight * 0.03,
            ),
            FittedBox(
              child: Text(label),
            ),
          ],
        );
      },
    );
  }
}
