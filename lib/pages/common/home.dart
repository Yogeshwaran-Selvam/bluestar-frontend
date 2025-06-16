import 'package:bluestar_ac_app/services/mock_data_generator.dart';
import 'package:flutter/material.dart';

import '../widgets/ac_tile.dart';

class HomePage extends StatefulWidget {
  final ValueNotifier<ThemeMode> themeNotifier;

  const HomePage({super.key, required this.themeNotifier});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      drawer: _moreOptions(),
      body: _body(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      leading: Builder(
        builder: 
          (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
      ),
      title: const Text('Home'),
      toolbarHeight: 50,
      actions: [
        IconButton(
          icon: widget.themeNotifier.value == ThemeMode.dark ? Icon(Icons.light_mode) : Icon(Icons.dark_mode),
          onPressed: () {
            widget.themeNotifier.value = widget.themeNotifier.value == ThemeMode.dark
                ? ThemeMode.light
                : ThemeMode.dark;
          },
        ),
      ],
    );
  }

  Widget _moreOptions() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: _accountHeader(),
          ),
          _customOptions(Icons.help_outline, 'Help', () => Navigator.pushNamed(context, '/help')),
          _customOptions(Icons.phone, 'Contact Us', () => Navigator.pushNamed(context, '/contactUs')),
          _customOptions(Icons.info_outline, 'About App', () => Navigator.pushNamed(context, '/about')),
          _customOptions(Icons.update, 'AC Software Update', () => Navigator.pushNamed(context, '/update')),
          _customOptions(Icons.build, 'Smart Service', () => Navigator.pushNamed(context, '/service')),
          _customOptions(Icons.logout, 'Sign Out', () => _signOut()),
          _customOptions(Icons.delete_forever, 'Delete Account', () => _deleteAccount()),
        ],
      ),
    );
  }

  Widget _accountHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/google-logo.png',),
        ),
        const SizedBox(width: 15),
        const Text(
          'User Name',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ],
    );
  }

  Widget _customOptions(IconData icon, String label, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: onTap,
    );
  }

  Future _signOut() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Sign Out'),
          content: const Text('Are you sure you want to sign out?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false),
              child: const Text('Sign Out'),
            ),
          ],
        );
      },
    );
  }

  Future _deleteAccount() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: const Text('Are you sure you want to delete your account? This action cannot be undone.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  Widget _body() {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      AcTile(acData: MockDataGenerator.generateACData()),
                      SizedBox(height: 8),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 60),
          ],
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: ElevatedButton(
            onPressed: () {
              // Handle button press
            },
            child: const Text('Add New AC...'),
          ),
        ),
      ],
    );
  }
}
