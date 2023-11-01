import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:reto/confiig/theme/app_theme.dart';
import 'package:reto/presentation/providers/cubit/form_cubit/form_cubit.dart';
import 'package:reto/presentation/providers/provider_principal.dart';
import 'package:reto/presentation/widgets/custom_input.dart';

class SelectedAddress extends StatelessWidget {
  const SelectedAddress({
    required this.isSender,
    super.key,
  });
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderPrincipal>(context);
    final formCubits = context.read<FormCubit>().state;
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 10),
          child: CustomTextFormField(
            hint: 'Search',
            prefixIcon: Icon(
              Icons.search,
              size: 25,
              color: AppTheme.grayDark,
            ),
          ),
        ),
        isSender
            ? (formCubits.fullName != '')
                ? Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: AppTheme.black,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      title: Text(formCubits.fullName,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.white)),
                      subtitle: Text(
                          '${formCubits.country} , ${formCubits.city}, ${formCubits.addressLine1}, ${formCubits.postCode}',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400)),
                      trailing: GestureDetector(
                        onTap: () {
                          provider.setIsAddSender(true);
                        },
                        child: SvgPicture.asset(
                          'assets/svg/edit.svg',
                        ),
                      ),
                    ))
                : Container()
            : (formCubits.fullNameRecipient != '')
                ? Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: AppTheme.black,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      title: Text(formCubits.fullNameRecipient,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.white)),
                      subtitle: Text(
                          '${formCubits.countryRecipient} , ${formCubits.cityRecipient}, ${formCubits.addressLine1Recipient}, ${formCubits.postCodeRecipient}',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400)),
                      trailing: GestureDetector(
                        onTap: () {
                          provider.setIsAddRecipien(true);
                        },
                        child: SvgPicture.asset(
                          'assets/svg/edit.svg',
                        ),
                      ),
                    ))
                : Container()
      ],
    );
  }
}
