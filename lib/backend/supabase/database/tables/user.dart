import '../database.dart';

class UserTable extends SupabaseTable<UserRow> {
  @override
  String get tableName => 'User';

  @override
  UserRow createRow(Map<String, dynamic> data) => UserRow(data);
}

class UserRow extends SupabaseDataRow {
  UserRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get profilePic => getField<String>('Profile_Pic');
  set profilePic(String? value) => setField<String>('Profile_Pic', value);

  String? get fullName => getField<String>('Full_Name');
  set fullName(String? value) => setField<String>('Full_Name', value);

  String? get username => getField<String>('Username');
  set username(String? value) => setField<String>('Username', value);

  String? get gender => getField<String>('Gender');
  set gender(String? value) => setField<String>('Gender', value);

  String? get age => getField<String>('Age');
  set age(String? value) => setField<String>('Age', value);

  String? get lookingFor => getField<String>('LookingFor');
  set lookingFor(String? value) => setField<String>('LookingFor', value);

  String? get country => getField<String>('Country');
  set country(String? value) => setField<String>('Country', value);

  String? get city => getField<String>('City');
  set city(String? value) => setField<String>('City', value);

  String? get countryLooking => getField<String>('Country_Looking');
  set countryLooking(String? value) =>
      setField<String>('Country_Looking', value);

  DateTime? get online => getField<DateTime>('Online');
  set online(DateTime? value) => setField<DateTime>('Online', value);

  bool? get vipProfilee => getField<bool>('Vip_Profilee');
  set vipProfilee(bool? value) => setField<bool>('Vip_Profilee', value);

  bool? get verify => getField<bool>('verify');
  set verify(bool? value) => setField<bool>('verify', value);

  bool? get verifySend => getField<bool>('verify_send');
  set verifySend(bool? value) => setField<bool>('verify_send', value);

  String? get fcmToken => getField<String>('FCM_TOKEN');
  set fcmToken(String? value) => setField<String>('FCM_TOKEN', value);

  String? get job => getField<String>('Job');
  set job(String? value) => setField<String>('Job', value);

  String? get marriedStatus => getField<String>('Married status');
  set marriedStatus(String? value) => setField<String>('Married status', value);

  String? get skinColor => getField<String>('Skin color');
  set skinColor(String? value) => setField<String>('Skin color', value);

  String? get tall => getField<String>('Tall');
  set tall(String? value) => setField<String>('Tall', value);

  bool? get deactivate => getField<bool>('Deactivate');
  set deactivate(bool? value) => setField<bool>('Deactivate', value);

  bool get deleted => getField<bool>('Deleted')!;
  set deleted(bool value) => setField<bool>('Deleted', value);

  List<String> get chatsIds => getListField<String>('Chats_ids');
  set chatsIds(List<String>? value) => setListField<String>('Chats_ids', value);

  List<String> get followers => getListField<String>('Followers');
  set followers(List<String>? value) =>
      setListField<String>('Followers', value);

  List<String> get following => getListField<String>('Following');
  set following(List<String>? value) =>
      setListField<String>('Following', value);

  List<String> get views => getListField<String>('Views');
  set views(List<String>? value) => setListField<String>('Views', value);

  bool? get notiSeen => getField<bool>('Noti_Seen');
  set notiSeen(bool? value) => setField<bool>('Noti_Seen', value);

  List<String> get notifications => getListField<String>('Notifications');
  set notifications(List<String>? value) =>
      setListField<String>('Notifications', value);

  String? get location => getField<String>('Location');
  set location(String? value) => setField<String>('Location', value);

  String? get uid => getField<String>('UID');
  set uid(String? value) => setField<String>('UID', value);

  bool? get admin => getField<bool>('Admin');
  set admin(bool? value) => setField<bool>('Admin', value);

  bool? get ageDone => getField<bool>('Age_Done');
  set ageDone(bool? value) => setField<bool>('Age_Done', value);

  DateTime? get agePlus => getField<DateTime>('Age_Plus');
  set agePlus(DateTime? value) => setField<DateTime>('Age_Plus', value);

  String? get email => getField<String>('Email');
  set email(String? value) => setField<String>('Email', value);

  List<String> get blocked => getListField<String>('Blocked');
  set blocked(List<String>? value) => setListField<String>('Blocked', value);

  int? get userId => getField<int>('USER ID');
  set userId(int? value) => setField<int>('USER ID', value);

  bool get editer => getField<bool>('Editer')!;
  set editer(bool value) => setField<bool>('Editer', value);

  bool get chekced => getField<bool>('Chekced')!;
  set chekced(bool value) => setField<bool>('Chekced', value);

