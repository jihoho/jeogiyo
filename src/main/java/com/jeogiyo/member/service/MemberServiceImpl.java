package com.jeogiyo.member.service;


import com.jeogiyo.common.util.SHA256Util;
import com.jeogiyo.member.dao.MemberDAO;
import com.jeogiyo.member.dto.MemberInfoDto;
import com.jeogiyo.member.exception.MemberNotFoundException;
import com.jeogiyo.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDAO memberDAO;

    @Override
    public MemberInfoDto login(Map<String, String> loginMap) throws Exception {
        String salt = getMemberSaltByIdAndType(loginMap.get("member_id"),
                loginMap.get("member_type"));

        loginMap.put("member_pw", SHA256Util.getEncrypt(loginMap.get("member_pw"), salt));
        MemberVO memberVO = memberDAO.login(loginMap);
        if (memberVO == null) {
            throw new MemberNotFoundException();
        }
        return MemberInfoDto.createMemberInfoDto(memberVO);
    }

    @Override
    public String overlapped(Map idMap) throws Exception{
        System.out.println("call service overlapped id :" +idMap.get("id"));
        String result =memberDAO.selectOverlappedID(idMap);
        System.out.println("result: "+result);
        return result;
    }

    @Override
    public void addMember(MemberVO memberVO) throws Exception{
        System.out.println("service:addmember");
        System.out.println(memberVO);
        memberDAO.insertNewMember(memberVO);
    }

    @Override
    public void modifyMember(MemberVO memberVO) throws Exception{
        memberDAO.updateMemberByIdAndType(memberVO);
    }

    @Override
    public void modifyMemberExcludePw(MemberVO memberVO) throws Exception {
        memberDAO.updateMemberByIdAndTypeExcludePw(memberVO);
    }

    @Override
    public String getMemberSaltByIdAndType(String memberId, String memberType) throws Exception {
        System.out.println(memberId + ", " + memberType);
        String salt = memberDAO.selectMemberSaltByIdAndType(memberId, memberType);
        if (salt == null) {
            throw new MemberNotFoundException();
        }
        return salt;
    }


}
