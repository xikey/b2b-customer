
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../config/colors.dart';
import '../utils/url_checker.dart';
import 'dot_loading_widget.dart';

class ZikeyDataTableWidget extends StatefulWidget {
  const ZikeyDataTableWidget({
    Key? key,
    required this.columnHeaders,
    required this.tableHeight,
    required this.tableData,
    required this.onTap,
    required this.tableName,
    required this.onSearchSubmitted,
    this.onLongTab,
  }) : super(key: key);

  final List<ZikeyTableHeaderInfo> columnHeaders;
  final List<ZikeyTableRowsInfo> tableData;
  final double tableHeight;
  final String tableName;
  final Function(ZikeyTableRowsInfo rowInfo) onTap;
  final Function(ZikeyTableRowsInfo rowInfo)? onLongTab;
  final Function(String) onSearchSubmitted;

  @override
  _ZikeyDataTableWidgetState createState() => _ZikeyDataTableWidgetState();
}

class _ZikeyDataTableWidgetState extends State<ZikeyDataTableWidget> {
  static const int itemsPerPage = 50;
  int currentPage = 0;

  List<int> expandedColumnIndex = [];

  @override
  void initState() {
    super.initState();
    initializeExpandedColumnIndex();
  }

  void initializeExpandedColumnIndex() {
    if (widget.columnHeaders.isNotEmpty) {
      for (int i = 0; i < widget.columnHeaders.length; i++) {
        final item = widget.columnHeaders[i];
        if (item.isExpanded) {
          expandedColumnIndex.add(i);
        }
      }
    }
  }

  List<ZikeyTableRowsInfo> getVisibleRows() {
    final startIndex = currentPage * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;

    if (endIndex > widget.tableData.length) {
      return widget.tableData.sublist(startIndex);
    } else {
      return widget.tableData.sublist(startIndex, endIndex);
    }
  }

  int getTotalPages() {
    return (widget.tableData.length / itemsPerPage).ceil();
  }

  void goToNextPage() {
    setState(() {
      currentPage =
          currentPage < getTotalPages() - 1 ? currentPage + 1 : currentPage;
    });
  }

  void goToPreviousPage() {
    setState(() {
      currentPage = currentPage > 0 ? currentPage - 1 : currentPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final visibleRows = getVisibleRows();
    final totalPages = getTotalPages();

    return SizedBox(
      height: widget.tableHeight,
      child: Column(
        children: [
          // Search Bar
          Container(
            padding: const EdgeInsets.all(10),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.tableName,
                  style: TextStyle(
                      color: AppColors.tableHeaderColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  constraints:
                      const BoxConstraints(maxWidth: 250, minWidth: 50),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      onFieldSubmitted: widget.onSearchSubmitted,
                      keyboardType: TextInputType.number,
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search_rounded,
                          color: Colors.black54,
                        ),
                        hintTextDirection: TextDirection.rtl,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusColor: Colors.white,
                        labelText: 'جستجو',
                      ),
                      autofocus: false,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 60, // Header height
            color: AppColors.tableHeaderColor, // Header background color
            child: Row(
              children: List.generate(widget.columnHeaders.length, (index) {
                final headerInfo = widget.columnHeaders[index];
                return Expanded(
                  flex: headerInfo.isExpanded ? 2 : 1,
                  child: Container(
                    width: headerInfo.isExpanded
                        ? double.infinity
                        : headerInfo.width,
                    height: double.infinity,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(
                      headerInfo.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          //Table Data
          Expanded(
            child: visibleRows.isEmpty
                ? const Center(
                    child: Text(
                        "اطلاعاتی جهت نمایش وجود ندارد"), // Displayed when tableData is null or empty
                  )
                : ListView.builder(
                    itemCount: visibleRows.length,
                    itemBuilder: (context, eachRowIndex) {
                      final eachRowItem = visibleRows[eachRowIndex];
                      return InkWell(
                        onLongPress: () {
                          if (widget.onLongTab != null) {
                            widget.onLongTab!(eachRowItem);
                          }
                        },
                        onTap: () {
                          widget.onTap(eachRowItem);
                        },
                        child: Row(
                          children: List.generate(
                            eachRowItem.rowItems.length,
                            (index) {
                              final cellInfo = eachRowItem.rowItems[index];
                              return Expanded(
                                flex:
                                    expandedColumnIndex.contains(index) ? 2 : 1,
                                child: Container(
                                  height: 60,
                                  color: eachRowIndex.isOdd
                                      ? Colors.white
                                      : Colors.grey.shade300,
                                  alignment: Alignment.center,
                                  //If the string is an image url then show image against an string
                                  child: UrlChecker.isImageUrl(cellInfo)
                                      ? Container(
                                          constraints: const BoxConstraints(
                                              maxWidth: 80),
                                          padding: const EdgeInsets.all(5),
                                          child: CachedNetworkImage(
                                            imageUrl: cellInfo,
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            placeholder: (context, url) =>
                                                const DotLoadingWidget(size: 5),
                                            errorWidget: (context, url,
                                                    error) =>
                                                Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Image.asset(
                                                        'assets/images/img_yadegar_logo_gray_png.png')),
                                          ),
                                        )
                                      : Text(
                                          cellInfo,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Visibility(
            visible: widget.tableData.length > itemsPerPage,
            child: Container(
              height: 60, // Footer height
              color: AppColors.tableHeaderColor, // Footer background color
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: goToPreviousPage,
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Item ${currentPage * itemsPerPage + 1} - ${(currentPage + 1) * itemsPerPage} of ${widget.tableData.length}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: goToNextPage,
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ZikeyTableHeaderInfo {
  String name;
  double width;
  bool isExpanded;
  bool? isPicture;

  ZikeyTableHeaderInfo({
    required this.name,
    required this.width,
    required this.isExpanded,
    this.isPicture,
  });
}

class ZikeyTableRowsInfo {
  final int id;
  final List<String> rowItems;

  ZikeyTableRowsInfo({
    required this.id,
    required this.rowItems,
  });
}
