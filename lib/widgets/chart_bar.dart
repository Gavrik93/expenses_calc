import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPrcOfTotal;

  const ChartBar(this.label, this.spendingAmount, this.spendingPrcOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('\$ ${spendingAmount.toStringAsFixed(0)}'),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          width: 20,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 1.0),
                  color: Color.fromARGB(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPrcOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
