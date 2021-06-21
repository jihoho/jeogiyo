package com.jeogiyo.member.service;

import com.jeogiyo.member.dto.MemberSaveDto;
import com.jeogiyo.member.dto.MemberUpdateDto;
import com.jeogiyo.member.exception.InvalidLogoutException;

import java.util.Map;

public interface MemberService {
    String overlapped(String memberId, String memberType) throws Exception;

    void saveMember(MemberSaveDto memberSaveDto) throws Exception;

    void login(Map<String, String> loginMap) throws  Exception;

    void logout() throws InvalidLogoutException;

    String getMemberSaltByIdAndType(String memberId,String memberType) throws Exception;

    void updateMember(MemberUpdateDto memberUpdateDto) throws Exception;
}
