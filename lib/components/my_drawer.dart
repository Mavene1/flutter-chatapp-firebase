import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //logo
            Column(
              children: [
                DrawerHeader(
                    child: Center(
                        child: Icon(
                  Icons.message,
                  color: Theme.of(context).colorScheme.primary,
                  size: 40,
                ))),
                //home list tile
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text("H O M E"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                //settinmg list tile
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("S E T T I N G S"),
                    onTap: () {},
                  ),
                ),
              ],
            ),
            //logout
            Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
              child: ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("L O G O U T"),
                onTap: () {},
              ),
            )
          ],
        ));
  }
}
