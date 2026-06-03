import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavItem {
  final String title;
  final IconData icon;
  final String route;

  const NavItem({
    required this.title,
    required this.icon,
    required this.route,
  });
}

class CustomNavBar extends StatelessWidget {
  CustomNavBar({super.key});

  final List<NavItem> items = const [
    NavItem(
      title: 'Home',
      icon: Icons.home_outlined,
      route: '/home',
    ),
    NavItem(
      title: 'Sales',
      icon: Icons.trending_up,
      route: '/sales',
    ),
    NavItem(
      title: 'Projects',
      icon: Icons.folder_open_rounded,
      route: '/projects',
    ),
    NavItem(
      title: 'People',
      icon: Icons.groups_outlined,
      route: '/people',
    ),
    NavItem(
      title: 'Maps',
      icon: Icons.map_outlined,
      route: '/maps',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.path;

    return Container(
      width: 280,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 20),

          /// Logo + close button
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/frevolt_logo.png',
                  height: 60,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.first_page,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          /// Menu Items
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              itemCount: items.length,
              separatorBuilder:
                  (_, __) => const SizedBox(
                    height: 8,
                  ),
              itemBuilder: (context, index) {
                final item = items[index];
                final selected =
                    currentPath == item.route;

                return _NavTile(
                  title: item.title,
                  icon: item.icon,
                  selected: selected,
                  onTap: () {
                    context.go(item.route);
                  },
                );
              },
            ),
          ),

          /// User Card
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              height: 72,
              padding:
                  const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
                borderRadius:
                    BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 22,
                    child: Icon(Icons.person),
                  ),

                  const SizedBox(width: 12),

                  const Expanded(
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Vijay',
                          style: TextStyle(
                            fontWeight:
                                FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Administrator',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                     
                    },
                    icon: const Icon(
                      Icons.logout_rounded,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _NavTile({
    required this.title,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  State<_NavTile> createState() =>
      _NavTileState();
}

class _NavTileState extends State<_NavTile> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => hovered = true);
      },
      onExit: (_) {
        setState(() => hovered = false);
      },
      child: AnimatedScale(
        scale: hovered ? 1.03 : 1,
        duration: const Duration(
          milliseconds: 200,
        ),
        child: InkWell(
          borderRadius:
              BorderRadius.circular(8),
          onTap: widget.onTap,
          child: Container(
            height: 42,
            padding:
                const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
            decoration: BoxDecoration(
              color:
                  widget.selected
                      ? const Color(
                        0x32C3C4C4,
                      )
                      : Colors.white,
              borderRadius:
                  BorderRadius.circular(8),
              border: Border.all(
                color:
                    widget.selected ||
                            hovered
                        ? Colors.grey.shade300
                        : Colors.transparent,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  widget.icon,
                  size: 20,
                  color:
                      widget.selected
                          ? Colors.black
                          : Colors.grey,
                ),

                const SizedBox(width: 10),

                Text(
                  widget.title,
                  style: TextStyle(
                    color:
                        widget.selected
                            ? Colors.black
                            : Colors.grey.shade700,
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