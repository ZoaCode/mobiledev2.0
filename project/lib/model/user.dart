class User {
 String fname;
 String lname;
 String allegent;
 String role;
 String userID;
 User({this.fname, this.lname, this.allegent, this.role,this.userID});
 User.fromMap(Map<String, dynamic> data) {
 fname = data['FName'];
 lname = data['LName'];
 allegent = data['allegent'];
 role = data['role'];
 userID = data['userID'];
 }
 Map<String, dynamic> toMap() {
 return {
 'FName': fname,
 'LName': lname,
 'allegent': allegent,
 'role': role,
 'userID' : userID
 };
 }
}