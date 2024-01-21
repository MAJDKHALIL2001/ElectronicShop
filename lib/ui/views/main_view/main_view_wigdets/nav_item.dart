import 'package:api_challenge/ui/shared/colors.dart';
import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.icon,
    this.isSelected = false,
    required this.ontap,
  });
  final IconData icon;
  final Function ontap;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: isSelected!
                    ? BorderSide(width: 3, color: AppColors.blue200)
                    : BorderSide.none)),
        child: Icon(
          icon,
          size: 50,
          color: isSelected! ? AppColors.blue200 : null,
        ),
      ),
    );
  }
}
