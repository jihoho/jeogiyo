package com.jeogiyo.member.service;

import com.jeogiyo.member.vo.MemberVO;

import java.util.Map;

public interface MemberService {
    public String overlapped(Map<String,String> idMap) throws Exception;

    public void addMember(MemberVO memberVO) throws Exception;

    public MemberVO login(Map<String, String> loginMap) throws  Exception;

    public void modifyMember(MemberVO memberVO) throws Exception;

    public String getMemberSaltByIdAndType(String member_id,String member_type) throws Exception;

    public void modifyMemberExcludePw(MemberVO memberVO) throws Exception;
}
