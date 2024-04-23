import 'package:flutter/material.dart';

import '../../widget/future_builder_widget.dart';
class SportTab extends StatelessWidget {
  const SportTab({super.key});

  @override
  Widget build(BuildContext context) {
     return FutureBuilderWidget(category:"sports");
  }
}
