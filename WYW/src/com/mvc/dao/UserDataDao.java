package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mvc.dto.UserDataDto;

import common.JDBCTemplate;

public class UserDataDao extends JDBCTemplate{
	private static UserDataDao instance = new UserDataDao();
	/*
	 * 관리자 기능
	 * 1.회원 전체 정보(탈퇴 회원 포함)
	 * 2.가입된 회원(userenabled='y')의 정보
	 * 3.회원 등급 조정(userrole)
	 * 4.공지사항 등록
	 * */
	//회원 전체 정보(탈퇴 회원 포함)
	public List<UserDataDto> selectAll(){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<UserDataDto> res = new ArrayList<UserDataDto>();
		
		String sql = " SELECT * FROM USERDATA ORDER BY USERNO DESC ";

		try {
			pstm = con.prepareStatement(sql);
			
			System.out.println("03. query 준비: "+ sql);

			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");

			while(rs.next()) {
				UserDataDto tmp = new UserDataDto();
				tmp.setUserno(rs.getInt(1));
				tmp.setUserid(rs.getString(2));
				tmp.setUserpw(rs.getString(3));
				tmp.setUsername(rs.getString(4));
				tmp.setUseraddr(rs.getString(5));
				tmp.setUserphone(rs.getString(6));
				tmp.setUseremail(rs.getString(7));
				tmp.setUserenabled(rs.getString(8));
				tmp.setUserrole(rs.getString(9));
				tmp.setUserfollow(rs.getInt(10));

				res.add(tmp);
			}
			
			
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	
	//회원 전체 정보(탈퇴 회원 미포함)
	public List<UserDataDto> selectEnabled(){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<UserDataDto> res = new ArrayList<UserDataDto>();
		
		String sql = " SELECT * FROM USERDATA WHERE USERENABLED='Y' ORDER BY USERNO DESC ";
		
		try {
			pstm = con.prepareStatement(sql);
			
			System.out.println("03. query 준비: "+ sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				UserDataDto tmp = new UserDataDto();
				tmp.setUserno(rs.getInt(1));
				tmp.setUserid(rs.getString(2));
				tmp.setUserpw(rs.getString(3));
				tmp.setUsername(rs.getString(4));
				tmp.setUseraddr(rs.getString(5));
				tmp.setUserphone(rs.getString(6));
				tmp.setUseremail(rs.getString(7));
				tmp.setUserenabled(rs.getString(8));
				tmp.setUserrole(rs.getString(9));
				tmp.setUserfollow(rs.getInt(10));
				
				res.add(tmp);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		return res;
		
	}
	
	//회원 등급 조정
	public int updateRole(int userno, String userrole) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " UPDATE USERDATA SET USERROLE=? WHERE USERNO=?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, userrole);
			pstm.setInt(2, userno);
			System.out.println("03. query 준비 : " + sql);

			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
			if(res > 0) {
				commit(con);
			}
			
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료 \n");
		}
		
		
		return res;
	}
	
	//공지사항 등록 = 스토리(게시판 글 작성)[userrole을 사용하여 분류함 
	//						ex)일반 유저가 쓰면 일반 컨텐츠 글,
	//							관리자가 글을 쓰면 공지 글]
	
	
	
	/*
	 * 사용자 기능(user)
	 * 1.로그인
	 * 2.회원가입 -> 아이디 중복체크
	 * 3.위치에 따른 날씨정보 확인(위치는 DEFAULT로 현재 내 위치를 잡아 선택, 
	 * 						날씨정보는 일기예보 사이트를 크롤링)
	 * 4.스토리[목록 보기, 글쓰기(content), 글 작성, 글 수정, 글 삭제, 다중 삭제]
	 * 5.추천 옷차림(클릭 시 스토리 페이지로 추천 옷차림을 기반으로 
	 * 				해시태그로 검색되어 스토리를 보여줌)
	 * 6.좋아요
	 * 7.팔로우(숫자와 팔로우한 사람들의 아이디 조회)
	 * 8.팔로잉(숫자와 팔로잉한 사람들의 아이디 조회)
	 * 9.사진 업로드
	 * 10.사진 다운로드
	 * 11.사진 삭제
	 * 12.검색(해시태그 검색, 유저 아이디 검색, 지역 검색)
	 * 13.사진 조회
	 * 14.내 정보 조회
	 * 15.회원 정보 수정
	 * 16.회원 탈퇴
	 * */
	//시작페이지(로그인)
	public UserDataDto login(String id, String pw) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		UserDataDto res = new UserDataDto();
		
		String sql = " SELECT * FROM USERDATA WHERE USERID=? AND USERPW=? AND USERENABLED=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			pstm.setString(2, pw);
			pstm.setString(3, "Y");
			System.out.println("03. query 준비: " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				res.setUserno(rs.getInt(1));
				res.setUserid(rs.getString(2));
				res.setUserpw(rs.getString(3));
				res.setUsername(rs.getString(4));
				res.setUseraddr(rs.getString(5));
				res.setUserphone(rs.getString(6));
				res.setUseremail(rs.getString(7));
				res.setUserenabled(rs.getString(8));
				res.setUserrole(rs.getString(9));
				res.setUserfollow(rs.getInt(10));
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 오류");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	
	//시작페이지(회원가입)
	public int insertUser(UserDataDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " INSERT INTO USERDATA VALUES(USERNOSQ.NEXTVAL, ?, ?, ?, ?, ?, ?, 'Y', 'USER', 0) ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getUserid());
			pstm.setString(2, dto.getUserpw());
			pstm.setString(3, dto.getUsername());
			pstm.setString(4, dto.getUseraddr());
			pstm.setString(5, dto.getUserphone());
			pstm.setString(6, dto.getUseremail());
			System.out.println("03. query 준비: " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");

			if(res>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료 \n");
		}
			
		return res;
	}
	
	//시작페이지(회원가입_아이디 중복 체크)
	public String idChk(String id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String res = null;
		
		String sql = " SELECT * FROM USERDATA WHERE USERID=? ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			System.out.println("03. query 준비 : " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				res = rs.getString(2);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료 \n");
		}
		
		return res;
	}
	
	//시작페이지(아이디찾기)
	public String findId(String name, String email) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String res = null;
		
		String sql = " SELECT * FROM USERDATA WHERE USERNAME=? AND USEREMAIL=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, name);
			pstm.setString(2, email);
			System.out.println("03. query 준비 : " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");

			while(rs.next()) {
				res = rs.getString(2);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료 \n");
		}
		
		return res;
	}
	
	public String findPw(String name, String id, String email) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String res = null;
		
		String sql = " SELECT * FROM USERDATA WHERE USERNAME=? AND USERID=? AND USEREMAIL=? ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, name);
			pstm.setString(2, id);
			pstm.setString(3, email);
			System.out.println("03. query 준비 : " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");

			while(rs.next()) {
				res = rs.getString(3);
			}
			
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료 \n");
		}
		
		return res;
	}
	
	//스토리(게시판 전체 목록)
	public List<UserDataDto> selectAllBoard(){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<UserDataDto> res = new ArrayList<UserDataDto>();
		
		String sql = " SELECT * FROM USERCONTENT ORDER BY GROUPNO DESC, GROUPSQ ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비: "+sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				UserDataDto dto = new UserDataDto();
				dto.setBoardno(rs.getInt(1));
				dto.setGroupno(rs.getInt(2));
				dto.setGroupsq(rs.getInt(3));
				dto.setTitle(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setUseridno(rs.getInt(6)); 
				dto.setUserimgname(rs.getNString(7));
				dto.setUserlike(rs.getInt(8));
				dto.setRegdate(rs.getDate(9));
				
				res.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	
	//스토리(게시판 글 선택)
	public UserDataDto selectOneBoard(int boardno) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		UserDataDto res = new UserDataDto();
		
		String sql = " SELECT * FROM USERCONTENT WHERE BOARDNO=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, boardno);
			System.out.println("03. query 준비: "+sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				res.setBoardno(rs.getInt(1));
				res.setGroupno(rs.getInt(2));
				res.setGroupsq(rs.getInt(3));
				res.setTitle(rs.getString(4));
				res.setContent(rs.getString(5));
				res.setUseridno(rs.getInt(6));
				res.setUserimgname(rs.getNString(7));
				res.setUserlike(rs.getInt(8));
				res.setRegdate(rs.getDate(9));
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	
	//스토리(게시판 글 작성)
	public int insertBoard(UserDataDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " INSERT INTO USERCONTENT "
				+" VALUES(BOARDNOSQ.NEXTVAL, GROUPNOSQ.NEXTVAL, 1, ?,?,?,?,0, SYSDATE) ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setString(3, dto.getUserimgname());
			pstm.setInt(4, dto.getUseridno());
			System.out.println("03. query 준비: "+sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
			if(res>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	
	//스토리(test)
	public ArrayList<UserDataDto> selectAllContent(){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		ArrayList<UserDataDto> res = new ArrayList<UserDataDto>();
		
		String sql = " SELECT * FROM USERCONTENT ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비: "+sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				res.add(new UserDataDto(
					rs.getInt(1),
					rs.getInt(2),
					rs.getInt(3),
					rs.getString(4),
					rs.getString(5),
					rs.getInt(6),
					rs.getString(7),
					rs.getInt(8),
					rs.getDate(9)
						)
					);
				
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	
	//스토리(사진 업로드)
	public int imgUpload(String userid, int userno, String city, String title, String content, String userimgname) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " INSERT INTO USERCONTENT "
				+" VALUES(BOARDNOSQ.NEXTVAL, GROUPNOSQ.NEXTVAL, 1, ?,?,?,?,0, SYSDATE) ";
		
		System.out.println(userid + " " + userno + " " + city + " " + title + " " + content  + " " + userimgname);
		
		UserDataDto tmp = new UserDataDto();
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, title);
			pstm.setString(2, content);
			pstm.setInt(3, userno);
			pstm.setString(4, userimgname);
			System.out.println("03. query 준비: "+sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
			if(res>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	
	//스토리(사진 다운로드)
	public String imgDownload() {
		
		return null;
	}
	
	//마이페이지(검색기능)
	public List<UserDataDto> searchUser(String myuserid, String select, String searchid){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String kw="";
		List<UserDataDto> res = new ArrayList<UserDataDto>();
		
		//기본 검색창 쿼리 : 'select옵션 중 kw'의 'searchid 입력값'이 userdata에 있니?
		
		if(select.equals("id")) {
			kw = "USERID";
		} else if(select.equals("address")) {
			kw = "USERADDR";
		} else if(select.equals("name")) {
			kw = "USERNAME";
		}
		
		//검색쿼리1
		String sql = " SELECT * FROM USERDATA WHERE " +kw
				+ " LIKE \'%" +searchid+ "%\' ";
		
		try {
			pstm = con.prepareStatement(sql);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				UserDataDto tmp = new UserDataDto();
				tmp.setUserno(rs.getInt(1));
				tmp.setUserid(rs.getString(2));
				tmp.setUseraddr(rs.getString(5));
				tmp.setUsername(rs.getString(4));
				
				res.add(tmp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
		}
		
		return res;
		
	}
	
	
	
	
	//마이페이지(내정보)
	public UserDataDto mypageUser(int userno) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		UserDataDto res = new UserDataDto();
		
		String sql = " SELECT * FROM USERDATA WHERE USERNO=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, userno);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				res.setUserno(rs.getInt(1));
				res.setUserid(rs.getString(2));
				res.setUseraddr(rs.getString(5));
				res.setUsername(rs.getString(4));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con);
			close(pstm);
			close(rs);
		}
		
		return res;
		
	}
	
	//마이페이지(follow 리스트 가져오기)
	public UserDataDto selectfollow(int userno) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		UserDataDto res = null;		
		
		String sql = "  ";
		
		return null;
	}
	
	//마이페이지(follow unfollow 기능)
	public boolean followChk() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		UserDataDto res = null;
		
		String sql = "  ";
		
		return false;
	}
	
	//설정(내 정보 조회)
	public UserDataDto selectUser(int userno) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		UserDataDto res = null;
		
		String sql =" SELECT * FROM USERDATA WHERE USERNO=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, userno);
			System.out.println("03. query 준비 : " + sql);
			
			rs = pstm.executeQuery(); 
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				res = new UserDataDto();
				res.setUserno(rs.getInt(1));
				res.setUserid(rs.getString(2));
				res.setUserpw(rs.getString(3));
				res.setUsername(rs.getString(4));
				res.setUseraddr(rs.getString(5));
				res.setUserphone(rs.getString(6));
				res.setUseremail(rs.getString(7));
				res.setUserenabled(rs.getString(8));
				res.setUserrole(rs.getString(9));
				res.setUserfollow(rs.getInt(10));
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료 \n");

		}
		
		return res;
	}
	
	//설정(내 정보 수정)
	public boolean updateUser(UserDataDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " UPDATE USERDATA SET USERNAME=?, USEREMAIL=?, USERADDR=? WHERE USERNO=?" ;
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getUsername());
			pstm.setString(2, dto.getUseremail());
			pstm.setString(3, dto.getUseraddr());
			pstm.setInt(4, dto.getUserno());
			System.out.println("03. query 준비: "+sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
			if(res>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		return (res>0)?true:false;
	}
	
	//설정(회원 탈퇴)
	public boolean deleteUser(int userno) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " UPDATE USERDATA SET USERENABLED='N' WHERE USERNO=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, userno);
			System.out.println("03. query 준비: "+sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
			if(res>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		return (res>0)?true:false;
	}
	
	//설정(전체 공지사항 보기)
	public List<UserDataDto> selectAllNotice(){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<UserDataDto> res = new ArrayList<UserDataDto>();

		// 테이블 조인해서 유저권한 manager, ADMIN인 사람의 글만 보일 수 있게 쿼리문 작성
		String sql = " SELECT * FROM USERCONTENT " + " JOIN USERDATA ON(USERCONTENT.USERIDNO = USERDATA.USERNO) "
				+ " WHERE USERROLE='ADMIN' OR USERROLE='MANAGER' ORDER BY BOARDNO DESC ";

		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비 " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			while (rs.next()) {
				UserDataDto dto = new UserDataDto();
				dto.setBoardno(rs.getInt(1));
				dto.setTitle(rs.getString(4));
				dto.setRegdate(rs.getDate(9));
				dto.setUsername(rs.getString(13));
				res.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}

		return res;
	}
	
	//설정(공지사항_1개 선택)
	public UserDataDto selectOneNotice(int boardno) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		UserDataDto res = new UserDataDto();

		String sql = " SELECT * FROM USERCONTENT JOIN USERDATA ON(USERCONTENT.USERIDNO = USERDATA.USERNO) WHERE BOARDNO=? ";
		

		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, boardno);
			System.out.println("03. query 준비 " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			while (rs.next()) {
				res.setBoardno(rs.getInt(1));
				res.setTitle(rs.getString(4));
				res.setContent(rs.getString(5));
				res.setRegdate(rs.getDate(9));
				res.setUsername(rs.getString(13));
				
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();

		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}

		return res;
	}
	
	public int insertNotice(UserDataDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;

		String sql = " INSERT INTO USERCONTENT VALUES(BOARDNOSQ.NEXTVAL," + " GROUPNOSQ.NEXTVAL, 1, ?, ?, ?,"
		// GROUPNO, GROUPSQ,TITLE,CONTENT,USERIDNO
				+ " NULL, 0, SYSDATE) ";
		// USERIMGNAME,USERLIKE,REGDATE

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setInt(3, dto.getUserno());
			System.out.println("03. query 준비 " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			if (res > 0) {
				commit(con);
			}

		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}

		return res;
	}
	
	public int updateNotice(UserDataDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;

		String sql = " UPDATE USERCONTENT SET TITLE=?, CONTENT=? WHERE BOARDNO=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setInt(3, dto.getBoardno());
			System.out.println("03. query 준비 " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	
	public int deleteNotice(int boardno) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;

		String sql = " DELETE FROM USERCONTENT WHERE BOARDNO=? ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, boardno);
			System.out.println("03. query 준비 " + sql);

			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}

		return res;
	}
	

	public List<UserDataDto> selectSearchMembers(String select, String findtextbox) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<UserDataDto> res = new ArrayList<UserDataDto>();
		String kw = "";
		System.out.println(select);
		
		if(select.equals("id")) {
			//select로 컬럼이름
			kw = "USERID";
			System.out.println(select);
			
		}else if(select.equals("name")) {
			kw = "USERNAME";
			System.out.println(select);
			
		}else if(select.equals("address")) {
			kw = "USERADDR";
			System.out.println(select);
			
		}else if(select.equals("email")) {
			kw = "USEREMAIL";
			System.out.println(select);
			
		}else if(select.equals("userphone")) {
			kw = "USERPHONE";
			System.out.println(select);
			
		}else if(select.equals("userenabled")) {
			kw = "USERENABLED";
			System.out.println(select);
			
		}else if(select.equals("userrole")) {
			kw = "USERROLE";
			System.out.println(select);
		}
		
		String sql = " SELECT * FROM USERDATA WHERE "+kw
				+" LIKE \'%" +findtextbox+ "%\'"
				+" ORDER BY USERNO DESC ";
				//SELECT * FROM USERDATA WHERE ?(컬럼이름) LIKE "%?%";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비 " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				UserDataDto tmp = new UserDataDto();
				tmp.setUserno(rs.getInt(1));
				tmp.setUserid(rs.getString(2));
				tmp.setUserpw(rs.getString(3));
				tmp.setUsername(rs.getString(4));
				tmp.setUseraddr(rs.getString(5));
				tmp.setUserphone(rs.getString(6));
				tmp.setUseremail(rs.getString(7));
				tmp.setUserenabled(rs.getString(8));
				tmp.setUserrole(rs.getString(9));
				
				res.add(tmp);
			}
			
		
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	
	public static UserDataDao getInstance() {
		return instance;
	}

	public UserDataDto selectOneContent(int num) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		UserDataDto res = null;
		
		String sql = " SELECT * FROM USERCONTENT WHERE BOARDNO=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비: " + sql);
			
			pstm.setInt(1, num);
			
			rs = pstm.executeQuery();
			System.out.println("04. queery 준비 및 실행");
			
			if(rs.next()) {
				res = new UserDataDto(
						rs.getInt(1),
						rs.getInt(2),
						rs.getInt(3),
						rs.getString(4),
						rs.getString(5),
						rs.getInt(6),
						rs.getString(7),
						rs.getInt(8),
						rs.getDate(9)
						);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료 \n");
		}
		
		return res;
	}

	public ArrayList<UserDataDto> mainselectAllContent() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		ArrayList<UserDataDto> res = new ArrayList<UserDataDto>();
		
		String sql = " SELECT * FROM USERCONTENT ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비: "+sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");
			
			while(rs.next()) {
				res.add(new UserDataDto(rs.getInt(1),
					rs.getInt(2),
					rs.getInt(3),
					rs.getString(4),
					rs.getString(5),
					rs.getInt(6),
					rs.getString(7),
					rs.getInt(8),
					rs.getDate(9)
						)
					);
				
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료\n");
		}
		
		return res;
	}
	
	
	
}
	
	
	
