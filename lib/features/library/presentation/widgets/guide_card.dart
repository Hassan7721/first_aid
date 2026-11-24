import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../data/models/first_aid_guide.dart';

class GuideCard extends StatelessWidget {
  const GuideCard({
    required this.guide,
    required this.onTap,
    this.isFavorite = false,
    this.onFavoriteTap,
    super.key,
  });

  final FirstAidGuide guide;
  final VoidCallback onTap;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.chatBlue.withOpacity(0.45),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(guide.icon, style: const TextStyle(fontSize: 24)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      guide.title,
                      style: const TextStyle(
                        color: AppColors.promptWine,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      guide.subtitle,
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              if (onFavoriteTap != null)
                IconButton(
                  onPressed: onFavoriteTap,
                  icon: Icon(
                    isFavorite ? Icons.bookmark : Icons.bookmark_border,
                    color: AppColors.promptWine,
                  ),
                )
              else
                const Icon(Icons.chevron_right, color: AppColors.promptWine),
            ],
          ),
        ),
      ),
    );
  }
}
