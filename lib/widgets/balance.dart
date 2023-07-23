import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:santander_app/models/user_model/account.dart';

import '../shared/app_colors.dart';
import '../shared/app_images.dart';
import '../shared/app_settings.dart';

class BalanceWidget extends StatelessWidget {
  final Account account;
  const BalanceWidget({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: AppSettings.screenWidth,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  AppImages.moneyCircle,
                  semanticsLabel: '',
                  colorFilter:
                      ColorFilter.mode(AppColors.black, BlendMode.srcIn),
                  height: 25,
                ),
                Text(
                  "Saldo disponível",
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SvgPicture.asset(
                  AppImages.up,
                  semanticsLabel: '',
                  colorFilter:
                      ColorFilter.mode(AppColors.black, BlendMode.srcIn),
                  height: 12,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "R\$ ${NumberFormat('#,##0.00', 'pt_BR').format(account.balance)}",
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Saldo + Limite: R\$ ${NumberFormat('#,##0.00', 'pt_BR').format(account.balance! + account.limit!)}",
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(
              height: 2,
              color: AppColors.whiteCuston,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ver extrato",
                  style: TextStyle(
                      color: AppColors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
