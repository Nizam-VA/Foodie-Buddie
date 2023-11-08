import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodiebuddie/core/constants.dart';
import 'package:foodiebuddie/view/screen/home/widgets/section_head.dart';
import 'package:foodiebuddie/view/screen/profile/widgets/sub_text.dart';
import 'package:foodiebuddie/view/widgets/app_bar.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: AppBarWidget(title: 'Profile'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SectionHead(heading: 'NISSAMUDEEN VA'),
                    TextButton(
                        onPressed: () {},
                        child: const SectionHead(heading: 'EDIT'))
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SubText(text: '+91 8893574657'),
                    SubText(text: 'nizamuasharaf@gmail.com')
                  ],
                ),
                kHight10,
                divider5,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SectionHead(heading: 'Addresses'),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(CupertinoIcons.right_chevron),
                        )
                      ],
                    ),
                    const SubText(text: 'Share, Edit & Add new addresses'),
                    kHight10,
                    divider2,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SectionHead(heading: 'Orders'),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(CupertinoIcons.right_chevron),
                        ),
                      ],
                    ),
                    kHight10,
                    divider2,
                    kHight10,
                    InkWell(
                        onTap: () {},
                        child: const SectionHead(heading: 'Logout')),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
