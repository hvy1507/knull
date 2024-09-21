import 'dart:async';

import 'package:flutter/material.dart';

class Clickable extends StatelessWidget {
  /// Cũng là `InkWell` nhưng cho phép hiện ripple effect phía trên foreground thay vì phía dưới.
  const Clickable({
    super.key,
    this.onTap,
    this.onLongPress,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.decoration,
    required this.child,
  });

  final Widget child;
  final BoxDecoration? decoration;

  final void Function()? onTap;
  final void Function()? onLongPress;
  final void Function(TapDownDetails)? onTapDown;
  final void Function(TapUpDetails)? onTapUp;
  final void Function()? onTapCancel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      clipBehavior: decoration == null ? Clip.none : Clip.antiAlias,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          child,
          // if (stackChildren != null) ...stackChildren!,
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                onLongPress: onLongPress,
                onTapDown: onTapDown,
                onTapUp: onTapUp,
                onTapCancel: onTapCancel,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ClickableRepeated extends StatefulWidget {
  /// Là `Clickable` nhưng cho phép lặp lại `onTap` khi được nhấn giữ.
  const ClickableRepeated({
    super.key,
    this.decoration,
    this.delay = const Duration(milliseconds: 300),
    this.interval = const Duration(milliseconds: 50),
    this.onTap,
    required this.child,
  });

  final BoxDecoration? decoration;
  final Duration delay;
  final Duration interval;
  final Function()? onTap;
  final Widget child;

  @override
  State<ClickableRepeated> createState() => _ClickableRepeatedState();
}

class _ClickableRepeatedState extends State<ClickableRepeated> {
  Timer? delay;
  Timer? repeater;

  void onTapDown() {
    delay = Timer(widget.delay, () {
      repeater = Timer.periodic(widget.interval, (timer) {
        widget.onTap?.call();
      });
    });
  }

  void onTapUp() {
    delay?.cancel();
    repeater?.cancel();
  }

  @override
  void dispose() {
    onTapUp();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Clickable(
      decoration: widget.decoration,
      onTap: widget.onTap,
      onTapDown: widget.onTap == null
          ? null
          : (_) {
              onTapDown();
            },
      onTapUp: widget.onTap == null
          ? null
          : (_) {
              onTapUp();
            },
      onTapCancel: widget.onTap == null ? null : onTapUp,
      child: widget.child,
    );
  }
}
