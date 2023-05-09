 /*
   SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(3, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: VisitorTabHeader(
                          currentTab: currentTab,
                          index: index,
                          item: items[index],
                          onTap: () {
                            setState(() {
                              currentTab = index;
                            });
                          }),
                    );
                  }),
                ),
              ),



              import 'package:flutter/material.dart';
import 'package:residify/shared/features/visitorsaccess/domain/visitor_access_tab.dart';
import 'package:residify/utils/colors.dart';

class VisitorTabHeader extends StatelessWidget {
  const VisitorTabHeader({
    Key? key,
    required this.currentTab,
    required this.index,
    required this.item,
    this.onTap,
    this.padding,
    this.verticalPadding,
    this.fontSize,
    this.borderWidth,
  }) : super(key: key);
  final int currentTab;
  final int index;
  final VisitorAccessTab item;
  final void Function()? onTap;
  final double? padding, verticalPadding, fontSize, borderWidth;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: padding ?? 10,
          vertical: verticalPadding ?? 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: currentTab == index ? AppColors.primaryColor : AppColors.white,
          border: Border.all(
            color: AppColors.grey.withOpacity(0.2),
            width: borderWidth ?? 1.0,
          ),
        ),
        child: Text(
          item.title,
          style: TextStyle(
            fontSize: fontSize ?? 14,
            fontWeight: FontWeight.w600,
            color: currentTab == index ? AppColors.white : null,
          ),
        ),
      ),
    );
  }
}
*/