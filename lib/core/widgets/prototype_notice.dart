import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class PrototypeNotice extends StatelessWidget {
  const PrototypeNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: AppColors.chatBlue.withOpacity(0.35),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, color: AppColors.promptWine, size: 19),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'Prototype only: sample content is educational and does not replace emergency services, qualified medical care, or certified first-aid training.',
              style: TextStyle(
                color: AppColors.promptWine,
                fontSize: 11,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
