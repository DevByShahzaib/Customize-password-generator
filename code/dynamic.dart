import 'dart:io';
import 'dart:math';

void main() {
  // Q1
  // Solution
  stdout.write('Enter your range for fizz buzz : ');
  int userInput = int.parse(stdin.readLineSync()!);
  for (var i = 1; i <= userInput; i++) {
    if (i % 3 == 0) {
      print('$i Fizz');
    } else if (i % 5 == 0) {
      print("$i Buzz");
    }
    if ((i % 3 == 0) && (i % 5 == 0)) {
      print("$i FizzBuzz");
    }
  }

  // Q2 with Q3
  // Solution
  stdout.write("Enter your Password Length :");
  int pLength = int.parse(stdin.readLineSync()!);
  stdout.write("How many numbers do you want in password..? :");
  int nLength = int.parse(stdin.readLineSync()!);
  stdout.write("How many Special Charactors do you want in password..? :");
  int sLength = int.parse(stdin.readLineSync()!);
  if (pLength >= (sLength + nLength)) {
    generatePassword(
        passwordLength: pLength, numberLength: nLength, speciallength: sLength);
  } else {
    print(
        "Password Length must be greater than The sum of numbers and special charactors");
  }
}

void generatePassword(
    {required int passwordLength,
    required int numberLength,
    required int speciallength}) {
  String pass = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

  String password = '';

  String specialCharactor = '/,#@\$!&*()_%^~?|';
  String specialnumbers = '124567890';
  String passSpecial = '';
  String passnumber = '';
  int tempnumber = 0;

  for (var i = 0; i < passwordLength - (numberLength + speciallength); i++) {
    password += pass[Random().nextInt(pass.length)];
  }

  //for digits
  for (var i = 0; i < numberLength; i++) {
    tempnumber = (Random().nextInt(9));
    passnumber += '$tempnumber';
  }

  // for special
  for (var i = 0; i < speciallength; i++) {
    passSpecial += specialCharactor[(Random().nextInt(10))];
  }

  password += passnumber;
  password += passSpecial;

  password = password.shuffled;
  print("Here is your password :  $password");
  int specialCount = 0;
  int numberCount = 0;
  for (var i = 0; i < password.length; i++) {
    for (var j = 0; j < specialCharactor.length; j++) {
      if (specialCharactor[j] == password[i]) {
        specialCount++;
      }
    }
    for (var k = 0; k < specialnumbers.length; k++) {
      if (password[i] == specialnumbers[k]) {
        numberCount++;
      }
    }
  }
  num percentageSpecailCharactor = (specialCount / password.length) * 100;
  num percentageNumbers = (numberCount / password.length) * 100;
  num totalAccuracy = percentageNumbers + percentageSpecailCharactor;
  print(totalAccuracy);
  if (totalAccuracy >= 50) {
    print("Strong Password");
  } else if (totalAccuracy >= 40) {
    print("Good password");
  } else if (totalAccuracy >= 30) {
    print("Fair password");
  } else if (totalAccuracy >= 15) {
    print("Weak password");
  } else {
    print("very weak password");
  }
}

extension Shuffle on String {
  /// Strings are [immutable], so this getter returns a shuffled string
  /// rather than modifying the original.
  String get shuffled => (split('')..shuffle()).join('');
}
