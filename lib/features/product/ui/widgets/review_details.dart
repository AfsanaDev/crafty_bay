import 'package:crafty_bay/features/product/ui/widgets/product_description.dart';
import 'package:flutter/material.dart';

class ReviewDetailsWidget extends StatelessWidget {
  const ReviewDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.person_2_outlined,
                size: 28,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Afsana Akter',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          ProductDescription(
            description:
                'Wraps platform-specific persistent storage for simple data (NSUserDefaults on iOS and macOS, SharedPreferences on Android, etc.). Data may be persisted to disk asynchronously, and there is no guarantee that writes will be persisted to disk after returning, so this plugin must not be used for storing critical data',
          ),
        ],
      ),
    );
  }
}
