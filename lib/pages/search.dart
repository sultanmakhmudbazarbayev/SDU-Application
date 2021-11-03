import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'home_widgets/navigation_drawer_widget.dart';

class Search extends StatefulWidget {
  const Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  static const historyLength = 5;

  List<String> _searchHistory = [
    'math',
    'physics',
    'astronomy',
    'geometry',
  ];

  List<String> filteredSearchHistory;

  String selectedTerm;

  List<String> filterSearchTerms({
    String filter,
  }) {
    if (filter != null && filter.isNotEmpty) {
      return _searchHistory.reversed
          .where((term) => term.startsWith(filter))
          .toList();
    } else {
      return _searchHistory.reversed.toList();
    }
  }

  void addSearchTerm(String term) {
    if (_searchHistory.contains(term)) {
      putSearchTermFirst(term);
      return;
    }

    _searchHistory.add(term);
    if (_searchHistory.length > historyLength) {
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }

    filteredSearchHistory = filterSearchTerms(filter: '');
  }

  void deleteSearchTerm(String term) {
    _searchHistory.removeWhere((t) => t == term);
    filteredSearchHistory = filterSearchTerms(filter: '');
  }

  void putSearchTermFirst(String term) {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }

  FloatingSearchBarController controller;

  @override
  void initState() {
    super.initState();
    controller = FloatingSearchBarController();
    filteredSearchHistory = filterSearchTerms(filter: '');
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        foregroundColor: const Color(0xFF131315),
        titleTextStyle: TextStyle(
          color: const Color(0xFF131315),
          fontSize: 18,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: const Color(0xFFF3F5F7), // Status bar
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: const Color(0xFFF3F5F7),
        elevation: 0,
        title: Text(
          "Search",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFF3F5F7),
      body: FloatingSearchBar(
        margins: const EdgeInsets.only(left: 13, right: 13, top: 13),
        padding: const EdgeInsets.fromLTRB(8, 3, 1, 1),
        elevation: 3,
        controller: controller,
        body: FloatingSearchBarScrollNotifier(
          child: SearchResultsListView(
            searchTerm: selectedTerm,
            key: null,
          ),
        ),
        transition: CircularFloatingSearchBarTransition(),
        physics: BouncingScrollPhysics(),
        title: Text(
          selectedTerm ?? 'Search...',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.grey,
            fontSize: 17,
          ),
        ),
        borderRadius: BorderRadius.circular(10),
        hint: 'Search and find out...',
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.grey,
          fontSize: 17,
        ),
        actions: [
          FloatingSearchBarAction.searchToClear(),
        ],
        onQueryChanged: (query) {
          setState(() {
            filteredSearchHistory = filterSearchTerms(filter: query);
          });
        },
        onSubmitted: (query) {
          setState(() {
            addSearchTerm(query);
            selectedTerm = query;
          });
          controller.close();
        },
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              animationDuration: Duration(milliseconds: 900),
              color: Colors.white,
              elevation: 2,
              child: Builder(
                builder: (context) {
                  if (filteredSearchHistory.isEmpty &&
                      controller.query.isEmpty) {
                    return Container(
                      height: 56,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'Start searching',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    );
                  } else if (filteredSearchHistory.isEmpty) {
                    return ListTile(
                      title: Text(controller.query),
                      leading: const Icon(Icons.search),
                      onTap: () {
                        setState(() {
                          addSearchTerm(controller.query);
                          selectedTerm = controller.query;
                        });
                        controller.close();
                      },
                    );
                  } else {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: filteredSearchHistory
                          .map(
                            (term) => ListTile(
                              title: Text(
                                term,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              leading: const Icon(Icons.history),
                              trailing: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  setState(() {
                                    deleteSearchTerm(term);
                                  });
                                },
                              ),
                              onTap: () {
                                setState(() {
                                  putSearchTermFirst(term);
                                  selectedTerm = term;
                                });
                                controller.close();
                              },
                            ),
                          )
                          .toList(),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class SearchResultsListView extends StatelessWidget {
  final String searchTerm;

  const SearchResultsListView({
    Key key,
    this.searchTerm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (searchTerm == null) {
      return Center(
          child: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 80.0, 30.0, 0.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Browse courses",
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ));
    }

    final fsb = FloatingSearchBar.of(context);

    return ListView(
      padding: EdgeInsets.only(top: fsb.height + fsb.margins.vertical),
      children: List.generate(
        10,
        (index) => ListTile(
          title: Text('$searchTerm search result'),
          subtitle: Text(index.toString()),
        ),
      ),
    );
  }
}
