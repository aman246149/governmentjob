import 'package:flutter/material.dart';

void showCommonDialog(BuildContext context, String title, String data) {
  showDialog(
      context: context,
      builder: (_) {
        return SimpleDialog(
          backgroundColor: Colors.black,
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            )
          ],
        );
      });
}