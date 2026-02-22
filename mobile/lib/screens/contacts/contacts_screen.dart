import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../../widgets/avatar_widget.dart';

final _contacts = [
  {'name': 'Alex Rivera',   'email': 'alex.rivera@company.com',   'role': 'Product Manager'},
  {'name': 'Sarah Jenkins', 'email': 'sarah.jenkins@company.com', 'role': 'UX Designer'},
  {'name': 'Bob Chen',      'email': 'bob.chen@company.com',      'role': 'Backend Engineer'},
  {'name': 'Charlie Adams', 'email': 'charlie.adams@company.com', 'role': 'Frontend Engineer'},
  {'name': 'Diana Moore',   'email': 'diana.moore@company.com',   'role': 'Data Analyst'},
  {'name': 'Ethan Brooks',  'email': 'ethan.brooks@company.com',  'role': 'DevOps Engineer'},
];

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});
  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  String _search = '';

  @override
  Widget build(BuildContext context) {
    final filtered = _contacts.where((c) =>
      (c['name']!).toLowerCase().contains(_search.toLowerCase()) ||
      (c['role']!).toLowerCase().contains(_search.toLowerCase()),
    ).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Contacts'), actions: [
        IconButton(icon: const Icon(Icons.person_add_outlined), onPressed: () {}),
      ]),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Container(
              decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(14), border: Border.all(color: AppColors.border)),
              child: TextField(
                onChanged: (v) => setState(() => _search = v),
                style: const TextStyle(color: Colors.white, fontSize: 14),
                decoration: const InputDecoration(
                  hintText: 'Search contacts...',
                  prefixIcon: Icon(Icons.search, color: AppColors.textSecondary, size: 20),
                  border: InputBorder.none, enabledBorder: InputBorder.none, focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.fromLTRB(16, 8, 16, navBarBottom(MediaQuery.of(context).padding.bottom)),
              itemCount: filtered.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (_, i) {
                final c = filtered[i];
                return Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppColors.surface, borderRadius: BorderRadius.circular(16), border: Border.all(color: AppColors.border),
                  ),
                  child: Row(children: [
                    AvatarWidget(email: c['email']!, size: 42),
                    const SizedBox(width: 12),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(c['name']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14)),
                      const SizedBox(height: 2),
                      Text(c['role']!, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                    ])),
                    const Icon(Icons.chevron_right, color: AppColors.textSecondary, size: 18),
                  ]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
