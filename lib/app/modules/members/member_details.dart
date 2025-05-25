import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/appbar.dart';
import '../../components/drewar.dart';

class MemberDetails extends StatefulWidget {
  final String? name;
  final String? description;
  final String? title;
  const MemberDetails({super.key, this.name, this.description, this.title});

  @override
  State<MemberDetails> createState() => _MemberDetailsState();
}

class _MemberDetailsState extends State<MemberDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      drawer: Drawer(child: AppDrawer()),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.width,
                height: 200,
                decoration: BoxDecoration(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
