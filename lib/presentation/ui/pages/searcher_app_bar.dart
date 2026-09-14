import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pragma_test/presentation/ui/utils/functions_helper.dart';

class SearcherAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final Function(String) onSearch;
  final String title;
  final bool waitSearch;

  const SearcherAppBarWidget({
    super.key,
    required this.title,
    required this.onSearch,
    this.waitSearch = false,
  });

  @override
  SearcherAppBarWidgetState createState() => SearcherAppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class SearcherAppBarWidgetState extends State<SearcherAppBarWidget> {
  bool searching = false;
  final TextEditingController _textController = TextEditingController();
  Timer? _debounce;

  void _onKeyDownSearch(String? val) {
    if (widget.waitSearch) {
      if (val == null) {
        return;
      }
      FunctionsHelper.resetSearch(
        searchFunction: () => widget.onSearch.call(val),
        delay: Duration(milliseconds: 500),
        timer: _debounce
      );
    } else {
      widget.onSearch.call(val ?? "");
    }
  }

  void toogleSearch(bool value) {
    setState(() {
      searching = value;
    });
  }

  @override
  SliverAppBar build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      title: searching
          ? Row(
              children: [
                Expanded(
                  child: CupertinoSearchTextField(
                    padding: const EdgeInsets.all(12),
                    controller: _textController,
                    onChanged: _onKeyDownSearch,
                    onSubmitted: widget.onSearch,
                    style: TextStyle(
                      color: Theme.of(context).appBarTheme.iconTheme?.color,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => toogleSearch(false),
                  icon: const Icon(Icons.close),
                ),
              ],
            )
          : Row(
              children: [
                const SizedBox(width: 16),
                Expanded(
                  child: Text(widget.title, textAlign: TextAlign.center),
                ),
                IconButton(
                  onPressed: () => toogleSearch(true),
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
    );
  }
}
