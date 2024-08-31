// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:fullstack_taskmanagement/core/theme/app_palette.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Good morning', //Sesuaikan Keadaan Waktu Sekarang {note}
                style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 1.0,
              ),
              const Text(
                'Monday, January 25, 2021', //Sesuaikan Keadaan Waktu Sekarang {note}
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                height: 39.6,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  border: Border.all(
                    width: 1.0,
                    color: AppPalette.searchColorBorder,
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.search,
                        color: AppPalette.searchColorPrimary,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: null,
                        decoration: InputDecoration.collapsed(
                          filled: true,
                          fillColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          hintStyle: TextStyle(
                              color: AppPalette.searchColorPrimary,
                              fontWeight: FontWeight.w400),
                          hintText: "Search",
                        ),
                        onFieldSubmitted: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Center(
                child: Text(
                  'Recent Tasks',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppPalette.headerHomeTask),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Center(
                child: Image.asset(
                  'lib/assets/images/notask_image.png',
                  width: 300.0,
                  height: 300.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'No Recent Tasks',
                    style: TextStyle(
                        fontSize: 18,
                        color: HexColor("#090A0A"),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        'Tap Add New button for navigate\n to add new task page',
                    style: TextStyle(
                        fontSize: 14,
                        color: HexColor("#090A0A"),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppPalette.buttonColorPrimary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(48.0),
                      ),
                      fixedSize: const Size(170, 48)),
                  onPressed: () {},
                  child: const Text(
                    "Add New",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
