import 'package:flutter/material.dart';

import '../../widget/future_builder_widget.dart';
class TechTab extends StatelessWidget {
  const TechTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilderWidget(category:"technology");
  }
}
