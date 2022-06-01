import 'package:flutter/material.dart';

class AnimationPicture extends StatefulWidget {
  const AnimationPicture({Key? key}) : super(key: key);

  @override
  State<AnimationPicture> createState() => _AnimationPictureState();
}

class _AnimationPictureState extends State<AnimationPicture>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 4))
        ..repeat(reverse: true);
  late  Animation<Offset> _animation =
      Tween(begin: Offset.zero, end: Offset(0.1, 0.1)).animate(_controller);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Image(
        image: AssetImage('Assets/images/flying_man.png'),
      ),
    );
  }
}
