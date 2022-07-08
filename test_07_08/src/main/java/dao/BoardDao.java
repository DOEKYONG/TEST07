package dao;

import dto.MemberDto;

public class BoardDao extends Dao{
	
	public BoardDao() {
		super(); 
	}
	
	public static BoardDao boardDao = new BoardDao();
	public static BoardDao getBoardDao() { return boardDao; }
	

	public boolean write(MemberDto board) {
		String sql = "insert into member_tbl_02(custname,phone,address,grade,city) values(?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			
		}catch (Exception e) {System.out.println("쓰기오류" + e);}
		
		return false;
	}
}
