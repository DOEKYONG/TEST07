package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.MemberDto;

public class Dao {

	protected Connection con; // 패키지가 달라도 상속받으면 접근가능
	// public, private,protected,default
protected PreparedStatement ps; // db조작 인터페이스
protected ResultSet rs; // db결과 인터페이스
public Dao() {

	try { 
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test7?serverTimezone=UTC",
	"root","1234");
	System.out.println("연동 성공 ");
	}catch(Exception e ){ System.out.println("연동 실패 "+e);}
	}

public int get마지막번호() {
	String sql = "select max(custno) from member_tbl_02";
	try {
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		if(rs.next()) {
			return rs.getInt(1);
		}
	}catch(Exception e) {}
	return 0;
}

public boolean 저장(MemberDto dto) {
	String sql = "insert into member_tbl_02 values(?,?,?,?,?,?,?)";
	try {
		ps = con.prepareStatement(sql);
		ps.setInt(1, dto.getCustno());
		ps.setString(2, dto.getCustname());
		ps.setString(3, dto.getPhone());
		ps.setString(4, dto.getAddress());
		ps.setString(5, dto.getJoindate());
		ps.setString(6, dto.getGrade());
		ps.setString(7, dto.getCity());
		ps.executeUpdate();
		return true;
		
	}catch (Exception e) {
		System.out.println("오류"+ e);
	}
	return false;
}

public ArrayList<MemberDto> 모든호출(){
	ArrayList<MemberDto> list = new ArrayList<>();
	String sql = "select * from member_tbl_02";
	try {
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()) {
			
			MemberDto dto = new MemberDto(rs.getInt(1),
					rs.getString(2),
					rs.getString(3),
					rs.getString(4),
					rs.getString(5),
					rs.getString(6),
					rs.getString(7));
			list.add(dto);
		}
		
	}catch (Exception e) {
		System.out.println("출력오류 " + e);
		
	}return list;
	
}
public MemberDto 개별호출(int custno) {
	
	String sql = "select * from member_tbl_02 where custno="+custno;
	try {
		ps =con.prepareStatement(sql);
		rs = ps.executeQuery();
		if(rs.next()) {
			MemberDto dto = new MemberDto(rs.getInt(1),
					rs.getString(2),
					rs.getString(3),
					rs.getString(4),
					rs.getString(5),
					rs.getString(6),
					rs.getString(7));
			return dto;
			
		}
		
	}catch (Exception e) {System.out.println("개별조회" + e);	}
	return null;
}

public boolean 수정(MemberDto dto) {
	String sql = "update member_tbl_02 set custname = ? ,phone = ? ,address = ? ,joindate = ? ,grade = ? , city = ? where custno = ?";
	try {
		ps = con.prepareStatement(sql);
		ps.setString(1, dto.getCustname());
		ps.setString(2, dto.getPhone());
		ps.setString(3, dto.getAddress());
		ps.setString(4, dto.getJoindate());
		ps.setString(5, dto.getGrade());
		ps.setString(6, dto.getCity());
		ps.setInt(7, dto.getCustno());
		ps.executeUpdate();
		return true;
	} catch (Exception e) {System.out.println("수정오류" +e );}
	
	return false;
}

public ArrayList<MemberDto> 매출조회(){
	ArrayList<MemberDto> list = new ArrayList<>();
	String sql = "select A.custno, A.custname, A.grade, sum(B.price) from member_tbl_02 A join money_tbl_02 B on A.custno = B.custno group by (A.custno) order by sum(B.price) desc";
	try {
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()) {
			MemberDto memberDto = new MemberDto();
			memberDto.setCustno(rs.getInt(1));
			memberDto.setCustname(rs.getString(2));
			memberDto.setGrade(rs.getString(3));
			memberDto.setSumprice(rs.getInt(4));
			list.add(memberDto);
			
		}
		
	} catch (Exception e) {System.out.println("매출" +e );}
	
	return list;

}

}
