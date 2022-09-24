import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:what_can_i_cook/components/constants.dart';
import 'package:what_can_i_cook/view/widgets/big_info_card.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
          height: 100.h,
          child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: kGreenColor,
            ),
            child: bigInfoCard(context, [
                Text(
                  'Настройки',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(.7),
                  ),
                ),
            ]),
          )
      ),
    );
  }
}