// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class FavoriteTask extends StatefulWidget {
  const FavoriteTask({super.key});

  @override
  State<FavoriteTask> createState() => _FavoriteTaskState();
}

class _FavoriteTaskState extends State<FavoriteTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Task Pages"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
