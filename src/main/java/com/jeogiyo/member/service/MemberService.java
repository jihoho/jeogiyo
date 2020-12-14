package com.jeogiyo.member.service;

import com.jeogiyo.member.vo.MemberVO;

import java.util.Map;

public interface MemberService {
    public String overlapped(Map<String,String> idMap) throws Exception;

    public void addMember(MemberVO memberVO) throws Exception;

    public MemberVO login(Map<String, String> loginMap) throws  Exception;
}
