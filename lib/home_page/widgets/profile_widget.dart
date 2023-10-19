import 'package:flutter/material.dart';

import '../../res/app_strings.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 10),

            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                AppStrings.image,
              ),
            ),

            const SizedBox(height: 20),
            Text(
              AppStrings.awardstitle,
              style: TextStyle(color: Theme.of(context).hintColor),
            ),
            const SizedBox(height: 10),
            const Text(
              AppStrings.awards,
              style: TextStyle(fontSize: 32),
            ),
            //Имя
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).cardColor),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.nameTitle,
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    const Text(
                      AppStrings.name,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).cardColor),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.emailTitle,
                      style: TextStyle(color: Theme.of(context).hintColor),
                    ),
                    const Text(
                      AppStrings.email,
                      style: TextStyle(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).cardColor),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.dateOfBirth,
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    const Text(
                      AppStrings.data,
                      style: TextStyle(),
                    ),
                  ],
                ),
              ),
            ),
            //Data
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).cardColor),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.team,
                          style: TextStyle(
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        const Text(
                          AppStrings.systemThem,
                          style: TextStyle(),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).cardColor),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.position,
                          style: TextStyle(
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        const Text(
                          AppStrings.skip,
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).cardColor),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.themeDesign,
                          style: TextStyle(
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        const Text(
                          AppStrings.systemThem,
                          style: TextStyle(),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
