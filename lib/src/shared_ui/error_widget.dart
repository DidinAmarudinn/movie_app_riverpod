// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movie_app_riverpod/src/utils/theme.dart';

class ErrorText extends StatelessWidget {
  final String? error;
  final VoidCallback reload;
  const ErrorText({
    Key? key,
    this.error,
    required this.reload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          error ?? "",
          style: TextStyle(
              color: Theme.of(context).textTheme.headline1?.color,
              fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
          onPressed: reload,
          style:
              ElevatedButton.styleFrom(backgroundColor: ThemeConfig.greyColor),
          child: Row(
            children:  const [
              Text(
                "Reload",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Icon(Icons.refresh)
            ],
          ),
        )
      ],
    );
  }
}
