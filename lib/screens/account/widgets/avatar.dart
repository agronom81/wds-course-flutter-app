import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/core.dart';
import '../../../ui/ui.dart';
import '../bloc/account_cubit.dart';
import '../bloc/account_state.dart';

class Avatar extends StatefulWidget {
  const Avatar({
    super.key,
  });

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  final ImagePicker _picker = ImagePicker();

  void _pickImage(BuildContext context) async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (pickedFile != null) {
      File file = File(pickedFile.path);
      FormData formData = FormData.fromMap({
        'avatar':
            await MultipartFile.fromFile(file.path, filename: 'upload.jpg'),
      });

      if (!context.mounted) return;
      context.read<AccountCubit>().updateAvatar(formData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountCubit, AccountState>(
      listener: (context, state) {
        if (!state.isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: BlocBuilder<AccountCubit, AccountState>(
        builder: (context, state) {
          return InkWell(
            onTap: () {
              _pickImage(context);
            },
            child: state.user.avatar != ''
                ? CircleAvatar(
                    radius: 40.0,
                    backgroundImage: NetworkImage(
                      state.user.avatar,
                    ),
                  )
                : CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey,
                    child: CustomText(
                      fontSize: 34,
                      text: getFirstLetter(
                        state.user.user_display_name,
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
