// To parse this JSON data, do
//
//     final allTestNameModel = allTestNameModelFromJson(jsonString);

import 'dart:convert';

AllTestNameModel allTestNameModelFromJson(String str) => AllTestNameModel.fromJson(json.decode(str));

String allTestNameModelToJson(AllTestNameModel data) => json.encode(data.toJson());

class AllTestNameModel {
  int? status;
  List<TestName>? testName;

  AllTestNameModel({
    this.status,
    this.testName,
  });

  factory AllTestNameModel.fromJson(Map<String, dynamic> json) => AllTestNameModel(
    status: json["status"],
    testName: json["test_name"] == null ? [] : List<TestName>.from(json["test_name"]!.map((x) => TestName.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "test_name": testName == null ? [] : List<dynamic>.from(testName!.map((x) => x.toJson())),
  };
}

class TestName {
  int? id;
  String? testGroupId;
  String? testCategoryId;
  dynamic testSubCategoryId;
  String? testName;
  String? fee;
  dynamic testParameter;
  String? accountsId;
  String? accountsTypeId;
  String? accountsGroupId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic parameterGroupId;
  Category? category;
  Group? group;
  dynamic subCategory;
  List<dynamic>? parameter;
  Accounts? accounts;
  AccountsGroup? accountsGroup;
  Accounts? accountsType;

  TestName({
    this.id,
    this.testGroupId,
    this.testCategoryId,
    this.testSubCategoryId,
    this.testName,
    this.fee,
    this.testParameter,
    this.accountsId,
    this.accountsTypeId,
    this.accountsGroupId,
    this.createdAt,
    this.updatedAt,
    this.parameterGroupId,
    this.category,
    this.group,
    this.subCategory,
    this.parameter,
    this.accounts,
    this.accountsGroup,
    this.accountsType,
  });

  factory TestName.fromJson(Map<String, dynamic> json) => TestName(
    id: json["id"],
    testGroupId: json["test_group_id"],
    testCategoryId: json["test_category_id"],
    testSubCategoryId: json["test_sub_category_id"],
    testName: json["test_name"],
    fee: json["fee"],
    testParameter: json["test_parameter"],
    accountsId: json["accounts_id"],
    accountsTypeId: json["accounts_type_id"],
    accountsGroupId: json["accounts_group_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    parameterGroupId: json["parameter_group_id"],
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    group: json["group"] == null ? null : Group.fromJson(json["group"]),
    subCategory: json["sub_category"],
    parameter: json["parameter"] == null ? [] : List<dynamic>.from(json["parameter"]!.map((x) => x)),
    accounts: json["accounts"] == null ? null : Accounts.fromJson(json["accounts"]),
    accountsGroup: json["accounts_group"] == null ? null : AccountsGroup.fromJson(json["accounts_group"]),
    accountsType: json["accounts_type"] == null ? null : Accounts.fromJson(json["accounts_type"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "test_group_id": testGroupId,
    "test_category_id": testCategoryId,
    "test_sub_category_id": testSubCategoryId,
    "test_name": testName,
    "fee": fee,
    "test_parameter": testParameter,
    "accounts_id": accountsId,
    "accounts_type_id": accountsTypeId,
    "accounts_group_id": accountsGroupId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "parameter_group_id": parameterGroupId,
    "category": category?.toJson(),
    "group": group?.toJson(),
    "sub_category": subCategory,
    "parameter": parameter == null ? [] : List<dynamic>.from(parameter!.map((x) => x)),
    "accounts": accounts?.toJson(),
    "accounts_group": accountsGroup?.toJson(),
    "accounts_type": accountsType?.toJson(),
  };
}

class Accounts {
  int? id;
  String? name;

  Accounts({
    this.id,
    this.name,
  });

  factory Accounts.fromJson(Map<String, dynamic> json) => Accounts(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class AccountsGroup {
  int? id;
  String? feeName;

  AccountsGroup({
    this.id,
    this.feeName,
  });

  factory AccountsGroup.fromJson(Map<String, dynamic> json) => AccountsGroup(
    id: json["id"],
    feeName: json["fee_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fee_name": feeName,
  };
}

class Category {
  int? id;
  String? testCategoryName;

  Category({
    this.id,
    this.testCategoryName,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    testCategoryName: json["test_category_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "test_category_name": testCategoryName,
  };
}

class Group {
  int? id;
  String? testGroupName;

  Group({
    this.id,
    this.testGroupName,
  });

  factory Group.fromJson(Map<String, dynamic> json) => Group(
    id: json["id"],
    testGroupName: json["test_group_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "test_group_name": testGroupName,
  };
}
