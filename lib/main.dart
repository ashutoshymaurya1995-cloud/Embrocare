import 'package:flutter/material.dart';

void main() {
  runApp(const EmbroCareApp());
}

class EmbroCareApp extends StatelessWidget {
  const EmbroCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EmbroCare',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.precision_manufacturing,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),

                const SizedBox(height: 20),

                const Text(
                  'EmbroCare',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Embroidery Machine Service Network',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 45),

                const Text(
                  'Aap kaun hain?',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    icon: const Icon(Icons.factory),
                    label: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Text(
                        'Machine Owner',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const DashboardScreen(
                            role: 'Machine Owner',
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 14),

                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.build),
                    label: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Text(
                        'Technician',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const DashboardScreen(
                            role: 'Technician',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  final String role;

  const DashboardScreen({
    super.key,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    final bool isOwner = role == 'Machine Owner';

    return Scaffold(
      appBar: AppBar(
        title: Text('EmbroCare • $role'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Welcome to EmbroCare',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          Text(
            isOwner
                ? 'Apni embroidery machine ke liye technician request karein.'
                : 'Available service jobs dekhein aur accept karein.',
          ),

          const SizedBox(height: 24),

          if (isOwner) ...[
            ActionCard(
              icon: Icons.build_circle,
              title: 'Technician Request',
              subtitle: 'Machine breakdown ke liye request raise karein',
            ),
            ActionCard(
              icon: Icons.precision_manufacturing,
              title: 'My Machines',
              subtitle: 'Apni machines add aur manage karein',
            ),
            ActionCard(
              icon: Icons.history,
              title: 'Service History',
              subtitle: 'Purane service jobs dekhein',
            ),
          ] else ...[
            ActionCard(
              icon: Icons.notifications_active,
              title: 'New Service Jobs',
              subtitle: 'Nearby technician requests dekhein',
            ),
            ActionCard(
              icon: Icons.work_history,
              title: 'My Jobs',
              subtitle: 'Accepted aur completed jobs',
            ),
            ActionCard(
              icon: Icons.account_balance_wallet,
              title: 'Earnings',
              subtitle: 'Apni service earnings dekhein',
            ),
          ],
        ],
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ActionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          radius: 25,
          child: Icon(icon),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(subtitle),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),
      ),
    );
  }
}
