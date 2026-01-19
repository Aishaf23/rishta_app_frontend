import 'package:flutter/material.dart';
import '../../../constants/color/app_color.dart';
import '../../../model/profile_model.dart';

class FlipIbCard extends StatelessWidget {
  const FlipIbCard({
    super.key,
    required this.profile,
    this.isPremiumPlus = true,
    this.isSuperConnect = true,
    this.onAccept,
    this.onDecline,
    this.onUpgrade,
    this.onTapHeart,
  });

  final Profile profile;
  final bool isPremiumPlus;
  final bool isSuperConnect;
  final VoidCallback? onAccept;
  final VoidCallback? onDecline;
  final VoidCallback? onUpgrade;
  final VoidCallback? onTapHeart;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        gradient: isSuperConnect
            ? const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFE7F2FF), Color(0xFFF9FBFF)],
        )
            : null,
        color: isSuperConnect ? null : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 15),

          // Header row
          Row(
            children: [
              if (isPremiumPlus) const _PremiumRibbon(),
              const Spacer(),
              if (isSuperConnect)
                Row(
                  children: [
                    const Icon(Icons.favorite,
                        size: 18, color: Color(0xFF2EA5B7)),
                    const SizedBox(width: 6),
                    Text(
                      'SUPER CONNECT',
                      style: theme.textTheme.labelMedium?.copyWith(
                        letterSpacing: .4,
                        color: const Color(0xFF2EA5B7),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  profile.timeAgo,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),

          // Avatar + heart button
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 2),
            child: Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(profile.image),
                    ),
                  ),
                  Positioned(
                    right: 5,
                    bottom: 8,
                    child: GestureDetector(
                      onTap: onTapHeart,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF25A9B5),
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          Icons.favorite,
                          color: Color(0xFF25A9B5),
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 4),

          // Locked message bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _LockedMessageBar(
              message: "Upgrade to see message",
              onUpgrade: onUpgrade,
            ),
          ),

          const SizedBox(height: 8),

          // Name and details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.verified,
                        color: Color(0xFFF4B400), size: 18),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        profile.name,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: Colors.black87,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '${profile.age} yrs, ${profile.height} • ${profile.profession}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  '${profile.language} • ${profile.location}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.black54,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),
          const Divider(),

          // Bottom actions (no swipe, just callbacks)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 2, 20, 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: onDecline,
                      child: const CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.close, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text("Not Now",
                        style: TextStyle(color: Colors.black54)),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: onAccept,
                      child: const CircleAvatar(
                        radius: 22,
                        backgroundColor: AppColors.success,
                        child: Icon(Icons.check, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text("Connect",
                        style: TextStyle(color: AppColors.success)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PremiumRibbon extends StatelessWidget {
  const _PremiumRibbon();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: const BoxDecoration(
        color: Color(0xFFE74C3C),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Row(
        children: const [
          Icon(Icons.emoji_events, color: Colors.white, size: 14),
          SizedBox(width: 6),
          Text(
            'Premium+',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _LockedMessageBar extends StatelessWidget {
  const _LockedMessageBar({required this.message, this.onUpgrade});

  final String message;
  final VoidCallback? onUpgrade;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFBFD6FF)),
      ),
      child: Row(
        children: [
          const Icon(Icons.lock, size: 18, color: Colors.redAccent),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.black87,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: onUpgrade,
            child: Row(
              children: const [
                Text(
                  'Upgrade',
                  style: TextStyle(
                    color: Color(0xFF1A73E8),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 4),
                Icon(Icons.chevron_right, color: Color(0xFF1A73E8)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
