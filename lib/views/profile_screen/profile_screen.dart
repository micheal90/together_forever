import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_forever/shared/constants.dart';
import 'package:together_forever/views/add_address_screen/add_address_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/profileScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Profile'),
              background: Image.asset(
                'assets/images/profile.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Column(
              children: [
                const ListTile(
                  leading: Icon(Icons.person,color: KPrimaryColor,),
                  title: Text('Full Name'),
                  subtitle: Text('Micheal Hana'),
                ),
                const ListTile(
                  leading: Icon(Icons.email,color: KPrimaryColor,),
                  title: Text('E-Mail'),
                  subtitle: Text('example@gmail.com'),
                ),
                const ListTile(
                  leading: Icon(Icons.phone,color: KPrimaryColor,),
                  title: Text('Mobile Number'),
                  subtitle: Text('+961 66666666'),
                ),
                 ListTile(
                  leading:const Icon(Icons.location_on_outlined,color: KPrimaryColor,),
                  title:const Text('Address'),
                  trailing: IconButton(
                    icon:const Icon(Icons.edit),
                    onPressed: ()=>Get.toNamed(AddAddressScreen.routeName),
                  ),
                  subtitle:
                    const  Text('Damascus babtoma\nkasaa street\nbuilding number 12'),
                ),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.logout),
                    label: const Text('Logout')),
              ],
            ),
            const SizedBox(
              height: 200,
            )
          ]))
        ],
      ),
    );
  }
}
