import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/page_header.dart';
import '../../data/models/first_aid_guide.dart';
import '../providers/library_provider.dart';
import '../widgets/guide_card.dart';
import 'guide_details_page.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LibraryProvider>();

    return Column(
      children: [
        const PageHeader(
          title: 'First Aid Library',
          subtitle: 'Search practical learning guides available in this prototype.',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            onChanged: provider.setQuery,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search first aid topics...',
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 42,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              for (final category in ['All', 'Injuries', 'Medical', 'Breathing'])
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(category),
                    selected: provider.category == category,
                    onSelected: (_) => provider.setCategory(category),
                  ),
                ),
            ],
          ),
        ),
        Expanded(
          child: provider.filteredGuides.isEmpty
              ? const Center(child: Text('No guides found.'))
              : ListView.builder(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                  itemCount: provider.filteredGuides.length,
                  itemBuilder: (context, index) {
                    final guide = provider.filteredGuides[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: GuideCard(
                        guide: guide,
                        isFavorite: provider.isFavorite(guide.id),
                        onFavoriteTap: () =>
                            provider.toggleFavorite(guide.id),
                        onTap: () => _openGuide(context, guide),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  void _openGuide(BuildContext context, FirstAidGuide guide) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => GuideDetailsPage(guide: guide),
      ),
    );
  }
}
