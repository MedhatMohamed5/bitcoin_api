import 'package:bitcoin_api/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key, required this.currency}) : super(key: key);
  final Currency currency;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  currency.code!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                htmlH2(currency.symbol, context),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              currency.description!,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rate:',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  currency.rate!,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Html htmlH2(String? text, BuildContext context) {
    return Html(
      data: '<h2>$text</h2>',
      shrinkWrap: true,
      style: {
        'h2': Style(
          margin: const EdgeInsets.all(0),
          color: Theme.of(context).primaryColor,
        ),
      },
    );
  }
}
