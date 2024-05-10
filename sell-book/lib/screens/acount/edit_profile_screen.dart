import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:brainiaccommerce2/controller/authentication_controller.dart';

class UpdateProfileScreen extends StatefulWidget {
  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final AuthenticationController _authController = Get.find();
  final _formKey = GlobalKey<FormState>();

  String _numberID = '';
  String _fullName = '';
  String _phoneNumber = '';
  String _gender = '';
  String _birthDay = '';
  String _schoolYear = '';
  String _schoolKey = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cập nhật thông tin'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Mã số ID',
                  prefixIcon: Icon(Icons.numbers),
                ),
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.red,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mã ID';
                  }
                  return null;
                },
                onSaved: (value) {
                  _numberID = value!;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Họ và tên',
                  prefixIcon: Icon(Icons.person),
                ),
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.red,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập họ và tên';
                  }
                  return null;
                },
                onSaved: (value) {
                  _fullName = value!;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Số điện thoại',
                  prefixIcon: Icon(Icons.phone),
                ),
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.red,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập số điện thoại';
                  }
                  return null;
                },
                onSaved: (value) {
                  _phoneNumber = value!;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Giới tính',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.red,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập giới tính';
                  }
                  return null;
                },
                onSaved: (value) {
                  _gender = value!;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Ngày sinh',
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.red,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập ngày sinh';
                  }
                  return null;
                },
                onSaved: (value) {
                  _birthDay = value!;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Năm học',
                  prefixIcon: Icon(Icons.school),
                ),
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.red,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập năm học';
                  }
                  return null;
                },
                onSaved: (value) {
                  _schoolYear = value!;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Khoá học',
                  prefixIcon: Icon(Icons.import_contacts),
                ),
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.red,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập khoá học';
                  }
                  return null;
                },
                onSaved: (value) {
                  _schoolKey = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      // color: Colors.white,
                    ),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20.0), // Adjust border radius here
                    ),
                  ),
                ),
                onPressed: () {
                  _updateProfile();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text('Cập nhật'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _updateProfile() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      bool success = await _authController.updateProfile(
        numberID: _numberID,
        fullName: _fullName,
        phoneNumber: _phoneNumber,
        gender: _gender,
        birthDay: _birthDay,
        schoolYear: _schoolYear,
        schoolKey: _schoolKey,
      );

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile updated successfully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update profile')),
        );
      }
    }
  }
}
