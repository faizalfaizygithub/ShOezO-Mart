import 'package:flutter/material.dart';
import 'package:ui/view/tools/myTextStyle.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Column(
        children: [
          Column(
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                    'assets/profile/pro2.jpg',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Faizal Faizy',
                  style: subheadingStyle,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      tiles('Edit Profile', Icons.person, () {}),
                      tiles('Orders', Icons.shopping_bag, () {}),
                      tiles('WishList', Icons.favorite_outline, () {}),
                      tiles('Help Center', Icons.help, () {}),
                      tiles('Privacy&Policy', Icons.privacy_tip, () {})
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  tiles(
    String txt,
    IconData icon,
    Function() ontap,
  ) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 40,
      width: 300,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey.shade500)),
      child: TextButton.icon(
          onPressed: ontap,
          icon: Icon(icon),
          label: Text(
            txt,
            style: mediumTextStyle,
          )),
    );
  }
}
