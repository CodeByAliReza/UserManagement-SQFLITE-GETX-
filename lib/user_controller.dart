import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_practice/db_handler.dart';
import 'package:sqflite_practice/db_model.dart';

class UserController extends GetxController {
  final DbHandler _dbHandler = DbHandler();

  var userList = <DbModel>[].obs;
  var isLoading = false.obs;
  var selectedUser = Rxn<DbModel>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    isLoading.value = true;
    try {
      final data = await _dbHandler.readData();
      userList.assignAll(data);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addUser() async {
    if (nameController.text.isEmpty || emailController.text.isEmpty) return;

    String? error = await _dbHandler.insertData(
      DbModel(name: nameController.text, email: emailController.text),
    );

    if (error == null) {
      _clearFields();
      await fetchUsers();
      Get.snackbar(
        'Success',
        'User added successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withValues(alpha: 0.1),
      );
    } else {
      Get.snackbar(
        'Error',
        error,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withValues(alpha: 0.1),
      );
    }
  }

  Future<void> updateUser() async {
    if (selectedUser.value == null) return;

    await _dbHandler.updateData(
      DbModel(
        id: selectedUser.value!.id,
        name: nameController.text,
        email: emailController.text,
      ),
    );
    _clearFields();
    await fetchUsers();
    Get.snackbar(
      'Success',
      'User updated successfully',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  Future<void> deleteUser(int id) async {
    await _dbHandler.deleteData(id);
    await fetchUsers();
    Get.snackbar(
      'Deleted',
      'User removed from records',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void selectUser(DbModel user) {
    selectedUser.value = user;
    nameController.text = user.name;
    emailController.text = user.email;
  }

  void _clearFields() {
    nameController.clear();
    emailController.clear();
    selectedUser.value = null;
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
