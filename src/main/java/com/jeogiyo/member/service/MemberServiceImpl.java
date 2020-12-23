package com.jeogiyo.member.service;


import com.jeogiyo.member.dao.MemberDAO;
import com.jeogiyo.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService{

    @Autowired
    private MemberDAO memberDAO;

    @Override
    public MemberVO login(Map<String, String> loginMap) throws Exception {
        return memberDAO.login(loginMap);
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
}
