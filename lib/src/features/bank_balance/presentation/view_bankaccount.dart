import 'package:bayfin/src/data/auth_repository.dart';
import 'package:bayfin/src/data/database_repository.dart';
import 'package:bayfin/src/features/authentication/presentation/account_edit.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/add_bankaccount.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/bayfin_buttons.dart';
import 'package:bayfin/src/features/authentication/presentation/widget/logo_widget.dart';
import 'package:bayfin/src/features/bank_balance/domain/kontoinformationen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewBankaccount extends StatefulWidget {
  const ViewBankaccount({super.key});

  @override
  State<ViewBankaccount> createState() => _ViewBankaccountState();
}

class _ViewBankaccountState extends State<ViewBankaccount> {
  late Stream<List<KontoInformation>> konten;

  @override
  void initState() {
    super.initState();

    konten = context
        .read<DatabaseRepository>()
        .getKontoInformation(context.read<AuthRepository>().getUserId());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        leading: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          IconButton(
            onPressed: () async {
              await showDialog<void>(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  content: Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      Positioned(
                        right: -40,
                        top: -40,
                        child: InkResponse(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.primaryContainer,
                            child: const Icon(Icons.close),
                          ),
                        ),
                      ),
                      const AddBankaccount(),
                    ],
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.add_card,
              size: 24,
            ),
          ),
          IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AccountEditScreen(),
                    ),
                  )),
        ]),
        leadingWidth: 200,
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthRepository>().logout();
            },
            icon: const Icon(
              Icons.logout,
              size: 24,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 10),
              LogoWidget(width: 217, height: 76),
              const SizedBox(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 200,
                    height: 30,
                    child: Text(
                      'Übersicht ',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: Text(
                      'Konten',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              StreamBuilder<List<KontoInformation>>(
                stream: konten,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Icon(Icons.error);
                  } else if (snapshot.hasData) {
                    return BayFinButtonList(
                      kontoInfos: snapshot.data!,
                    );
                  } else {
                    return const Text('Keine Kontoinformationen gefunden.');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
