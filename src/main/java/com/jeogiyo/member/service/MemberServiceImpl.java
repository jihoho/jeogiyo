package com.jeogiyo.member.service;

import com.jeogiyo.common.util.SHA256Util;
import com.jeogiyo.member.dao.MemberDAO;
import com.jeogiyo.member.dto.SessionMember;
import com.jeogiyo.member.dto.MemberSaveDto;
import com.jeogiyo.member.dto.MemberUpdateDto;
import com.jeogiyo.member.exception.InvalidLogoutException;
import com.jeogiyo.member.exception.MemberNotFoundException;
import com.jeogiyo.member.vo.MemberVO;
import javax.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

    private final MemberDAO memberDAO;

    private final HttpSession session;

    @Override
    public void login(Map<String, String> params) throws Exception {
        String salt = getMemberSaltByIdAndType(params.get("member_id"),
                params.get("member_type"));
        params.put("member_pw", SHA256Util.getEncrypt(params.get("member_pw"), salt));
        MemberVO memberVO = memberDAO.selectMemberByIdAndTypeAndPw(params);
        if (memberVO == null) {
            throw new MemberNotFoundException();
        }
        saveLoginInfoInSession(memberVO);
    }

    private void saveLoginInfoInSession(MemberVO memberVO) {
        session.setAttribute("isLogOn", true);
        session.setAttribute("memberInfo", SessionMember.createSessionMember(memberVO));
    }

    @Override
    public void logout() throws InvalidLogoutException {
        boolean isLogOn = (boolean) session.getAttribute("isLogOn");
        if (!isLogOn) {
            throw new InvalidLogoutException();
        }
        session.setAttribute("isLogOn", false);
        session.removeAttribute("memberInfo");
    }

    @Override
    public String overlapped(String memberId, String memberType) throws Exception {
        return memberDAO.selectOverlappedID(memberId, memberType);
    }

    @Override
    public void saveMember(MemberSaveDto memberSaveDto) throws Exception {
        memberSaveDto.setSalt(SHA256Util.generateSalt());
        memberSaveDto.setMemberPw(
                SHA256Util.getEncrypt(memberSaveDto.getMemberPw(), memberSaveDto.getSalt()));
        memberDAO.insertNewMember(memberSaveDto.toVo());
    }

    @Override
    public void updateMember(MemberUpdateDto memberUpdateDto)
            throws Exception {
        if (memberUpdateDto.getMemberPw() != null && memberUpdateDto.getMemberPw() != "") {
            String salt = SHA256Util.generateSalt();
            memberUpdateDto.setSalt(salt);
            memberUpdateDto.setMemberPw(SHA256Util.getEncrypt(memberUpdateDto.getMemberPw(), salt));
        }
        MemberVO memberVO = memberUpdateDto.toVo();
        memberDAO.updateMemberByIdAndType(memberVO);
        saveLoginInfoInSession(memberVO);

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
