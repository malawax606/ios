// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends FFFirebaseStruct {
  UserStruct({
    DateTime? createdAt,
    String? fullName,
    String? username,
    String? gender,
    String? age,
    String? country,
    String? city,
    bool? verify,
    bool? vipProfilee,
    String? job,
    String? marriedstatus,
    String? skincolor,
    String? profilePic,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _createdAt = createdAt,
        _fullName = fullName,
        _username = username,
        _gender = gender,
        _age = age,
        _country = country,
        _city = city,
        _verify = verify,
        _vipProfilee = vipProfilee,
        _job = job,
        _marriedstatus = marriedstatus,
        _skincolor = skincolor,
        _profilePic = profilePic,
        super(firestoreUtilData);

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "Full_Name" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  set fullName(String? val) => _fullName = val;

  bool hasFullName() => _fullName != null;

  // "Username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;

  bool hasUsername() => _username != null;

  // "Gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;

  bool hasGender() => _gender != null;

  // "Age" field.
  String? _age;
  String get age => _age ?? '';
  set age(String? val) => _age = val;

  bool hasAge() => _age != null;

  // "Country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;

  bool hasCountry() => _country != null;

  // "City" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "verify" field.
  bool? _verify;
  bool get verify => _verify ?? false;
  set verify(bool? val) => _verify = val;

  bool hasVerify() => _verify != null;

  // "Vip_Profilee" field.
  bool? _vipProfilee;
  bool get vipProfilee => _vipProfilee ?? false;
  set vipProfilee(bool? val) => _vipProfilee = val;

  bool hasVipProfilee() => _vipProfilee != null;

  // "Job" field.
  String? _job;
  String get job => _job ?? '';
  set job(String? val) => _job = val;

  bool hasJob() => _job != null;

  // "Marriedstatus" field.
  String? _marriedstatus;
  String get marriedstatus => _marriedstatus ?? '';
  set marriedstatus(String? val) => _marriedstatus = val;

  bool hasMarriedstatus() => _marriedstatus != null;

  // "Skincolor" field.
  String? _skincolor;
  String get skincolor => _skincolor ?? '';
  set skincolor(String? val) => _skincolor = val;

  bool hasSkincolor() => _skincolor != null;

  // "Profile_Pic" field.
  String? _profilePic;
  String get profilePic => _profilePic ?? '';
  set profilePic(String? val) => _profilePic = val;

  bool hasProfilePic() => _profilePic != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        createdAt: data['created_at'] as DateTime?,
        fullName: data['Full_Name'] as String?,
        username: data['Username'] as String?,
        gender: data['Gender'] as String?,
        age: data['Age'] as String?,
        country: data['Country'] as String?,
        city: data['City'] as String?,
        verify: data['verify'] as bool?,
        vipProfilee: data['Vip_Profilee'] as bool?,
        job: data['Job'] as String?,
        marriedstatus: data['Marriedstatus'] as String?,
        skincolor: data['Skincolor'] as String?,
        profilePic: data['Profile_Pic'] as String?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'created_at': _createdAt,
        'Full_Name': _fullName,
        'Username': _username,
        'Gender': _gender,
        'Age': _age,
        'Country': _country,
        'City': _city,
        'verify': _verify,
        'Vip_Profilee': _vipProfilee,
        'Job': _job,
        'Marriedstatus': _marriedstatus,
        'Skincolor': _skincolor,
        'Profile_Pic': _profilePic,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'Full_Name': serializeParam(
          _fullName,
          ParamType.String,
        ),
        'Username': serializeParam(
          _username,
          ParamType.String,
        ),
        'Gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'Age': serializeParam(
          _age,
          ParamType.String,
        ),
        'Country': serializeParam(
          _country,
          ParamType.String,
        ),
        'City': serializeParam(
          _city,
          ParamType.String,
        ),
        'verify': serializeParam(
          _verify,
          ParamType.bool,
        ),
        'Vip_Profilee': serializeParam(
          _vipProfilee,
          ParamType.bool,
        ),
        'Job': serializeParam(
          _job,
          ParamType.String,
        ),
        'Marriedstatus': serializeParam(
          _marriedstatus,
          ParamType.String,
        ),
        'Skincolor': serializeParam(
          _skincolor,
          ParamType.String,
        ),
        'Profile_Pic': serializeParam(
          _profilePic,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        fullName: deserializeParam(
          data['Full_Name'],
          ParamType.String,
          false,
        ),
        username: deserializeParam(
          data['Username'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['Gender'],
          ParamType.String,
          false,
        ),
        age: deserializeParam(
          data['Age'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['Country'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['City'],
          ParamType.String,
          false,
        ),
        verify: deserializeParam(
          data['verify'],
          ParamType.bool,
          false,
        ),
        vipProfilee: deserializeParam(
          data['Vip_Profilee'],
          ParamType.bool,
          false,
        ),
        job: deserializeParam(
          data['Job'],
          ParamType.String,
          false,
        ),
        marriedstatus: deserializeParam(
          data['Marriedstatus'],
          ParamType.String,
          false,
        ),
        skincolor: deserializeParam(
          data['Skincolor'],
          ParamType.String,
          false,
        ),
        profilePic: deserializeParam(
          data['Profile_Pic'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        createdAt == other.createdAt &&
        fullName == other.fullName &&
        username == other.username &&
        gender == other.gender &&
        age == other.age &&
        country == other.country &&
        city == other.city &&
        verify == other.verify &&
        vipProfilee == other.vipProfilee &&
        job == other.job &&
        marriedstatus == other.marriedstatus &&
        skincolor == other.skincolor &&
        profilePic == other.profilePic;
  }

  @override
  int get hashCode => const ListEquality().hash([
        createdAt,
        fullName,
        username,
        gender,
        age,
        country,
        city,
        verify,
        vipProfilee,
        job,
        marriedstatus,
        skincolor,
        profilePic
      ]);
}

UserStruct createUserStruct({
  DateTime? createdAt,
  String? fullName,
  String? username,
  String? gender,
  String? age,
  String? country,
  String? city,
  bool? verify,
  bool? vipProfilee,
  String? job,
  String? marriedstatus,
  String? skincolor,
  String? profilePic,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserStruct(
      createdAt: createdAt,
      fullName: fullName,
      username: username,
      gender: gender,
      age: age,
      country: country,
      city: city,
      verify: verify,
      vipProfilee: vipProfilee,
      job: job,
      marriedstatus: marriedstatus,
      skincolor: skincolor,
      profilePic: profilePic,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserStruct? updateUserStruct(
  UserStruct? user, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    user
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserStructData(
  Map<String, dynamic> firestoreData,
  UserStruct? user,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (user == null) {
    return;
  }
  if (user.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && user.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userData = getUserFirestoreData(user, forFieldValue);
  final nestedData = userData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = user.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserFirestoreData(
  UserStruct? user, [
  bool forFieldValue = false,
]) {
  if (user == null) {
    return {};
  }
  final firestoreData = mapToFirestore(user.toMap());

  // Add any Firestore field values
  user.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserListFirestoreData(
  List<UserStruct>? users,
) =>
    users?.map((e) => getUserFirestoreData(e, true)).toList() ?? [];
