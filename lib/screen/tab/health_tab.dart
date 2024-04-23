import 'package:flutter/material.dart';

import '../../widget/future_builder_widget.dart';

class HealthTab extends StatelessWidget {
  const HealthTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilderWidget(category: "health");
  }
}
