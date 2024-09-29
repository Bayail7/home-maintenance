import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditMajorScreen extends StatefulWidget {
  const EditMajorScreen({Key? key}) : super(key: key);

  @override
  State<EditMajorScreen> createState() => _EditMajorScreenState();
}

class _EditMajorScreenState extends State<EditMajorScreen> {
  final TextEditingController majorController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadMajor();
  }

  // Load the existing major
  void _loadMajor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String existingMajor = prefs.getString('user_major') ?? '';
    majorController.text = existingMajor;
  }

  // Save the major to SharedPreferences
  Future<void> _saveMajor() async {
    setState(() {
      isLoading = true;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_major', majorController.text);

    setState(() {
      isLoading = false;
    });

    Get.snackbar('Success', 'Major updated successfully.');
    Get.back(result: true); // Notify that the major was updated
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Major'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () async {
              await _saveMajor();
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Current Major:',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Text(
              majorController.text.isNotEmpty ? majorController.text : 'No Major Set',
              style: TextStyle(fontSize: 18.sp, color: Colors.grey),
            ),
            SizedBox(height: 20.h),
            TextField(
              controller: majorController,
              decoration: InputDecoration(labelText: 'Edit Your Major'),
            ),
            SizedBox(height: 20.h),
            if (isLoading) CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}