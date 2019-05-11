// Weiyi.Li 2019-02-06

import 'package:flutter/material.dart';

enum LoadingButtonState {
  IDLE, LOADING, DISABLED
}

/// A button which support 3 states: idle, loading , disabled.
class LoadingButton extends StatelessWidget {
  const LoadingButton({
    @required this.state,
    this.text,
    this.textColor,
    this.backgroundColor,
    this.progressColor,
    this.onPressed,
  });

  final LoadingButtonState state;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final Color progressColor;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {

    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
          opacity: state != LoadingButtonState.LOADING ? 1.0 : 0.0,
          child: RaisedButton(
            child: Text(state != LoadingButtonState.LOADING ? text : '', style: TextStyle(color: textColor)),
            onPressed: state == LoadingButtonState.IDLE ? onPressed : null,
            color: backgroundColor,
          ),
        ),
        Opacity(
          opacity: state == LoadingButtonState.LOADING ? 1.0 : 0.0,
          child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(progressColor)),
        )
      ]);
  }
}
