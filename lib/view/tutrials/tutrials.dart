import 'package:digi_patient/resources/styles.dart';
import 'package:flutter/material.dart';

import '../../resources/colors.dart';

class TutrialsView extends StatelessWidget {
  const TutrialsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        //automaticallyImplyLeading: false,

        centerTitle: true,
        title: Text(
          "FAQ",
          style: Style.alltext_default_white,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Follow the FAQ guideline to use the app",
                  style: Style.alltext_default_balck_blod,
                ),
              ),
              ExpansionTile(
                title: Text("আমি ডাক্তার কিভাবে এড করবো?"),
                expandedAlignment: Alignment.topLeft,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: EdgeInsets.only(left: 14,right: 6),

                children: [
                  Text(
                      "অ্যাপটি ডাউনলোড করে ডাক্তারের আইডি বসান এবং সাবমিট বাটন চাপ দিন"),
                ],
              ),
              ExpansionTile(
                title: Text("ডাক্তার কিভাবে অ্যাপোয়েন্টমেন্ট করব?"),
                expandedAlignment: Alignment.topLeft,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: EdgeInsets.only(left: 14,right: 6),
                children: [
                  Text("ডাক্তার এপয়েন্টমেন্ট করার স্টেপ গুলো হল"),
                  Text(
                      "a.   যে ডাক্তার দেখাতে চান তাকে সিলেট করুন করে ক্লিক করুন"),
                  Text(
                      "b.   ডাক্তারের প্রোফাইল দেখে রিকোয়েস্ট ফর এপয়েন্টমেন্ট ক্লিক করুন"),
                  Text(
                      "c.   তারিখ সিলেক্ট করে চেম্বারে দেখাতে চান নাকি অনলাইনে দেখাতে চান সকালে দেখাতে চান না বিকালে দেখাতে চান সিলেট করুন"),
                  Text(
                      "d.   সিলেক্ট সিমটমস ক্লিক করে আপনার শরীরের যে জায়গায় সমস্যা সে জায়গা সিলেক্ট করে সমস্যাগুলোর নির্দেশ করুন"),
                  Text("e.  কনফার্ম এপয়েন্টমেন্ট ক্লিক করুন"),
                  Text(
                      "f.   পেমেন্ট মেথডে আপনি যে নাম্বার থেকে বিকাশ করেছেন সেই বিকাশ নাম্বার ট্রানজেকশন আইডি এবং রেফারেন্স পূরণ করুন"),
                  Text(
                      "g.   ডিজিটাল পেমেন্ট হয়ে গেলে পেয়ে নাও বাটন ক্লিক করুন"),
                  Text("h.  ইনভয়েস দেখে তারপর সেভ করুন"),
                ],
              ),
              ExpansionTile(
                expandedAlignment: Alignment.topLeft,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: EdgeInsets.only(left: 14,right: 6),
                title: Text("মাই রেকর্ড কিভাবে কাজ করে?"),
                children: [
                  Text(
                      "a.   ভাইটালস আপনার ভাইটাল ইনফরমেশন ইনপুট করুন এবং এদের গ্রাফ দেখুন"),
                  Text(
                      "b.   মাই মেডিকেল হিস্ট্রি রুগী যদি কোন মেডিকেল হিস্ট্রি ইনপুট করতে চান তাহলে এখান থেকে ইনপুট করুন"),
                  Text(
                      "c.   মাই রিপোর্টে আপনার প্রেসক্রিপশন এবং রিপোর্ট আপলোড করে সেভ করুন"),
                  Text(
                      "•    প্রেসক্রিপশন এর জন্য ডক্টর নাম এবং তারিখ দিয়ে সেভ করুন"),
                  Text(
                      "•    রিপোর্টের জন্য কি ধরনের রিপোর্ট নেবেন নাম এবং তারিখ দিয়ে সেভ করুন"),
                ],
              ),
              ExpansionTile(
                title: Text("মাই এপয়েন্টমেন্ট কিভাবে কাজ করে?"),
                expandedAlignment: Alignment.topLeft,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: EdgeInsets.only(left: 14,right: 6),
                children: [
                  Text(
                      "মাই এ্যাপয়েন্টমেন্টে আপনার today’s apartment এবং আপকামিং এপয়েন্টমেন্ট সহ দেখতে পারবেন"),
                ],
              ),
              ExpansionTile(
                title: Text("মাই মেডিসিন এ কি আছে?"),
                expandedAlignment: Alignment.topLeft,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: EdgeInsets.only(left: 14,right: 6),
                children: [
                  Text(
                      "মাই মেডিসিন এর দুইটা পার্ট মেডিকেশনে আপনার প্রেসক্রিপশন গুলো দেখতে পারবেন এবং বাই মেডিসিন থেকে মেডিসিন কিনতে পারবেন"),
                ],
              ),
              ExpansionTile(
                title: Text("রিসোর্সে কি আছে?"),
                expandedAlignment: Alignment.topLeft,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: EdgeInsets.only(left: 14,right: 6),
                children: [
                  Text(
                      "এখান থেকে আপনি বিভিন্ন পেশেন্ট এডুকেশন ম্যাটেরিয়াল পাবেন"),
                ],
              ),
              ExpansionTile(
                title: Text("মাই পেমেন্ট এর মধ্যে কি ইনফরমেশন পাব?"),
                expandedAlignment: Alignment.topLeft,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: EdgeInsets.only(left: 14,right: 6),
                children: [
                  Text("মাই পেমেন্ট থেকে পেমেন্টের হিস্ট্রি দেখতে পারবেন"),
                ],
              ),
              ExpansionTile(
                title: Text("ডাক্তারের ভিজিট প্রদানের নিয়মাবলী কি?"),
                expandedAlignment: Alignment.topLeft,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: EdgeInsets.only(left: 14,right: 6),
                children: [
                  Text(
                      "ডাক্তারের বিকাশ নাম্বারে ভিজিট প্রদানের পর আপনি যে নাম্বার থেকে বিকাশ করেছেন সেই নাম্বার ট্রানজেকশন আইডি এবং রেফারেন্স নাম্বার মনে রাখুন যা পরবর্তীতে আপনার অ্যাপয়েন্টমেন্ট করার সময় কাজে লাগবে |"),
                ],
              ),
              ExpansionTile(
                title:
                    Text("ডাক্তারের কাছে ভিজিট হয়েছে কিনা কীভাবে বুঝতে পারি?"),
                expandedAlignment: Alignment.topLeft,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: EdgeInsets.only(left: 14,right: 6),
                children: [
                  Text(
                      "ভিজিটের টাকা আপনি যখন অ্যাপোয়েন্টমেন্ট করার সময় দিয়েছেন তার কিছুক্ষণ পর আপনি এসএমএস পাবেন যা দিয়ে আপনি বুঝতে পারবেন আপনার এপয়েন্টমেন্ট হয়েছে কিনা"),
                ],
              ),
              ExpansionTile(
                title: Text(
                    "ডক্টরের সাথে কথা বলার পরে নতুন প্রেসক্রিপশন কীভাবে পাব?"),
                expandedAlignment: Alignment.topLeft,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: EdgeInsets.only(left: 14,right: 6),
                children: [
                  Text(
                      "ডাক্তারের সাথে কথা বলার পরে ডাক্তার প্রেসক্রিপশন আপলোড করবে যা আপনি আপনার মেডিকেশন বাটন থেকে ক্লিক করে প্রেসক্রিপশন দেখতে পারবেন"),
                ],
              ),
              ExpansionTile(
                title: Text(
                    "পরবর্তীতে যদি প্রয়োজন হয় তাদের সাথে একাধিক ফলোআপ করা যাবে কি?"),
                expandedAlignment: Alignment.topLeft,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: EdgeInsets.only(left: 14,right: 6),
                children: [
                  Text(
                      "রোগী ডাক্তারের সাথে একাধিক ফলোআপ করতে পারবেন প্রতিবার ফলোআপে নতুন করে এপয়েন্টমেন্ট নিয়ে ডাক্তারের সাথে কথা বলতে পারবেন"),
                ],
              ),
              ExpansionTile(
                title: Text(
                    "নির্ধারিত সময়ে ডক্টরের সাথে টেলিমেডিসিন ফলোআপ করার জন্য করনীয় কী?"),
                expandedAlignment: Alignment.topLeft,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: EdgeInsets.only(left: 14,right: 6),
                children: [
                  Text(
                      "ডক্টরের ফলোআপ করার জন্য নির্দিষ্ট সময়ের ১০ মিনিট আগে আপনি অ্যাপ এ প্রবেশ করুন এবং অপেক্ষা করুন"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
