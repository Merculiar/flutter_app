import 'package:flutter/material.dart';

class AnimatedAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double _preferredHeight = 80.0;
  final String title;
  final String imagePath;
  final Color color;

  AnimatedAppBar(this.title, this.imagePath, this.color);

  @override
  _AnimatedAppBarState createState() => _AnimatedAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(_preferredHeight);
}

class _AnimatedAppBarState extends State<AnimatedAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 180));
    _rotateAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      padding: EdgeInsets.only(top: 20.0),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          FittedBox(
            fit: BoxFit.fitWidth,
            child: ClipRect(
              child: Align(
                heightFactor: 0.18,
                alignment: Alignment.topCenter,
                child: RotationTransition(
                  turns: _rotateAnimation,
                  child: Image.asset(widget.imagePath),
                ),
              ),
            ),
          ),
          Text(
            widget.title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
                letterSpacing: 10.0),
          )
        ],
      ),
    );
  }
}
