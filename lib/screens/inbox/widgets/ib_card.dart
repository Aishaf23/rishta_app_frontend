import 'package:flutter/material.dart';

/// A highly styled profile invitation card inspired by the provided mockup.
///
/// Usage example:
/// ```dart
//  IbCard(
//    name: 'Rehman A',
//    age: 24,
//    height: "5' 8\"",
//    profession: 'Agent / Broker / Trader',
//    detailsLine: 'Urdu, Shia • Lahore, Punjab',
//    dateLabel: '28 Aug',
//    messagePreview: 'Rehman A has sent you a mes…',
//    isPremiumPlus: true,
//    isSuperConnect: true,
//    avatarImage: const AssetImage('assets/men.png'),
//    onAccept: (){},
//    onDecline: (){},
//    onUpgrade: (){},
//    onTapHeart: (){},
//  )
/// ```
class IbCard extends StatelessWidget {
  const IbCard({
    super.key,
    required this.name,
    required this.age,
    required this.height,
    required this.profession,
    required this.detailsLine,
    required this.dateLabel,
    required this.messagePreview,
    required this.avatarImage,
    this.isPremiumPlus = false,
    this.isSuperConnect = false,
    this.onAccept,
    this.onDecline,
    this.onUpgrade,
    this.onTapHeart,
  });

  final String name;
  final int age;
  final String height; // e.g., 5' 8"
  final String profession;
  final String detailsLine; // e.g., Urdu, Shia • Lahore, Punjab
  final String dateLabel; // e.g., 28 Aug
  final String messagePreview;
  final ImageProvider avatarImage;
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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 15),
          // Header badges row
          Row(
            children: [
              if (isPremiumPlus) _PremiumRibbon(),
              const Spacer(),
              if (isSuperConnect)
                Row(
                  children: [
                    const Icon(
                      Icons.favorite,
                      size: 18,
                      color: Color(0xFF2EA5B7),
                    ),
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
                  dateLabel,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),

          // Avatar + heart button
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
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
                      radius: 86,
                      backgroundColor: Colors.white,
                      backgroundImage: avatarImage,
                    ),
                  ),
                  Positioned(
                    right: -2,
                    bottom: 10,
                    child: GestureDetector(
                      onTap: onTapHeart,
                      child: Container(
                        height: 36,
                        width: 36,
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
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 6),

          // Locked message bar with Upgrade CTA
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _LockedMessageBar(
              message: messagePreview,
              onUpgrade: onUpgrade,
            ),
          ),

          const SizedBox(height: 12),

          // Name and details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.verified,
                      color: Color(0xFFF4B400),
                      size: 18,
                    ),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        name,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: Colors.black87,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  '$age yrs, $height • $profession',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  detailsLine,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.black54,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),
          Divider(),
          // Bottom actions
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
            child: Row(
              children: [
                _BottomTextButton(
                  icon: Icons.close,
                  label: 'Decline',
                  onTap: onDecline,
                  iconColor: Colors.black45,
                ),
                const Spacer(),
                _AcceptButton(onTap: onAccept, isSuperConnect: isSuperConnect),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PremiumRibbon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFE74C3C),
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
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
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

class _BottomTextButton extends StatelessWidget {
  const _BottomTextButton({
    required this.icon,
    required this.label,
    this.onTap,
    this.iconColor,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 34,
            width: 34,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 20, color: iconColor ?? Colors.black54),
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _AcceptButton extends StatelessWidget {
  const _AcceptButton({this.onTap, this.isSuperConnect = false});
  final VoidCallback? onTap;

  final bool isSuperConnect;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            'Accept',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF0BA77A),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            height: 54,
            width: 54,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF33E089), Color(0xFF1EB980)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Icon(
              Icons.check,
              color: isSuperConnect ? Colors.white : Colors.white,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
