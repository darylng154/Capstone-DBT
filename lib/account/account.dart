import 'package:flutter/cupertino.dart';
import 'account_state.dart';

class Account extends StatefulWidget
{
  String? account_type;
  String? email;
  String? password;
  String? verify;
  String? phone;
  String? address;
  String? city;
  String? state;
  String? zipcode;
  String? country;

  Account({this.email, this.password});

  @override
  State<StatefulWidget> createState() => AccountState();

  String? getAccountType() {return this.account_type;}
  void setAccountType(String? account_type) => this.account_type = account_type;

  String? getEmail() {return this.email;}
  void setEmail(String? email) => this.email = email;

  String? getPassword() {return this.password;}
  void setPassword(String? password) => this.password = password;

  String? getVerify() {return this.verify;}
  void setVerify(String? verify) => this.verify = verify;

  String? getPhone() {return this.phone;}
  void setPhone(String? phone) => this.phone = phone;

  String? getAddress() {return this.address;}
  void setAddress(String? address) => this.address = address;

  String? getCity() {return this.city;}
  void setCity(String? city) => this.city = city;

  String? getState() {return this.state;}
  void setState(String? state) => this.state = state;

  String? getZipcode() {return this.zipcode;}
  void setZipcode(String? zipcode) => this.zipcode = zipcode;

  String? getCountry() {return this.country;}
  void setCountry(String? country) => this.country = country;
}