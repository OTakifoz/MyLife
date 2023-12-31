import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/references/pallette.dart';
import 'package:my_life/providers/start_screen_provider.dart';
import '../../../models/life.dart';

class NameDialog extends ConsumerStatefulWidget {
  const NameDialog({super.key});

  @override
  ConsumerState<NameDialog> createState() => _NameDialogState();
}

class _NameDialogState extends ConsumerState<NameDialog> {
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final startScreen = ref.watch(startScreenProvider);
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(
            width: 2,
            color: Colors.white,
          )),
      backgroundColor: startScreen.life.gender == Gender.male
          ? Colors.blue[700]!
          : Colors.pink[700]!,
      title: Text('Type in a name', style: whiteBoldFontedStyle(20, context)),
      content: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: nameController,
              cursorColor: Colors.white,
              style: whiteFontedStyle(16, context),
              autofocus: true,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.abc,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 2,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 2,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 2,
                      )),
                  labelText: 'Name',
                  labelStyle: whiteFontedStyle(16, context)),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please provide a name';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: lastNameController,
              cursorColor: Colors.white,
              autofocus: true,
              style: whiteFontedStyle(16, context),
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.abc,
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2,
                    )),
                labelText: 'Last Name',
                labelStyle: whiteFontedStyle(16, context),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please provide a last name';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        Row(
          children: [
            TextButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    lastNameController.text.isNotEmpty) {
                  startScreen.updateName(nameController.text);

                  startScreen.updateLastName(lastNameController.text);

                  Navigator.pop(context);
                }
              },
              child: Text(
                'Done',
                style: whiteFontedStyle(20, context),
              ),
            ),
            TextButton(
              onPressed: () {
                startScreen.updateName(null);
                startScreen.updateLastName(null);

                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: whiteFontedStyle(20, context),
              ),
            ),
          ],
        )
      ],
    );
  }
}
