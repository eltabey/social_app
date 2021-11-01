import 'package:flutter/material.dart';
import 'package:social/shared/components/cmponents.dart';

class NewPostScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: 'Add Post',

      ),
    );
  }
}
