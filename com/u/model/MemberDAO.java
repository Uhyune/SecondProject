package com.servlet.u.model;

import org.apache.ibatis.session.SqlSession;

import com.servlet.u.mybatis.DBService;


public class MemberDAO {
	//회원가입
	public void insert(MemberVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.insert("bc.sign",vo);
		ss.close();
	}
	
	//이메일 중복 체크
	public boolean checkemail(MemberVO vo) {
			SqlSession ss = DBService.getFactory().openSession();
			MemberVO member = ss.selectOne("bc.email", vo);
			ss.close();
			if(member==null) {
				return false;
			}else{
				return true;
			}
			
		}
	//아이디 중복 체크
	public int checkId(String userID) {
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO member = ss.selectOne("bc.read", userID);
		ss.close();
		if(member==null) {
			return 0;
		}else{
			return 1;
		}
	}

	public MemberVO getInfo(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO list = ss.selectOne("read", id);
		ss.close();
		return list;
	}
	
	//로그인 
	public MemberVO login(MemberVO vo) {
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO member = ss.selectOne("bc.login", vo);
		ss.close();
		return member;
	}

	//탈퇴
	public void deletemember(String id) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.delete("bc.deletemember",id);
		ss.close();
	}

	public void updateMember(MemberVO memberVO) {
		SqlSession session = DBService.getFactory()
									  .openSession(true);
		session.update("bc.update", memberVO);
		session.close();
	}
}