  bool get notiPhoto => getField<bool>('Noti_Photo')!;
  set notiPhoto(bool value) => setField<bool>('Noti_Photo', value);

  bool get notiFollowers => getField<bool>('Noti_Followers')!;
  set notiFollowers(bool value) => setField<bool>('Noti_Followers', value);

  bool get notiViews => getField<bool>('Noti_Views')!;
  set notiViews(bool value) => setField<bool>('Noti_Views', value);

  bool get notiMeesgae => getField<bool>('Noti_meesgae')!;
  set notiMeesgae(bool value) => setField<bool>('Noti_meesgae', value);

  bool get notiLikes => getField<bool>('Noti_Likes')!;
  set notiLikes(bool value) => setField<bool>('Noti_Likes', value);

  bool get tEst => getField<bool>('TEst')!;
  set tEst(bool value) => setField<bool>('TEst', value);

  List<int> get postNumber => getListField<int>('PostNumber');
  set postNumber(List<int>? value) => setListField<int>('PostNumber', value);

  bool get accountBan => getField<bool>('Account Ban')!;
  set accountBan(bool value) => setField<bool>('Account Ban', value);

  bool get onlineCheck => getField<bool>('Online Check')!;
  set onlineCheck(bool value) => setField<bool>('Online Check', value);

  bool get followingCheck => getField<bool>('Following Check')!;
  set followingCheck(bool value) => setField<bool>('Following Check', value);

  bool get messageCheck => getField<bool>('Message Check')!;
  set messageCheck(bool value) => setField<bool>('Message Check', value);

  bool get tick => getField<bool>('Tick')!;
  set tick(bool value) => setField<bool>('Tick', value);

  bool get admin2 => getField<bool>('admin2')!;
  set admin2(bool value) => setField<bool>('admin2', value);

  int? get idd => getField<int>('IDD');
  set idd(int? value) => setField<int>('IDD', value);

  int? get blockedNum => getField<int>('Blocked_Num');
  set blockedNum(int? value) => setField<int>('Blocked_Num', value);

  int? get chatsNum => getField<int>('Chats_Num');
  set chatsNum(int? value) => setField<int>('Chats_Num', value);

  int? get favoriteNum => getField<int>('Favorite_Num');
  set favoriteNum(int? value) => setField<int>('Favorite_Num', value);

  int? get postNum => getField<int>('Post_Num');
  set postNum(int? value) => setField<int>('Post_Num', value);

  bool get vipFake => getField<bool>('Vip_Fake')!;
  set vipFake(bool value) => setField<bool>('Vip_Fake', value);

  bool get Admin2 => getField<bool>('Admin2')!;
  set Admin2(bool value) => setField<bool>('Admin2', value);

  dynamic? get rejected => getField<dynamic>('Rejected');
  set rejected(dynamic? value) => setField<dynamic>('Rejected', value);

  DateTime? get buyDate => getField<DateTime>('Buy_Date');
  set buyDate(DateTime? value) => setField<DateTime>('Buy_Date', value);

  DateTime? get expireTime => getField<DateTime>('Expire_Time');
  set expireTime(DateTime? value) => setField<DateTime>('Expire_Time', value);

  int? get profileViewsNum => getField<int>('Profile_Views_Num');
  set profileViewsNum(int? value) => setField<int>('Profile_Views_Num', value);

  List<String> get profileViews => getListField<String>('Profile_Views');
  set profileViews(List<String>? value) =>
      setListField<String>('Profile_Views', value);

  List<String> get rejectedList => getListField<String>('Rejected_List');
  set rejectedList(List<String>? value) =>
      setListField<String>('Rejected_List', value);

  int? get notificationNum => getField<int>('Notification_Num');
  set notificationNum(int? value) => setField<int>('Notification_Num', value);

  int? get noti => getField<int>('Noti');
  set noti(int? value) => setField<int>('Noti', value);

  List<String> get matchedList => getListField<String>('MatchedList');
  set matchedList(List<String>? value) =>
      setListField<String>('MatchedList', value);

  List<String> get iRejectList => getListField<String>('I_reject_list');
  set iRejectList(List<String>? value) =>
      setListField<String>('I_reject_list', value);

  List<String> get iMatched => getListField<String>('I_matched');
  set iMatched(List<String>? value) => setListField<String>('I_matched', value);

  List<String> get friendsList => getListField<String>('FriendsList');
  set friendsList(List<String>? value) =>
      setListField<String>('FriendsList', value);

  String? get aboutMe => getField<String>('About Me');
  set aboutMe(String? value) => setField<String>('About Me', value);

  bool get noProfile => getField<bool>('No Profile')!;
  set noProfile(bool value) => setField<bool>('No Profile', value);
}
