import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile, Response;
import 'package:image_picker/image_picker.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:wahidstore/app/modules/bottomnav/views/bottomnav_view.dart';

import '../../../../api/end_points.dart';
import '../UserProfile.dart';

class AuthController extends GetxController {
  //for drawer
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var selectedCustomerType = Rx<String>('1'); // Default value

  // Text Controllers
  final shopNameController = TextEditingController();
  final ownerNameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Observables for validation
  final isPasswordVisible = false.obs;
  final selectedImage = Rx<XFile?>(null);

  final Dio _dio = Dio();

// TextEditingControllers for password update
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Observables to toggle password visibility
  final isCurrentPasswordVisible = false.obs;
  final isNewPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;
  //openDrawer
  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState!.closeDrawer();
  }

  // Pick Image
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage.value = pickedFile;
    }
  }

  // Validation Logic
  String? validateField(String value) {
    if (value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  // Send POST request to the server
  Future<void> submitForm() async {
    // Prepare the form data
    FormData formData = FormData.fromMap({
      'shop_name': shopNameController.text,
      'owner_name': ownerNameController.text,
      'address': addressController.text,
      'phone': phoneController.text,
      'email': emailController.text,
      'password': passwordController.text,
      if (selectedImage.value != null)
        'profile_image': await MultipartFile.fromFile(
          selectedImage.value!.path,
          filename: selectedImage.value!.name,
        ),
    });

    try {
      Response response = await _dio.post(
        'https://your-api-url.com/api/register', // Replace with your API URL
        data: formData,
      );

      // Handle the response
      if (response.statusCode == 200) {
        // Registration successful
        Get.snackbar('Success', 'Registration successful');
      } else {
        // Registration failed
        Get.snackbar('Error', 'Registration failed: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      // Handle Dio errors
      Get.snackbar('Error', 'An error occurred: ${e.message}');
    } catch (e) {
      // Handle other errors
      Get.snackbar('Error', 'An unexpected error occurred');
    }
  }

  @override
  void onClose() {
    shopNameController.dispose();
    ownerNameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // Started to integrate api
  final authLoading = false.obs;
  final profile = UserProfile().obs;
  final token = ''.obs;
  late StreamingSharedPreferences preferences;

  @override
  void onInit() {
    super.onInit();
    initialize();
  }

  void initialize() async {
    preferences = await StreamingSharedPreferences.instance;
    preferences.getString('token', defaultValue: '').listen((value) {
      token.value = value;
    });
    preferences.getString('profile', defaultValue: '').listen((value) {
      if (value.isNotEmpty) {
        profile.value = UserProfile.fromJson(jsonDecode(value));
      }
    });
  }

  void tryToSignIn() async {
    authLoading.value = true;

    if (emailController.text != '' || passwordController.text != '') {
      var data = {
        'email': emailController.text,
        'password': passwordController.text,
      };
      var dio = Dio();
      print(kLoginUrl);

      try {
        final response = await dio.post(
          kLoginUrl,
          data: data,
        );
        print(response.statusCode);
        int? statusCode = response.statusCode;
        authLoading.value = false;
        if (statusCode == 200) {
          profile.value = UserProfile.fromJson(response.data);
          token.value = profile.value.token!;
          preferences.setString('token', response.data['token']);
          preferences.setString('profile', jsonEncode(response.data));
          preferences.setString('username', profile.value.token!);

          Get.snackbar(
            'Success',
            "You are Logged In now.",
            backgroundColor: Colors.green,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );

          Get.offAll(const BottomnavView());
        } else {
          Get.snackbar(
            'Failed',
            "Something is wrong. Please try again.",
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } catch (e) {
        print(e);
        authLoading.value = false;
        Get.snackbar(
          'Failed',
          "Something is wrong. Please try again.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      authLoading.value = false;
      Get.snackbar(
        'Failed',
        "Enter your email and password",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void tryToSignUp() async {
    authLoading.value = true;

    if (emailController.text != '' || passwordController.text != '') {
      FormData formData = FormData.fromMap({
        'shop_name': shopNameController.text,
        'owner_name': ownerNameController.text,
        'user_type': 'customer',
        'address': addressController.text,
        'phone': phoneController.text,
        'email': emailController.text,
        'password': passwordController.text,
        if (selectedImage.value != null)
          'profile_image': await MultipartFile.fromFile(
            selectedImage.value!.path,
            filename: selectedImage.value!.name,
          ),
      });
      var dio = Dio();

      try {
        final response = await dio.post(
          kRegisterUrl,
          data: formData,
        );
        print(response.statusCode);
        int? statusCode = response.statusCode;
        authLoading.value = false;
        if (statusCode == 200) {
          profile.value = UserProfile.fromJson(response.data);
          token.value = profile.value.token!;
          preferences.setString('token', response.data['token']);
          preferences.setString('profile', jsonEncode(response.data));
          preferences.setString('username', profile.value.token!);

          Get.snackbar(
            'Success',
            "You are Logged In now.",
            backgroundColor: Colors.green,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );

          Get.offAll(const BottomnavView());
        } else {
          Get.snackbar(
            'Failed',
            "Something is wrong. Please try again.",
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } catch (e) {
        print(e);
        authLoading.value = false;
        Get.snackbar(
          'Failed',
          "Something is wrong. Please try again.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      authLoading.value = false;
      Get.snackbar(
        'Failed',
        "Enter your email and password",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void tryToSignOut() async {
    authLoading.value = true;
    preferences.clear();
    token.value = '';
    profile.value = UserProfile();
    Get.offAll(const BottomnavView());
    authLoading.value = false;
  }

//end to integrate api
}
