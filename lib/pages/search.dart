import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class Search extends StatefulWidget {
  const Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  static const historyLength = 5;

  List<String> _searchHistory = [
    'fuchsia',
    'flutter',
    'widgets',
    'resocoder',
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
      body: FloatingSearchBar(
        controller: controller,
        body: FloatingSearchBarScrollNotifier(
          child: SearchResultsListView(
            searchTerm: selectedTerm, key: null,
          ),
        ),
        transition: CircularFloatingSearchBarTransition(),
        physics: BouncingScrollPhysics(),
        title: Text(
          selectedTerm ?? 'The Search App',
          style: Theme.of(context).textTheme.headline6,
        ),
        hint: 'Search and find out...',
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
              color: Colors.white,
              elevation: 4,
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
          padding: EdgeInsets.fromLTRB(20.0, 70.0, 30.0, 0.0),
          child: ListView(
            children: [
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  "Browse SDU Academy",
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2.0, // 2 pixels between each letter
                  ),
                ),
              Divider( // This is line between elements here
                height: 40.0,
                color: Colors.grey[800],
              ),
              Text(
                'Math',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0, // 2 pixels between each letter
                ),
              ),
              Divider( // This is line between elements here
                height: 40.0,
                color: Colors.grey[800],
              ), // It will appear as a space
              Text(
                  'Science',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0, // 2 pixels between each letter
                ),
              ),
              Divider( // This is line between elements here
                height: 40.0,
                color: Colors.grey[800],
              ),
              Text(
                'Economics',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0, // 2 pixels between each letter
                ),
              ),
              Divider( // This is line between elements here
                height: 40.0,
                color: Colors.grey[800],
              ),
              Text(
                  'Arts and humanities',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0, // 2 pixels between each letter
                ),
              ),
              Divider( // This is line between elements here
                height: 40.0,
                color: Colors.grey[800],
              ),
              Text(
                'Computing',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0, // 2 pixels between each letter
                ),
              ),
              Divider( // This is line between elements here
                height: 40.0,
                color: Colors.grey[800],
              ),
              Text(
                'Test prep',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0, // 2 pixels between each letter
                ),
              ),
              Divider( // This is line between elements here
                height: 40.0,
                color: Colors.grey[800],
              ),
              Text(
                'Life skills',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0, // 2 pixels between each letter
                ),
              ),
              Divider( // This is line between elements here
                height: 40.0,
                color: Colors.grey[800],
              ),
        ]
          ),
    ],
          ),
      )
    );
    }

    final fsb = FloatingSearchBar.of(context);

    return ListView(
      padding: EdgeInsets.only(top: fsb.height + fsb.margins.vertical),
      children: List.generate(
        50,
            (index) => ListTile(
          title: Text('$searchTerm search result'),
          subtitle: Text(index.toString()),
        ),
      ),
    );
  }
}