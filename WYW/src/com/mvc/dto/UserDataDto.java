package com.mvc.dto;

import java.util.Date;

public class UserDataDto {

	private int userno;			//가입 순서 번호
	private String userid;		//유저 아이디
	private String userpw;		//유저 비밀번호
	private String username;	//유저 이름
	private String useraddr;	//유저 주소
	private String userphone;	//유저 전화번호
	private String useremail;	//유저 이메일
	private String userenabled;	//유저 탈퇴여부
	private String userrole;	//유저 역할(관리자,일반유저)
	private int userfollow;		//유저 팔로우(팔로인,팔로우를 하나로 합침)
	private int boardno;		//보드 번호
	private int groupno;		//그룹 번호
	private int groupsq;		//그룹 시퀀스 번호
	private String title;		//제목
	private String content;		//내용
	private int useridno;		//usercontent에 useridno 정보
	private String userimgname;	//등록한 사진 이름
	private int userlike;		//좋아요 수
	private Date regdate;		//글 등록 날자
	private String users;	//로그인해서 검색하는 유저 아이디
	private String followeruser;  //검색되는 유저 아이디 
	
	
	public UserDataDto() {
		super();
	}
 

	public UserDataDto(int userno, String userid, String userpw, String username, String useraddr, String userphone,
			String useremail, String userenabled, String userrole, int userfollow, int boardno, int groupno,
			int groupsq, String title, String content, int useridno, String userimgname, String userimg, int userlike, Date regdate,
			String users, String followeruser) {
		super();
		this.userno = userno;
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.useraddr = useraddr;
		this.userphone = userphone;
		this.useremail = useremail;
		this.userenabled = userenabled;
		this.userrole = userrole;
		this.userfollow = userfollow;
		this.boardno = boardno;
		this.groupno = groupno;
		this.groupsq = groupsq;
		this.title = title;
		this.content = content;
		this.useridno = useridno;
		this.userimgname = userimgname;
		this.userlike = userlike;
		this.regdate = regdate;
		this.users = users;
		this.followeruser = followeruser;
	}
	
	//insertnotice
	public UserDataDto(int userno, String writer, String title, String content) {

		this.userno = userno;
		this.username = writer;
		this.title = title;
		this.content = content;

	}
	//updatenotice
	public UserDataDto(int boardno, String title, String content) {
		
		this.boardno = boardno;
		this.title = title;
		this.content = content;
		
	}
	
	//updateuser
	public UserDataDto(String username, String useraddr, String userpw, String userphone, String useremail, int userno) {
		this.username = username;
		this.useraddr = useraddr;
		this.userpw = userpw;
		this.userphone = userphone;
		this.useremail = useremail;
		this.userno = userno;
	}
	
	public UserDataDto(int boardno, int groupno, int groupsq, String title, String content, int useridno,
			String userimgname, int userlike, Date regdate) {
		super();
		this.boardno = boardno;
		this.groupno = groupno;
		this.groupsq = groupsq;
		this.title = title;
		this.content = content;
		this.useridno = useridno;
		this.userimgname = userimgname;
		this.userlike = userlike;
		this.regdate = regdate;
	}


	public int getUserno() {
		return userno;
	}


	public void setUserno(int userno) {
		this.userno = userno;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getUserpw() {
		return userpw;
	}


	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getUseraddr() {
		return useraddr;
	}


	public void setUseraddr(String useraddr) {
		this.useraddr = useraddr;
	}


	public String getUserphone() {
		return userphone;
	}


	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}


	public String getUseremail() {
		return useremail;
	}


	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}


	public String getUserenabled() {
		return userenabled;
	}


	public void setUserenabled(String userenabled) {
		this.userenabled = userenabled;
	}


	public String getUserrole() {
		return userrole;
	}


	public void setUserrole(String userrole) {
		this.userrole = userrole;
	}


	public int getUserfollow() {
		return userfollow;
	}


	public void setUserfollow(int userfollow) {
		this.userfollow = userfollow;
	}


	public int getBoardno() {
		return boardno;
	}


	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}


	public int getGroupno() {
		return groupno;
	}


	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}


	public int getGroupsq() {
		return groupsq;
	}


	public void setGroupsq(int groupsq) {
		this.groupsq = groupsq;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}

	public int getUseridno() {
		return useridno;
	}

	public void setUseridno(int useridno) {
		this.useridno = useridno;
	}

	public String getUserimgname() {
		return userimgname;
	}

	public void setUserimgname(String userimgname) {
		this.userimgname = userimgname;
	}


	public int getUserlike() {
		return userlike;
	}


	public void setUserlike(int userlike) {
		this.userlike = userlike;
	}


	public Date getRegdate() {
		return regdate;
	}


	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}


	public String getUsers() {
		return users;
	}


	public void setUsers(String users) {
		this.users = users;
	}


	public String getFolloweruser() {
		return followeruser;
	}
	

	
	
}