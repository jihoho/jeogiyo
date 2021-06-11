package com.jeogiyo.member.service;

import com.jeogiyo.member.dto.MemberInfoDto;
import com.jeogiyo.member.vo.MemberVO;

import java.util.Map;

public interface MemberService {
    String overlapped(Map<String,String> idMap) throws Exception;

    void addMember(MemberVO memberVO) throws Exception;

    MemberInfoDto login(Map<String, String> loginMap) throws  Exception;

    void modifyMember(MemberVO memberVO) throws Exception;

    String getMemberSaltByIdAndType(String memberId,String memberType) throws Exception;

    void modifyMemberExcludePw(MemberVO memberVO) throws Exception;
}
