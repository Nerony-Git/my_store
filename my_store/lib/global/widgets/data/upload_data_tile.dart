import 'package:flutter/material.dart';
import 'package:my_store/utils/constants/colors.dart';

class UploadDataTile extends StatelessWidget {
  const UploadDataTile({
    super.key,
    required this.icon,
    required this.title,
    this.trailing = Icons.cloud_upload,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final IconData? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: MyColors.primary,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: Icon(
        trailing,
        size: 20,
      ),
      onTap: onTap,
    );
  }
}
