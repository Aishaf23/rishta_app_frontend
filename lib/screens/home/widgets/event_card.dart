import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constants/color/app_color.dart';
import '../../../constants/text/app_text.dart';

class EventCard extends StatefulWidget {
  final String name;
  final String description;
  final String imgUrl;
  final String heading;
  final String headingDescription;
  final DateTime startDate;
  final DateTime endDate;
  final Color gradientStart;
  final Color gradientEnd;

  const EventCard({
    super.key,
    required this.name,
    required this.description,
    required this.imgUrl,
    required this.heading,
    required this.headingDescription,
    required this.startDate,
    required this.endDate,
    required this.gradientStart,
    required this.gradientEnd,
  });

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  late final String _date;
  late final String _day;
  late final String _time;

  bool _isExpanded = false;
  Timer? _timer;

  final ValueNotifier<String> _duration = ValueNotifier<String>("");

  @override
  void initState() {
    super.initState();

    _date = DateFormat('d MMM').format(widget.startDate);
    _day = DateFormat('EEEE').format(widget.startDate);
    _time = DateFormat('hh:mm a').format(widget.startDate);

    _updateDuration();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _updateDuration());
  }

  void _updateDuration() {
    final now = DateTime.now();
    final remaining = widget.startDate.difference(now);

    String newDuration;
    if (remaining.isNegative) {
      newDuration = "Started";
    } else if (remaining.inDays >= 1) {
      final days = remaining.inDays;
      newDuration = "$days day${days > 1 ? 's' : ''} left";
    } else {
      final h = remaining.inHours.toString().padLeft(2, '0');
      final m = (remaining.inMinutes % 60).toString().padLeft(2, '0');
      final s = (remaining.inSeconds % 60).toString().padLeft(2, '0');
      newDuration = "$h:$m:$s";
    }

    if (_duration.value != newDuration) {
      _duration.value = newDuration;
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _duration.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [widget.gradientStart, widget.gradientEnd],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: AppText.heading.copyWith(
                            color: AppColors.white,
                            fontSize: 28,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          widget.description,
                          style: AppText.caption.copyWith(
                            color: AppColors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    widget.imgUrl,
                    height: 140,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),

            const Divider(),

            /// Event details
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Date box
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.info.withOpacity(0.75),
                          AppColors.info,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(_date,
                            style: AppText.button.copyWith(
                              color: AppColors.white,
                            )),
                        Text(_day,
                            style: AppText.subheading.copyWith(
                              color: AppColors.white,
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),

                  /// Event info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Heading + Expand toggle
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.heading,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              icon: Icon(
                                _isExpanded
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                              ),
                              onPressed: () =>
                                  setState(() => _isExpanded = !_isExpanded),
                            ),
                          ],
                        ),

                        if (_isExpanded)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              widget.headingDescription,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                          ),

                        /// Time
                        Row(
                          children: [
                            const Icon(Icons.access_time, size: 18),
                            const SizedBox(width: 4),
                            Text(
                              _time,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 6),

                        /// Add to Calendar
                        const Row(
                          children: [
                            Text(
                              "Add to Calendar",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.arrow_forward_ios, size: 11),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// Duration / Interested
            ListTile(
              dense: true,
              tileColor: Colors.grey.shade300,
              title: const Text("Interested"),
              trailing: ValueListenableBuilder<String>(
                valueListenable: _duration,
                builder: (_, value, __) => Text(
                  value,
                  style: AppText.subheading.copyWith(
                    color: AppColors.secondary,
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            /// Footer
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.grid_view),
                  SizedBox(width: 3),
                  Text("View more events"),
                  SizedBox(width: 8),
                  Icon(Icons.access_time),
                  SizedBox(width: 3),
                  Text("Event History"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
