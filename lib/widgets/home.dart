import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../class/class.dart';
import '../provider/provider.dart';
import 'list_title.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Model? model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Model>(
        future: getModel(),

        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Builder(builder: (context){
              return const Center(child: CircularProgressIndicator());
            });
          }

          if(snapshot.hasData){
            model = snapshot.data;
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16, top: 40),
                child: Text('Profile', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFF181D27))),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  padding: const EdgeInsets.only(top: 7, right: 20),
                  height: 89,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Color(0xFF0601B4)
                  ),
                  child: ListTile(
                    leading: Image.network(model!.imageU),
                    title: Text(model!.firstName + ' ' + model!.lastName, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white)),
                    subtitle: Text(model!.email, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: Color(0xFFD7D7D7))),
                    trailing: SvgPicture.asset('assets/icon_pin.svg'),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              const ListTitleWidget(title: 'My Account ', subtitle: 'Make changes to your account', image: 'assets/profile_icon.svg'),
              const SizedBox(height: 25),
              const ListTitleWidget(title: 'Saved Beneficiary', subtitle: 'Manage your saved account', image: 'assets/profile_icon.svg'),
              const SizedBox(height: 25),
              const ListTitleWidget(title: 'Face ID / Touch ID', subtitle: 'Manage your device security', image: 'assets/lock.svg'),
              const SizedBox(height: 25),
              const ListTitleWidget(title: 'Two-Factor Authentication', subtitle: 'Further secure your account for safety', image: 'assets/security.svg'),
              const SizedBox(height: 25),
              const ListTitleWidget(title: 'Log out', subtitle: 'Further secure your account for safety', image: 'assets/out.svg'),
            ],
          );
        }
      )
    );
  }
}