import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/aset_controller.dart';

class AsetView extends GetView<AsetController> {
  const AsetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AsetView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AsetView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
