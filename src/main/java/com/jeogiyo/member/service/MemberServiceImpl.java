package com.jeogiyo.member.service;


import com.jeogiyo.member.dao.MemberDAO;
import com.jeogiyo.member.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

    @Autowired
    private MemberDAO memberDAO;

    @Override
    public String overlapped(String id) throws Exception{
        System.out.println("call service overlapped id :" +id);
        String result =memberDAO.selectOverlappedID(id);
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
