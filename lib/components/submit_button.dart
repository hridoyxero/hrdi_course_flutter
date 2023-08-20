import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrdi_course_flutter/res/app_colors.dart';

Widget submitButton({required String title, Color color = AppColors.primary, required VoidCallback onTap}){
  return InkWell(
    onTap: onTap,
    child: Container(
      width: double.maxFinite,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: 64,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
