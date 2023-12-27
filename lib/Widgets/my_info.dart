import 'package:flutter/material.dart';
import 'package:note_app/utils/strings.dart';

import '../models/user_model.dart';
import '../utils/constants.dart';

class MyInfo extends StatelessWidget {
  final UserModel? userModel;
  const MyInfo({super.key, this.userModel});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 14),
      width: double.infinity,
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Align(
            alignment: Alignment.center,
            child: Container(
                alignment: Alignment.topLeft,
                width: 30,
                height: 3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.dotGrey)),
          ),
          const SizedBox(height: 50),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(AppStrings.displayName,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyColor)),
              const SizedBox(height: 5),
              Text(userModel!.name ?? '',
                  // "Nazrul Islam",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ))
            ],
          ),
          const SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(AppStrings.emailAddress,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyColor)),
              const SizedBox(height: 5),
              Text(userModel!.userEmail ?? '',
                  // "nazrulIslam20@gmail.com",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ))
            ],
          ),
          const SizedBox(height: 30),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.address,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyColor)),
              SizedBox(height: 5),
              Text("33 street west subidbazar,sylhet",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ))
            ],
          ),
          const SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(AppStrings.phoneNumber,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyColor)),
              const SizedBox(height: 5),
              Text(userModel!.userPhone ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ))
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(AppStrings.mediaShared,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyColor)),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    AppStrings.viewAll,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.lightGreen),
                  ))
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/recentpic1.png',
                width: 92,
              ),
              Image.asset(
                'assets/images/recentpic2.png',
                width: 92,
              ),
              Image.asset(
                'assets/images/recentpic3.png',
                width: 92,
              ),
            ],
          ),
          const SizedBox(height: 30),
        ]),
      ),
    ));
  }
}
