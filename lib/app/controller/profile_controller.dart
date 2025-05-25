import 'package:get/get.dart';

class ProfileController extends GetxController {
  // User Profile Data
  final RxString name = 'John Doe'.obs;
  final RxString email = 'john.doe@example.com'.obs;
  final RxString profileImage = 'assets/images/profile_placeholder.jpg'.obs;
  final RxString about =
      'Passionate community member and tech enthusiast. Love sharing knowledge and connecting with like-minded individuals.'
          .obs;

  // Stats
  final RxInt eventsCount = 24.obs;
  final RxInt postsCount = 156.obs;
  final RxInt followingCount = 89.obs;

  // Skills & Interests
  final RxList<String> skills = <String>[
    'Flutter',
    'UI/UX Design',
    'Mobile Development',
    'Community Building',
    'Public Speaking',
  ].obs;

  // Recent Activities
  final RxList<Map<String, dynamic>> recentActivities = <Map<String, dynamic>>[
    {
      'title': 'Attended Tech Workshop',
      'time': '2 days ago',
      'icon': 'event',
    },
    {
      'title': 'Posted in Community Forum',
      'time': '3 days ago',
      'icon': 'forum',
    },
    {
      'title': 'Joined New Group',
      'time': '1 week ago',
      'icon': 'group',
    },
  ].obs;

  // Edit Profile
  void updateProfile({
    String? newName,
    String? newEmail,
    String? newAbout,
    String? newProfileImage,
  }) {
    if (newName != null) name.value = newName;
    if (newEmail != null) email.value = newEmail;
    if (newAbout != null) about.value = newAbout;
    if (newProfileImage != null) profileImage.value = newProfileImage;
  }

  // Add Skill
  void addSkill(String skill) {
    if (!skills.contains(skill)) {
      skills.add(skill);
    }
  }

  // Remove Skill
  void removeSkill(String skill) {
    skills.remove(skill);
  }

  // Add Activity
  void addActivity(String title, String time, String icon) {
    recentActivities.insert(0, {
      'title': title,
      'time': time,
      'icon': icon,
    });
  }
}
