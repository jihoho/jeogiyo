package com.jeogiyo.member.service;

import com.jeogiyo.member.exception.InvalidLogoutException;
import com.jeogiyo.member.vo.MemberVO;

import java.util.Map;
import javax.servlet.http.HttpSession;

public interface MemberService {
    String overlapped(Map<String,String> idMap) throws Exception;

    void addMember(MemberVO memberVO) throws Exception;

    void login(Map<String, String> loginMap, HttpSession session) throws  Exception;

    void logout(HttpSession session) throws InvalidLogoutException;

    void modifyMember(MemberVO memberVO) throws Exception;

    String getMemberSaltByIdAndType(String memberId,String memberType) throws Exception;

    void modifyMemberExcludePw(MemberVO memberVO) throws Exception;
}
