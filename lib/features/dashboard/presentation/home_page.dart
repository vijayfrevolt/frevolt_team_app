import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frevolt_team_app/core/navigation/navigation_barrel.dart';
import 'package:frevolt_team_app/core/navigation/widgets/custom_nav_bar.dart';
import 'package:frevolt_team_app/features/auth/auth_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
      
      ),
      drawer: Drawer(
        child: CustomNavBar()
      ),
      body: Center(child: Column(
        children: [
          Text("HomePage"),
          ElevatedButton(
            child: Text("Log Out"),
            onPressed: () {
              ref.read(authNotifierProvider.notifier).logOut();
              context.go(AppRoutes.login);
            },
          )
        ],
      ),),
    );
  }
}