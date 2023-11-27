package com.java.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.java.www.dto.BoardDto;

public class BoardDao {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	BoardDto bdto;
	ArrayList<BoardDto> list = new ArrayList<BoardDto>();
	int bno, bgroup, bstep, bindent, bhit;
	String btitle, bcontent, id, bfile, query="";
	Timestamp bdate;
	int result, listCount;
	

	//커넥션풀
	public Connection getConnection() {
		Connection connection = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Oracle18");
			connection = ds.getConnection();
		} catch (Exception e) { e.printStackTrace();
		}
		return connection;
	}//Connection

	//게시글 가져오기.
	public ArrayList<BoardDto> n_listSelect(int startRow, int endRow) {
		try {
			conn = getConnection();
			query = "select * from (select row_number() over(order by bgroup desc, bstep asc) rnum, a.* from board a) where rnum between ? and ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bno = rs.getInt("bno");
				btitle = rs.getString("btitle");
				bcontent = rs.getString("bcontent");
				bdate = rs.getTimestamp("bdate");
				id = rs.getString("id");
				bgroup = rs.getInt("bgroup");
				bstep = rs.getInt("bstep");
				bindent = rs.getInt("bindent");
				bhit = rs.getInt("bhit");
				bfile = rs.getString("bfile");
				list.add(new BoardDto(bno, btitle, bcontent, bdate, id, bgroup, bstep, bindent, bhit, bfile));
			}
		} catch (Exception e) {	e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) { e2.printStackTrace();}
		}
		return list;
	}//n_listSelect

	//게시글 전체개수
	public int nListCount() {
		try {
			conn = getConnection();
			query = "select count(*) listCount from board";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				listCount = rs.getInt("listCount");
				System.out.println("nListCount : "+listCount);
			}
		} catch (Exception e) {	e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) { e2.printStackTrace();}
		}
		return listCount;
	}//nListCount

	//게시글 1개 가져오기
	public BoardDto selectOne(int bno2) {
		try {
			conn = getConnection();
			query = "select * from board where bno=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bno2);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bno = rs.getInt("bno");
				btitle = rs.getString("btitle");
				bcontent = rs.getString("bcontent");
				bdate = rs.getTimestamp("bdate");
				id = rs.getString("id");
				bgroup = rs.getInt("bgroup");
				bstep = rs.getInt("bstep");
				bindent = rs.getInt("bindent");
				bhit = rs.getInt("bhit");
				bfile = rs.getString("bfile");
				bdto = new BoardDto(bno, btitle, bcontent, bdate, id, bgroup, bstep, bindent, bhit, bfile);
			}
		} catch (Exception e) {	e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) { e2.printStackTrace();}
		}
		return bdto;
	}//BoardDto

	//게시글 1개 저장
	public int insert(BoardDto bdto2) {
		try {
			conn = getConnection();
			query = "insert into board values(board_seq.nextval,?,?,sysdate,?,board_seq.currval,0,0,1,?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bdto2.getBtitle());
			pstmt.setString(2, bdto2.getBcontent());
			pstmt.setString(3, bdto2.getId());
			pstmt.setString(4, bdto2.getBfile());
			result = pstmt.executeUpdate();
		} catch (Exception e) {	e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) { e2.printStackTrace();}
		}
		return result;
	}//insert

	//답글달기를 위한 step증가
	public void stepUp(int bgroup2, int bstep2) {
		try {
			conn = getConnection();
			query = "updage board set bstep=bstep+1 where bgroup=? and bstep>?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bgroup2);
			pstmt.setInt(2, bstep2);
			result = pstmt.executeUpdate();
		} catch (Exception e) {	e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) { e2.printStackTrace();}
		}
	}//stepUp

	//답글달기 저장
	public int replyInsert(BoardDto bdto2) {
		try {
			conn = getConnection();
			query = "insert into board values(board_seq.nextval,?,?,sysdate,?,?,?,?,1,?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bdto2.getBtitle());
			pstmt.setString(2, bdto2.getBcontent());
			pstmt.setString(3, bdto2.getId());
			pstmt.setInt(4, bdto2.getBgroup());     //부모 그대로 사용
			pstmt.setInt(5, bdto2.getBstep()+1);    //부모보다 1증가
			pstmt.setInt(6, bdto2.getBindent()+1);  //부모보다 1증가
			pstmt.setString(7, bdto2.getBfile());
			result = pstmt.executeUpdate();
		} catch (Exception e) {	e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) { e2.printStackTrace();}
		}
		return result;
	}//replyInsert

}
