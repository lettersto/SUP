import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/review/review_filter_provider.dart';
import '../../utils/styles.dart';

class SearchBar extends ConsumerStatefulWidget {
  final String hintText;
  final IconData? icon; // Icon.add, Icon.favorite ...

  const SearchBar({Key? key, required this.hintText, this.icon})
      : super(key: key);

  @override
  ConsumerState<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<SearchBar> {
  final _inputController = TextEditingController();
  Timer? _debounce;

  void _setKeyword() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 800), () {
      ref
          .read(reviewSearchKeywordProvider.notifier)
          .setKeyword(_inputController.text);
    });
  }

  @override
  void initState() {
    super.initState();
    _inputController.addListener(_setKeyword);
  }

  @override
  void dispose() {
    _inputController.removeListener(_setKeyword);
    _inputController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  // TODO keyboard type && optional elevation
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: _inputController,
        style: TextStyles.medium16,
        decoration: InputDecoration(
          prefixIcon: (widget.icon != null)
              ? const Icon(
                  Icons.search,
                  color: AppColors.pink40,
                )
              : null,
          contentPadding: const EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide:
                  const BorderSide(color: AppColors.pink40, width: 2.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide:
                  const BorderSide(color: AppColors.pink40, width: 2.0)),
          hintText: widget.hintText,
          hintStyle:
              TextStyles.medium14.merge(const TextStyle(color: Colors.black12)),
        ),
      ),
    );
  }
}
