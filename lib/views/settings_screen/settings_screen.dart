import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_forever/shared/constants.dart';
import 'package:together_forever/views/profile_screen/profile_screen.dart';
import 'package:together_forever/widgets/custom_list_tile.dart';
import 'package:together_forever/widgets/custom_text.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static const String routeName = '/settingsScreen';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _selectedLang = 'en';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        //centerTitle: true,
        title: const CustomText(
          text: 'SETTINGS',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //alignment: Alignment.center,
          color: Colors.white,
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          CustomListTile(
            leading: Icons.manage_accounts,
            title: 'Manage Profile',
            onPressed: ()=>Get.toNamed(ProfileScreen.routeName),
          ),
          CustomListTile(
            leading: Icons.rule,
            title: 'Terms of Use',
            onPressed: () {},
          ),
          
          ListTile(
            leading: const Icon(Icons.language,color: KPrimaryColor,),
            title: Row(
              children: [
                const CustomText(
                  text: 'English',
                ),
                Radio(
                  value: 'en',
                  groupValue: _selectedLang,
                  onChanged: (String? lang) => setState(() {
                    _selectedLang = lang!;
                  }),
                ),
                const CustomText(
                  text: 'Arabic',
                ),
                Radio(
                  value: 'ar',
                  groupValue: _selectedLang,
                  onChanged: (String? lang) => setState(() {
                    _selectedLang = lang!;
                  }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
