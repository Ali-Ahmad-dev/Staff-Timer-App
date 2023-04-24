import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class firestoreServices {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future addUser(String email, String userName) async {
    try {
      await _firestore.collection('users').doc(email).set({
        'email': '${email}',
        'username': '$userName',
        'createdAt': '${DateTime.now()}',
      });
    } catch (e) {
      print(e);
    }
  }

  Future builder()async{
    try {
    }
    catch (e) {

    }
  }



  Future userCheckIn(
    var email,
  ) async {
    try {
      final DateTime now = DateTime.now();

      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formatted = formatter.format(now);
      var time = DateFormat.jm().format(DateTime.now());

      String username = await getUserName(email);
      await _firestore.collection('timefolio').doc(formatted.toString()).set({
        email: {
          'date': formatted.toString(),
          'username': username,
          'email': email,
          'active': true,
          'checkin': '$time',
          'time': '${formatted} 21:00:00.000000',
        },
      }, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  Future checkOut(String email) async {
    try {
      var time = DateFormat.jm().format(DateTime.now());
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formatted = formatter.format(now);
      await _firestore.collection('timefolio').doc(formatted.toString()).set({
        email: {'checkout': '$time', 'active': false},
      }, SetOptions(merge: true));
    } catch (e) {}
  }

  Future checkOutAfterTime(String email,var diff) async {
    try {
      var time = '9:00 PM';
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formatted = formatter.format(now);
      await _firestore.collection('timefolio').doc(formatted.toString()).set({
        email: {'checkout': '9:00 PM', 'active': false , 'diff':'$diff'},
      }, SetOptions(merge: true));
    } catch (e) {}
  }

  Future getCheckInDate(
    var email,
  ) async {
    try {
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formatted = formatter.format(now);

      final res = await _firestore
          .collection('timefolio')
          .doc(formatted.toString())
          .get();
      return res.data()![email]['checkin'];
    } catch (e) {
      print(e);
    }
  }

  Future getDiff(
    var email,
  ) async {
    try {
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formatted = formatter.format(now);

      final res = await _firestore
          .collection('timefolio')
          .doc(formatted.toString())
          .get();
      return res.data()![email]['diff'];
    } catch (e) {
      print(e);
    }
  }

  Future getCheckOutDate(
    var email,
  ) async {
    try {
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formatted = formatter.format(now);
      final res = await _firestore
          .collection('timefolio')
          .doc(formatted.toString())
          .get();
      return res.data()![email]['checkout'];
    } catch (e) {
      print(e);
    }
  }

  Future checkOutTimeDiff(String email, String diff) async {
    try {
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formatted = formatter.format(now);
      await _firestore.collection('timefolio').doc(formatted.toString()).set({
        email: {
          'diff': diff,
        },
      }, SetOptions(merge: true));
    } catch (e) {}
  }

  Future getUserName(String email) async {
    try {
      var response = await _firestore.collection('users').doc(email).get();
      return await response.data()!['username'].toString();
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }

  Future fetchUserStatus(
    var email,
  ) async {
    try {
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formatted = formatter.format(now);
      final res = await _firestore
          .collection('timefolio')
          .doc(formatted.toString())
          .get();
      try {
        if (res.data()![email]['active'] != null) {
          if (res.data()![email]['active'].toString() == 'true') {
            return true;
          } else if (res.data()![email]['active'].toString() == 'false') {
            return false;
          }
        }
      } catch (e) {}
    } catch (e) {}
  }

  Future fetchDateRecords() async {
    try {
      var res = await _firestore.collection('timefolio').get();
      return await res.docs.map((e) => e.id).toList();
    } catch (e) {}
  }

  Future fetchUsersDataCheckedIn(key) async {
    try {
      var res = await _firestore.collection('timefolio').doc(key).get();
      res.data()!.forEach((key, value) async {
        DateTime dt = DateTime.parse(value['time'].toString());

        num t1 = dt.millisecondsSinceEpoch;
        num t2 = DateTime.now().millisecondsSinceEpoch;
 

        if (value['checkout'] == null && t2 >= t1) {
          print('checking out time Exceeded!!!!!');
          var dateFormat = DateFormat('h:ma');
          String checkIn = value['checkin'].toString().replaceAll(' ', '');
          DateTime durationStart = dateFormat.parse(checkIn);
          DateTime durationEnd = dateFormat.parse('9:00PM');
          var diff = '${durationEnd.difference(durationStart).inHours}';
          
          await checkOutAfterTime(key,'$diff Hrs');
        }
      });
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  Future fetchUsersData(key) async {
    try {
    await fetchUsersDataCheckedIn(key);
      var res = await _firestore.collection('timefolio').doc(key).get();
      List<Map<String, dynamic>> list = [];
      res.data()!.forEach((key, value) {
        list.add(value);
      });
      return list;
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }
}
