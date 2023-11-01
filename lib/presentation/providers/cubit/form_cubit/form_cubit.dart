import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'form_cubit_state.dart';

class FormCubit extends Cubit<FormCubitState> {
  FormCubit() : super(const FormCubitState());

  void onSubmit() {
    print('submit $state');
  }

  void fullNameChanged(String value) {
    emit(state.copyWith(fullName: value));
  }

  void fullNameRecipientChanged(String value) {
    emit(state.copyWith(fullNameRecipient: value));
  }

  void emailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  void emailRecipientChanged(String value) {
    emit(state.copyWith(emailRecipient: value));
  }

  void phoneNumberChanged(String value) {
    emit(state.copyWith(phoneNumber: value));
  }

  void phoneNumberRecipientChanged(String value) {
    emit(state.copyWith(phoneNumberRecipient: value));
  }

  void cityChanged(String value) {
    emit(state.copyWith(city: value));
  }

  void cityRecipientChanged(String value) {
    emit(state.copyWith(cityRecipient: value));
  }

  void countryChanged(String value) {
    emit(state.copyWith(country: value));
  }

  void countryRecipientChanged(String value) {
    emit(state.copyWith(countryRecipient: value));
  }

  void address1Changed(String value) {
    emit(state.copyWith(addressLine1: value));
  }

  void address1RecipientChanged(String value) {
    emit(state.copyWith(addressLine1Recipient: value));
  }

  void address2Changed(String value) {
    emit(state.copyWith(addressLine2: value));
  }

  void address2RecipientChanged(String value) {
    emit(state.copyWith(addressLine2Recipient: value));
  }

  void postCodeRecipientChanged(String value) {
    emit(state.copyWith(postCodeRecipient: value));
  }

  void postCodeChanged(String value) {
    emit(state.copyWith(postCode: value));
  }
}
