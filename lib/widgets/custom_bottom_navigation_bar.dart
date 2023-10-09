import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar(
      {super.key, required this.selectedPageIndex, required this.onIconTap});

  final int selectedPageIndex;
  final Function onIconTap;

  @override
  Widget build(BuildContext context) {
    final barHeight = MediaQuery.of(context).size.height * 0.065;

    return BottomAppBar(
      color: selectedPageIndex == 0 ? Colors.black : Colors.white,
      child: Container(
        height: barHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _bottomNavBarItem(0, "Trang chủ", TextStyle(), "home"),
            _bottomNavBarItem(1, "Shop", TextStyle(), "shop"),
            _addNavItem(barHeight),
            _bottomNavBarItem(2, "Hộp thư", TextStyle(), "sms"),
            _bottomNavBarItem(3, "Hồ sơ", TextStyle(), "person"),
          ],
        ),
      ),
    );
  }

  _bottomNavBarItem(
      int index, String label, TextStyle textStyle, String iconName) {
    bool isSelected = selectedPageIndex == index;
    Color iconTextColor = isSelected ? Colors.black : Colors.grey;

    if (isSelected && selectedPageIndex == 0) {
      iconTextColor = Colors.white;
    }
    return GestureDetector(
      onTap: () => {onIconTap(index)},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
              "assets/${isSelected ? iconName + "_filled" : iconName + "_outlined"}.svg"),
          SizedBox(
            height: 3.h,
          ),
          Text(
            label,
            style: textStyle.copyWith(color: iconTextColor),
          )
        ],
      ),
    );
  }

  _addNavItem(double height) {
    return Container(
      height: height - 15.h,
      width: 48.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueAccent, Colors.redAccent],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Container(
          width: 41,
          height: height - 15.h,
          decoration: BoxDecoration(
            color: selectedPageIndex == 0 ? Colors.white : Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.add,
            color: selectedPageIndex == 0 ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
