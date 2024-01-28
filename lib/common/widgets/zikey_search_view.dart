import 'package:flutter/material.dart';

class ZikeySearchAppBarView extends StatefulWidget {
  const ZikeySearchAppBarView(
      {Key? key,
      required this.title,
      required this.onTextChanged,
      required this.onClosed,
      required this.onSubmit,
      this.searchOnStart = false})
      : super(key: key);
  final String title;
  final Function(String) onTextChanged;
  final Function(String) onSubmit;
  final Function onClosed;
  final bool searchOnStart;

  @override
  State<ZikeySearchAppBarView> createState() => _ZikeySearchAppBarViewState();
}

class _ZikeySearchAppBarViewState extends State<ZikeySearchAppBarView> {
  bool isSearching = false;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isSearching = widget.searchOnStart;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Visibility(
                  visible: !isSearching,
                  child: Text(widget.title),
                ),
                Visibility(
                    visible: !isSearching,
                    child: Expanded(
                      child: Container(),
                    )),
                Visibility(
                  visible: !isSearching,
                  child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        isSearching = true;
                      });
                    },
                  ),
                ),
                Visibility(
                  visible: isSearching,
                  child: Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: widget.onTextChanged,
                      onSubmitted: widget.onSubmit,
                      textInputAction: TextInputAction.search,
                      decoration: const InputDecoration(
                        hintText: 'جستجو',
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isSearching,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        isSearching = false;
                        _searchController.clear();
                        widget.onClosed();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
