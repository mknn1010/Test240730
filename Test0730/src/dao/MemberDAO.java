package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.MemberDTO;

public class MemberDAO {
	Connection getConnection() throws Exception { 
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId="test0730";
		String dbPw="pass1234";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, dbId, dbPw);
		
		return conn;
	}
		public boolean loginCheck(String id, String pw) throws Exception {
			Connection conn = getConnection();
			int result = 0;
			String sql = "SELECT COUNT(*) FROM member WHERE id=? AND pw=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs=null;
			try {
				pstmt.setString(1, id);
				pstmt.setString(2, pw);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					result = rs.getInt(1);
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
			rs.close();
			pstmt.close();
			conn.close();
			
			return result==1;
		}
		
		public MemberDTO getMemberById(String id) throws Exception {
			String sql = "SELECT * FROM member WHERE id=?";
			Connection conn = getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = null;
			MemberDTO dto = null;
			
			try {
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					String pw = rs.getString("PW");
					String name = rs.getString("NAME");
					int point = rs.getInt("POINT");
					dto = new MemberDTO(id, pw, name, point);
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
			rs.close();
			pstmt.close();
			conn.close();
			
			return dto;
		}
		
		public ArrayList<MemberDTO> getMemberInfoAll() throws Exception {
			Connection conn = getConnection();
			String sql = "SELECT * FROM member ORDER BY id";
			ArrayList<MemberDTO> listRet = new ArrayList<MemberDTO>();
			
			PreparedStatement pstmt= conn.prepareStatement(sql);
			ResultSet rs = null;
			try {
				rs = pstmt.executeQuery();
				while(rs.next()) {
					String id = rs.getString("ID");
					String pw = rs.getString("PW");
					String name= rs.getString("NAME");
					int point = rs.getInt("POINT");
					MemberDTO dto = new MemberDTO(id, pw, name, point);
					listRet.add(dto);
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
			rs.close();
			pstmt.close();
			conn.close();
			
			return listRet;
		}
		
		public void signUpNewMember(String id, String pw, String name) throws Exception {
			Connection conn = getConnection();
			String sql = "INSERT INTO member VALUES(?, ?, ?, 1000)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			try {
				pstmt.setString(1, id);
				pstmt.setString(2, pw);
				pstmt.setString(3, name);
				pstmt.executeUpdate();
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			pstmt.close();
			conn.close();
		}
		
		public void updateMember(String id, String pw, String name, int point) throws Exception {
			Connection conn = getConnection();
			String sql = "UPDATE MEMBER SET PW=?, NAME=?, POINT=? WHERE ID=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			try {
				pstmt.setString(1, pw);
				pstmt.setString(2, name);
				pstmt.setInt(3, point);
				pstmt.setString(4, id);
				pstmt.executeUpdate();
				
			} catch(Exception e) {
				e.printStackTrace();
			}

			pstmt.close();
			conn.close();
		}
		
		public void deleteMember(String id) throws Exception {
			Connection conn = getConnection();
			String sql = "DELETE FROM member WHERE id=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			try {
				pstmt.setString(1, id);
				pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			}

			pstmt.close();
			conn.close();
		}
}
