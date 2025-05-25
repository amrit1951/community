import 'package:community_app/app/modules/members/member_card.dart';
import 'package:community_app/app/modules/members/member_details.dart';
import 'package:community_app/app/modules/members/members_list.dart';
import 'package:community_app/app/routes/app_routes.dart';
import 'package:community_app/shared/utils/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/themes/colors.dart';
import '../../components/appbar.dart';
import '../../components/bottombar.dart';
import '../../components/drewar.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({super.key});

  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  final TextEditingController _searchController = TextEditingController();

  var filteredMembers = [];

  @override
  void initState() {
    super.initState();
    filteredMembers = membersList;
  }

  void _filterMembers(String query) {
    final results = membersList.where((member) {
      final name = member['name']!.toString().toLowerCase();
      final desc = member['description']!.toString().toLowerCase();
      return name.contains(query.toLowerCase()) ||
          desc.contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredMembers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      drawer: Drawer(child: AppDrawer()),
      bottomNavigationBar: AppBottombar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: AppColors.background,
        ),
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              space(height: 20),
              // Search Bar
              SizedBox(
                width: Get.width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: TextField(
                    controller: _searchController,
                    onChanged: _filterMembers,
                    decoration: InputDecoration(
                      focusColor: AppColors.primary,
                      hintText: 'Search members...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),

              space(height: 10),

              //members list
              SizedBox(
                width: Get.width * 0.9,
                child: Column(
                  children: [
                    ...membersList.map((e) => MemberCard(
                          name: e['name']!.toString(),
                          description: e['description']!.toString(),
                          imageUrl: e['profileImage']!.toString(),
                          onTap: () {
                            Get.toNamed('/members-details');
                          },
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
