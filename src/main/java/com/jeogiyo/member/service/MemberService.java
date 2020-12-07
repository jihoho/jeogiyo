package com.jeogiyo.member.service;

import com.jeogiyo.member.vo.MemberVO;

public interface MemberService {
    public String overlapped(String id) throws Exception;

    public void addMember(MemberVO memberVO) throws Exception;
}
