part of 'form_cubit.dart';

class FormCubitState extends Equatable {
  final String fullName;
  final String fullNameRecipient;

  final String email;
  final String emailRecipient;

  final String phoneNumber;
  final String phoneNumberRecipient;

  final String country;
  final String countryRecipient;

  final String city;
  final String cityRecipient;

  final String addressLine1;
  final String addressLine1Recipient;

  final String? addressLine2;
  final String? addressLine2Recipient;

  final String postCode;
  final String postCodeRecipient;

  const FormCubitState(
      {this.fullNameRecipient = '',
      this.emailRecipient = '',
      this.phoneNumberRecipient = '',
      this.countryRecipient = '',
      this.cityRecipient = '',
      this.addressLine1Recipient = '',
      this.addressLine2Recipient = '',
      this.postCodeRecipient = '',
      this.fullName = '',
      this.email = '',
      this.phoneNumber = '',
      this.country = '',
      this.city = '',
      this.addressLine1 = '',
      this.addressLine2 = '',
      this.postCode = ''});

  FormCubitState copyWith(
          {String? fullName,
          String? fullNameRecipient,
          String? email,
          String? emailRecipient,
          String? phoneNumber,
          String? phoneNumberRecipient,
          String? country,
          String? countryRecipient,
          String? city,
          String? cityRecipient,
          String? addressLine1,
          String? addressLine1Recipient,
          String? addressLine2,
          String? addressLine2Recipient,
          String? postCode,
          String? postCodeRecipient}) =>
      FormCubitState(
          fullName: fullName ?? this.fullName,
          fullNameRecipient: fullNameRecipient ?? this.fullNameRecipient,
          email: email ?? this.email,
          emailRecipient: emailRecipient ?? this.emailRecipient,
          phoneNumber: phoneNumber ?? this.phoneNumber,
          phoneNumberRecipient:
              phoneNumberRecipient ?? this.phoneNumberRecipient,
          country: country ?? this.country,
          countryRecipient: countryRecipient ?? this.countryRecipient,
          city: city ?? this.city,
          cityRecipient: cityRecipient ?? this.cityRecipient,
          addressLine1: addressLine1 ?? this.addressLine1,
          addressLine1Recipient:
              addressLine1Recipient ?? this.addressLine1Recipient,
          addressLine2: addressLine2 ?? this.addressLine2,
          addressLine2Recipient:
              addressLine2Recipient ?? this.addressLine2Recipient,
          postCode: postCode ?? this.postCode,
          postCodeRecipient: postCodeRecipient ?? this.postCodeRecipient);
  @override
  List<Object> get props => [
        fullName,
        fullNameRecipient,
        email,
        emailRecipient,
        addressLine1,
        addressLine1Recipient,
        phoneNumber,
        phoneNumberRecipient,
        country,
        countryRecipient,
        city,
        cityRecipient,
        postCode,
        postCodeRecipient,
        addressLine2!,
        addressLine2Recipient!
      ];
}
