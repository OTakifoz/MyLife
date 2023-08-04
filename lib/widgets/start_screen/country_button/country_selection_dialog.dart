// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/models/pallette.dart';
import '../../../lists/countries_list.dart';
import '../../../providers/start_screen_provider.dart';

class CountrySelectionDialog extends ConsumerStatefulWidget {
  const CountrySelectionDialog({super.key});

  @override
  ConsumerState<CountrySelectionDialog> createState() =>
      _CountrySelectionDialogState();
}

class _CountrySelectionDialogState
    extends ConsumerState<CountrySelectionDialog> {
  @override
  Widget build(BuildContext context) {
    final startScreen = ref.read(startScreenProvider);
    return AlertDialog(
      backgroundColor: Colors.green[300],
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: Accordion(
          headerBackgroundColor: Colors.green[900],
          contentBackgroundColor: Colors.green[300],
          contentBorderColor: Colors.green[900],
          contentBorderWidth: 5,
          children: [
            AccordionSection(
                headerBorderRadius: 20,
                contentBorderRadius: 20,
                header: Text(
                  'Select Country',
                  style: whiteFontedStyle(20),
                ),
                content: Column(
                  children: [
                    for (final country in countries)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: whiteFontedStyle(16),
                          backgroundColor: country.countryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: const BorderSide(
                                color: Colors.white,
                              )),
                        ),
                        child: SizedBox(
                            width: double.maxFinite,
                            child: Center(child: Text(country.name))),
                        onPressed: () {
                          startScreen.updateCurrentCountry(country);
                          startScreen.updateHealth(country.baseHealth);
                          startScreen.updateHappiness(country.baseHappiness);
                          Navigator.pop(context);
                        },
                      ),
                  ],
                ))
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              startScreen.updateCurrentCountry(null);
              Navigator.pop(context);
            },
            child: Text(
              'Cancel',
              style: whiteFontedStyle(20),
            ))
      ],
    );
  }
}
