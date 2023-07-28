import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:zamjy/user_screen/account.dart';
import 'package:zamjy/user_screen/changeaddress.dart';
import 'package:zamjy/user_screen/changepass.dart';
import 'package:zamjy/user_screen/viewreserve_screen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: const TextSpan(
                    text: 'Hi, ',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '@username',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'email@gmail.com',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                title: const Text(
                  'My Account',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                leading: const Icon(EvaIcons.personOutline),
                trailing: const Icon(EvaIcons.arrowForwardOutline),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyAccountScreen()),
                  );
                },
              ),
              ListTile(
                title: const Text(
                  'Change Password',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                leading: const Icon(EvaIcons.lockOutline),
                trailing: const Icon(EvaIcons.arrowForwardOutline),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChangePassScreen()),
                  );
                },
              ),
              ListTile(
                title: const Text(
                  'My Address',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Address here'),
                leading: const Icon(EvaIcons.pinOutline),
                trailing: const Icon(EvaIcons.arrowForwardOutline),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChangeAddressScreen()),
                  );
                },
              ),
              Container(
                height: 20,
              ),
              ListTile(
                title: const Text(
                  'My Reservations',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                leading: const Icon(EvaIcons.calendar),
                trailing: const Icon(EvaIcons.arrowForwardOutline),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ViewReservationScreen()),
                  );
                },
              ),
              Container(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
                child: const Text(
                  'LOG OUT',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
