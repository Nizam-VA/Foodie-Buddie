import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddie/controller/blocs/profile/profile_bloc.dart';
import 'package:foodiebuddie/utils/constants.dart';
import 'package:foodiebuddie/view/screen/addresses/screen_addresses.dart';
import 'package:foodiebuddie/view/screen/home/widgets/section_head.dart';
import 'package:foodiebuddie/view/screen/orders/screen_orders.dart';
import 'package:foodiebuddie/view/screen/profile/widgets/dialog.dart';
import 'package:foodiebuddie/view/screen/profile/widgets/sub_text.dart';
import 'package:foodiebuddie/view/screen/update_profile/screen_update_profiile.dart';
import 'package:foodiebuddie/view/widgets/app_bar.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProfileBloc>().add(GetProfileEvent());
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: AppBarWidget(title: 'Profile'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SectionHead(
                            heading: state.profile?.firstName ?? 'First name'),
                        TextButton(
                            onPressed: () async {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ScreenUpdateProfile(
                                      profile: state.profile!),
                                ),
                              );
                            },
                            child: const SectionHead(heading: 'EDIT'))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SubText(text: state.profile?.phone ?? 'Mobile Number'),
                        SubText(text: state.profile?.email ?? 'Email id')
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
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ScreenAddresses(),
                                  ),
                                );
                              },
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
                              onPressed: () async {
                                // await OrdersApiServices().getAllOrders();
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ScreenOrders(),
                                  ),
                                );
                              },
                              icon: const Icon(CupertinoIcons.right_chevron),
                            ),
                          ],
                        ),
                        kHight10,
                        divider2,
                        kHight10,
                        InkWell(
                            onTap: () async {
                              showDialogBox(context);
                            },
                            child: const SectionHead(heading: 'Logout')),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ));
  }
}
