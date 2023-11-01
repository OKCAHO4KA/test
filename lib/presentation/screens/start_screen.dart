import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reto/confiig/theme/app_theme.dart';
import 'package:reto/presentation/providers/cubit/form_cubit/form_cubit.dart';
import 'package:reto/presentation/providers/provider_principal.dart';
import 'package:reto/presentation/widgets/button_color.dart';
import 'package:reto/presentation/widgets/buttons_part.dart';
import 'package:reto/presentation/widgets/custom_input.dart';
import 'package:reto/presentation/widgets/block_address.dart';
import 'package:reto/presentation/widgets/selected_address.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Ordering',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: const StartsScreenView(),
    );
  }
}

class StartsScreenView extends StatefulWidget {
  const StartsScreenView({super.key});

  @override
  State<StartsScreenView> createState() => _StartsScreenViewState();
}

class _StartsScreenViewState extends State<StartsScreenView> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat.MMMd();
    DateFormat dateFormatYear = DateFormat.y();

    String startDate =
        '${dateFormat.format(selectedDate)}, ${dateFormatYear.format(selectedDate)}';

    final provider = Provider.of<ProviderPrincipal>(context);

    return SingleChildScrollView(
        child: Column(children: [
      const Divider(
        color: AppTheme.gray,
        thickness: 0.5,
      ),
      const SizedBox(height: 5),
      Text('Step 1', style: Theme.of(context).textTheme.bodySmall),
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: Colors.white,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 5),
              child: Text('Start date',
                  style: Theme.of(context).textTheme.titleSmall),
            ),
            CustomTextFormField(
              label: startDate,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: SvgPicture.asset('assets/svg/calendario.svg')),
              ),
              colorIcon: AppTheme.grayDark,
            ),
            const SizedBox(height: 15)
          ])),
      const SizedBox(height: 15),
      ButtonsPart(
          isPressed: provider.isAddSender,
          title: 'Sender details',
          onPressed: () => provider.setIsAddSender(true),
          onPressed2: () => provider.setIsAddSender(false)),
      !provider.isAddSender
          ? const SelectedAddress(
              isSender: true,
            )
          : const Column(children: [
              BlockAddress(
                isSender: true,
              ),
              SizedBox(height: 15)
            ]),
      ButtonsPart(
        isPressed: provider.isAddRecipient,
        title: 'Recipient address',
        onPressed: () {
          provider.setIsAddRecipien(true);
        },
        onPressed2: () => provider.setIsAddRecipien(false),
      ),
      !provider.isAddRecipient
          ? const SelectedAddress(
              isSender: false,
            )
          : const Column(children: [
              BlockAddress(
                isSender: false,
              ),
              SizedBox(height: 15)
            ]),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ButtonColor(
            fontSize: 16,
            text: 'Next step',
            onPressed: () async {
              context.read<FormCubit>().onSubmit();
              provider.setIsAddSender(true);
              provider.setIsAddRecipien(true);
            },
            colorButton: AppTheme.orange,
            heigthButton: 52,
            minWidthButton: double.infinity,
            radius: 50,
          )),
      const SizedBox(height: 35),
    ]));
  }
}
