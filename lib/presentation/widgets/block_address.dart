import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:reto/confiig/theme/app_theme.dart';
import 'package:reto/presentation/providers/cubit/form_cubit/form_cubit.dart';
import 'package:reto/presentation/providers/provider_principal.dart';
import 'package:reto/presentation/widgets/item_textformfield.dart';

class BlockAddress extends StatefulWidget {
  const BlockAddress({
    super.key,
    required this.isSender,
  });
  final bool isSender;
  @override
  State<BlockAddress> createState() => _BlockAddressState();
}

class _BlockAddressState extends State<BlockAddress> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<FormCubit>();

    final provider = Provider.of<ProviderPrincipal>(context);

    return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Form(
          key: _formKey,
          child: widget.isSender
              ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  ItemTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field';
                      }
                      if (value.trim().isEmpty) return 'Required field';
                      if (value.length < 3) return "More than 3 letters";

                      return null;
                    },
                    label: registerCubit.state.fullName,
                    title: 'Full name*',
                    onChanged: (value) {
                      registerCubit.fullNameChanged(value);
                      _formKey.currentState!.validate();
                    },
                    icon: Icons.person_sharp,
                  ),
                  ItemTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field';
                      }
                      if (value.trim().isEmpty) return 'Required field';

                      final emailRegExp = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      );
                      if (!emailRegExp.hasMatch(value)) {
                        return 'Does not have email format';
                      }
                      return null;
                    },
                    typeKeyboard: TextInputType.emailAddress,
                    label: registerCubit.state.email,
                    title: 'Email*',
                    onChanged: (value) {
                      registerCubit.emailChanged(value);
                      _formKey.currentState!.validate();
                    },
                    icon: Icons.email,
                  ),
                  ItemTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required field';
                        }
                        if (value.trim().isEmpty) return 'Required field';

                        return null;
                      },
                      typeKeyboard: TextInputType.phone,
                      label: registerCubit.state.phoneNumber,
                      title: 'Phone number*',
                      onChanged: (value) {
                        registerCubit.phoneNumberChanged(value);
                        _formKey.currentState!.validate();
                      },
                      icon: Icons.phone),
                  ItemTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required field';
                        }
                        if (value.trim().isEmpty) return 'Required field';

                        return null;
                      },
                      label: registerCubit.state.country,
                      title: 'Country*',
                      onChanged: (value) {
                        registerCubit.countryChanged(value);
                        _formKey.currentState!.validate();
                      },
                      icon: Icons.location_on_sharp),
                  ItemTextFormField(
                      label: registerCubit.state.city,
                      title: 'City*',
                      onChanged: (value) {
                        registerCubit.cityChanged(value);
                        _formKey.currentState!.validate();
                      },
                      prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset('assets/svg/city.svg'))),
                  ItemTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required field';
                        }
                        if (value.trim().isEmpty) return 'Required field';

                        return null;
                      },
                      label: registerCubit.state.addressLine1,
                      onChanged: (value) {
                        registerCubit.address1Changed(value);
                        _formKey.currentState!.validate();
                      },
                      title: 'Address line 1*',
                      icon: CupertinoIcons.map_pin),
                  if (provider.isAddLineAddressPushed == true)
                    ItemTextFormField(
                        label: registerCubit.state.addressLine2,
                        title: 'Address line 2*',
                        onChanged: (value) {
                          registerCubit.address2Changed(value);
                          _formKey.currentState!.validate();
                        },
                        icon: CupertinoIcons.map_pin),
                  GestureDetector(
                    onTap: () {
                      provider.addLineAddress();
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                          (provider.isAddLineAddressPushed == !true)
                              ? 'Add address line +'
                              : 'Hide adicional address line -',
                          style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              color: AppTheme.orange,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                  ItemTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required field';
                        }
                        if (value.trim().isEmpty) return 'Required field';

                        return null;
                      },
                      label: registerCubit.state.postCode,
                      typeKeyboard: TextInputType.number,
                      title: 'Postcode*',
                      onChanged: (value) {
                        registerCubit.postCodeChanged(value);
                        _formKey.currentState!.validate();
                      },
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset('assets/svg/post.svg'),
                      )),
                  const SizedBox(height: 10)
                ])
              : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  ItemTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field';
                      }
                      if (value.trim().isEmpty) return 'Required field';
                      if (value.length < 3) return "More than 3 letters";

                      return null;
                    },
                    label: registerCubit.state.fullNameRecipient,
                    title: 'Full name*',
                    onChanged: (value) {
                      registerCubit.fullNameRecipientChanged(value);
                      _formKey.currentState!.validate();
                    },
                    icon: Icons.person_sharp,
                  ),

                  ItemTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field';
                      }
                      if (value.trim().isEmpty) return 'Required field';

                      final emailRegExp = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      );
                      if (!emailRegExp.hasMatch(value)) {
                        return 'Does not have email format';
                      }
                      return null;
                    },
                    typeKeyboard: TextInputType.emailAddress,
                    label: registerCubit.state.emailRecipient,
                    title: 'Email*',
                    onChanged: (value) {
                      registerCubit.emailRecipientChanged(value);
                      _formKey.currentState!.validate();
                    },
                    icon: Icons.email,
                  ),

                  ItemTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required field';
                        }
                        if (value.trim().isEmpty) return 'Required field';

                        return null;
                      },
                      typeKeyboard: TextInputType.phone,
                      label: registerCubit.state.phoneNumberRecipient,
                      title: 'Phone number*',
                      onChanged: (value) {
                        registerCubit.phoneNumberRecipientChanged(value);
                        _formKey.currentState!.validate();
                      },
                      icon: Icons.phone),

                  ItemTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required field';
                        }
                        if (value.trim().isEmpty) return 'Required field';

                        return null;
                      },
                      label: registerCubit.state.countryRecipient,
                      title: 'Country*',
                      onChanged: (value) {
                        registerCubit.countryRecipientChanged(value);
                        _formKey.currentState!.validate();
                      },
                      icon: Icons.location_on_sharp),

                  ItemTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required field';
                        }
                        if (value.trim().isEmpty) return 'Required field';

                        return null;
                      },
                      label: registerCubit.state.cityRecipient,
                      title: 'City*',
                      onChanged: (value) {
                        registerCubit.cityRecipientChanged(value);
                        _formKey.currentState!.validate();
                      },
                      prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset('assets/svg/city.svg'))),

                  ItemTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required field';
                        }
                        if (value.trim().isEmpty) return 'Required field';

                        return null;
                      },
                      label: registerCubit.state.addressLine1Recipient,
                      onChanged: (value) {
                        registerCubit.address1RecipientChanged(value);
                        _formKey.currentState!.validate();
                      },
                      title: 'Address line 1*',
                      icon: CupertinoIcons.map_pin),
                  //-------------------------------
                  if (provider.isAddLineAddressPushed == true)
                    ItemTextFormField(
                        label: registerCubit.state.addressLine2Recipient,
                        title: 'Address line 2*',
                        onChanged: (value) {
                          registerCubit.address2RecipientChanged(value);
                          _formKey.currentState!.validate();
                        },
                        icon: CupertinoIcons.map_pin),

                  GestureDetector(
                    onTap: () {
                      provider.addLineAddress();
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                          (provider.isAddLineAddressPushed == !true)
                              ? 'Add address line +'
                              : 'Hide adicional address line -',
                          style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              color: AppTheme.orange,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),

                  ItemTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required field';
                        }
                        if (value.trim().isEmpty) return 'Required field';

                        return null;
                      },
                      label: registerCubit.state.postCodeRecipient,
                      typeKeyboard: TextInputType.number,
                      title: 'Postcode*',
                      onChanged: (value) {
                        registerCubit.postCodeRecipientChanged(value);
                        _formKey.currentState!.validate();
                      },
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset('assets/svg/post.svg'),
                      )),
                  const SizedBox(height: 10)
                ]),
        ));
  }
}
