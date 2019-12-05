import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveButtons extends StatelessWidget {
  AdaptiveButtons({@required this.textInButton,@required this.handler});
final String textInButton;
final Function handler;



  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
                        ? CupertinoButton(
                            child: Text(
                              textInButton,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onPressed: handler,
                          )
                        : FlatButton(
                            textColor: Theme.of(context).primaryColor,
                            child: Text(
                              textInButton,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onPressed: handler,
                          );
  }
}