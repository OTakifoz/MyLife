import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/lists/countries_list.dart';
import 'package:my_life/widgets/start_screen/country_button/country_selection_button_child.dart';
import 'package:my_life/widgets/start_screen/country_button/country_selection_dialog.dart';
import '../../../providers/person_provider.dart';

class CountrySelectionButton extends ConsumerStatefulWidget {
  const CountrySelectionButton({super.key});

  @override
  ConsumerState<CountrySelectionButton> createState() =>
      _CountrySelectionWidgetState();
}

class _CountrySelectionWidgetState
    extends ConsumerState<CountrySelectionButton> {
  void showCountryPicker() {
    showDialog(
        context: context, builder: (context) => const CountrySelectionDialog());
  }

  @override
  Widget build(BuildContext context) {
    final person = ref.watch(personProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final randomCountry = Random();

    return SizedBox(
      height: 60,
      width: double.maxFinite,
      child: Flex(direction: Axis.vertical, children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              showCountryPicker();
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size.fromWidth(screenWidth - 32),
              backgroundColor: person.person.currentCountry != null
                  ? person.person.currentCountry!.countryColor
                  : Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 48,
                  height: 48,
                ),
                const CountrySelectionButtonChild(),
                IconButton(
                    iconSize: 32,
                    onPressed: () {
                      person.updateCurrentCountry(
                          countries[randomCountry.nextInt(countries.length)]);
                      person.updateHealth(
                          countries[randomCountry.nextInt(countries.length)]
                              .baseHealth);
                      person.updateHappiness(
                          countries[randomCountry.nextInt(countries.length)]
                              .baseHappiness);
                    },
                    icon: const Icon(Icons.autorenew))
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
