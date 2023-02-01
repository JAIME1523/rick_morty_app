import 'package:catalogo_juegos/provider/provider.dart';
import 'package:catalogo_juegos/ui/widgets/widgets.dart';
import 'package:catalogo_juegos/utils/delegates/search_result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';

class SearchCharacterDelegate extends SearchDelegate<SearchResut> {
  String status = '';
  String gender = '';
  SearchCharacterDelegate() : super(searchFieldLabel: 'Buscar...');
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      
      IconButton(
          onPressed: () {
            //el cuery ya biene el searh delegate
            query = '';
          },
          icon: const Icon(Icons.clear)),
      IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) => const AlertDialog(
                      contentPadding: EdgeInsets.all(0),
                      content: FilterDialog(),
                    ));
          },
          icon: const Icon(Icons.filter_alt_outlined)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          //close biene en SearchDelegate
          final result = SearchResut(cancel: true);
          close(context, result);
        },
        icon: const Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    final providerSearch =
        Provider.of<SearchQuestionProvider>(context, listen: false);
    providerSearch.name = query;
    if (query != "" ||
        providerSearch.gender != "" ||
        providerSearch.status != "") {
      providerSearch.search();
    } else {
      print('no entra');
    }

    // final providerSearch =
    //     Provider.of<FrequentQuestionsProvider>(context, listen: false);

    // provider.searchQuestion(query);
    // print(query);
    return Builder(
      builder: (context) {
        final providerSearch = Provider.of<SearchQuestionProvider>(context);
        // final providerSearch = Provider.of<SearchQuestionProvider>(context);

        return providerSearch.listSearch.isEmpty
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (providerSearch.status != '' ||
                        providerSearch.gender != '')
                      Row(children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Filters:'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(providerSearch.status),
                        providerSearch.status != '' ? const Text(',') : Container(),
                        Text(providerSearch.gender),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              providerSearch.gender = '';
                              providerSearch.status = '';
                            },
                            icon: const Icon(FontAwesomeIcons.xmark))
                      ]),
                  const   Text('No se encontró nada relacionado '),
                    const FaIcon(FontAwesomeIcons.fileCircleQuestion),
                  ],
                ),
              )
            // : Text(providerSearch.listSearch.length[0].question);
            : Padding(
                padding: const EdgeInsets.only(top: 20, left: 0, right: 0),
                child: ListView(
                  children: [
                    if (providerSearch.status != '' ||
                        providerSearch.gender != '')
                      Row(children: [
                        const SizedBox(
                          width: 10,
                        ),
                     const   Text('Filters:'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(providerSearch.status),
                        providerSearch.status != '' ? const Text(',') : Container(),
                        Text(providerSearch.gender),
                     const   Spacer(),
                        IconButton(
                            onPressed: () {
                              providerSearch.gender = '';
                              providerSearch.status = '';
                            },
                            icon: const Icon(FontAwesomeIcons.xmark))
                      ]),
                    ...providerSearch.listSearch
                        .map((chracter) => CustomCard(character: chracter)),
                    providerSearch.characterResponse!.info.next != null
                        ? Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 60),
                            child: CustomBotton(
                                onPressed: () {
                                  providerSearch.nextPage();
                                },
                                text: 'Load more',
                                icon: Icons.add),
                          )
                        : Container()
                  ],
                ),
              );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //refrencia al state searBloc
    // final historia = BlocProvider.of<SearchBloc>(context).state.history;

    return ListView(
      children: const [
        ListTile(
            // leading: const Icon(
            //   Icons.location_on_outlined,
            //   color: Colors.black,
            // ),
            // title: const Text('Colocar la ubicacion manual mente',
            //     style: TextStyle(color: Colors.black)),
            // onTap: () {
            //   final result = SearchResut(cancel: false, manual: true);

            //   close(context, result);
            // },
            ),
      ],
    );
  }
}
