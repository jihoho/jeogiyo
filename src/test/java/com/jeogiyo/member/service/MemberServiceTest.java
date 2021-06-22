package com.jeogiyo.member.service;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.jeogiyo.common.util.SHA256Util;
import com.jeogiyo.member.dao.MemberDAO;
import com.jeogiyo.member.dto.MemberSaveDto;
import com.jeogiyo.member.dto.MemberUpdateDto;
import com.jeogiyo.member.dto.SessionMember;
import com.jeogiyo.member.exception.MemberNotFoundException;
import com.jeogiyo.member.vo.MemberVO;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.Captor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

/**
 * Created by IntelliJ IDEA
 * User: hojun
 * Date: 2021-06-21 Time: 오후 6:36
 */

@ExtendWith(MockitoExtension.class)
class MemberServiceTest {

    @InjectMocks
    private MemberServiceImpl memberService;

    @Mock
    private MemberDAO memberDAO;

    @Mock
    private HttpSession session;

    @Captor
    ArgumentCaptor<MemberVO> argumentCaptor;

    @Captor
    ArgumentCaptor<Map<String, String>> mapArgumentCaptor;

    @Captor
    ArgumentCaptor<String> nameArgumentCaptor;

    @Captor
    ArgumentCaptor<Object> valueArgumentCaptor;

    @Test
    @DisplayName("회원 가입")
    void save_member() throws Exception {
        // given
        MemberSaveDto memberSaveDto = givenMemberSaveDto();
        // when
        memberService.saveMember(memberSaveDto);
        // then
        verify(memberDAO, times(1)).insertNewMember(argumentCaptor.capture());
        assertAll(
                () -> assertEquals(argumentCaptor.getValue().getId(), memberSaveDto.getMemberId()),
                () -> assertEquals(argumentCaptor.getValue().getType(),
                        memberSaveDto.getMemberType()),
                () -> assertEquals(argumentCaptor.getValue().getNickname(),
                        memberSaveDto.getNickname()),
                () -> assertEquals(argumentCaptor.getValue().getHp(), memberSaveDto.getHp()),
                () -> assertEquals(argumentCaptor.getValue().getPw(), memberSaveDto.getMemberPw())
        );
    }

    @Test
    @DisplayName("회원 로그인 성공")
    void login_member_success() throws Exception {
        // given
        MemberVO memberVO = givenMember();
        when(memberDAO.selectMemberSaltByIdAndType(any(), any())).thenReturn(memberVO.getSalt());
        when(memberDAO.selectMemberByIdAndTypeAndPw(any())).thenReturn(memberVO);
        HashMap<String, String> params = givenLoginParams(memberVO.getId(), memberVO.getType(),
                "1234");
        // when
        memberService.login(params);
        // then
        verify(memberDAO, times(1)).selectMemberByIdAndTypeAndPw(mapArgumentCaptor.capture());
        verify(session, times(2))
                .setAttribute(nameArgumentCaptor.capture(), valueArgumentCaptor.capture());

        List<String> nameArgList = nameArgumentCaptor.getAllValues();
        List<Object> valueArgList = valueArgumentCaptor.getAllValues();

        assertAll(
                () -> assertEquals(params.get("member_id"),
                        mapArgumentCaptor.getValue().get("member_id")),
                () -> assertEquals(params.get("member_type"),
                        mapArgumentCaptor.getValue().get("member_type")),
                () -> assertEquals(params.get("member_pw"),
                        mapArgumentCaptor.getValue().get("member_pw")),
                () -> assertEquals("isLogOn", nameArgList.get(0)),
                () -> assertTrue((Boolean) valueArgList.get(0)),
                () -> assertEquals("memberInfo", nameArgList.get(1)),
                () -> assertEquals(SessionMember.createSessionMember(memberVO), valueArgList.get(1))
        );
    }

    @Test
    @DisplayName("회원 아아디 존재하지 않아 로그인 실패")
    void login_member_fail_by_none_id() throws Exception {
        // given
        MemberVO memberVO = givenMember();
        when(memberDAO.selectMemberSaltByIdAndType(any(), any())).thenReturn(null);
        // when(memberDAO.selectMemberByIdAndTypeAndPw(any())).thenReturn(null);
        HashMap<String, String> params = givenLoginParams(memberVO.getId(), memberVO.getType(),
                "1234");
        // when
        assertThrows(MemberNotFoundException.class, () -> memberService.login(params));
    }

    @Test
    @DisplayName("회원 비밀번호 불일치로 로그인 실패")
    void login_member_fail_by_not_match_pass() throws Exception {
        // given
        MemberVO memberVO = givenMember();
        when(memberDAO.selectMemberSaltByIdAndType(any(), any())).thenReturn(memberVO.getSalt());
        when(memberDAO.selectMemberByIdAndTypeAndPw(any())).thenReturn(null);
        HashMap<String, String> params = givenLoginParams(memberVO.getId(), memberVO.getType(),
                "1234");
        // when
        assertThrows(MemberNotFoundException.class, () -> memberService.login(params));
    }

    @Test
    @DisplayName("회원 정보 수정")
    void modify_member() throws Exception {
        // given
        MemberUpdateDto memberUpdateDto = givenMemberUpdateDto();

        // when
        memberService.updateMember(memberUpdateDto);
        // then
        verify(memberDAO, times(1)).updateMemberByIdAndType(argumentCaptor.capture());
        verify(session, times(2))
                .setAttribute(nameArgumentCaptor.capture(), valueArgumentCaptor.capture());

        List<String> nameArgList = nameArgumentCaptor.getAllValues();
        List<Object> valueArgList = valueArgumentCaptor.getAllValues();

        assertAll(
                () -> assertEquals(memberUpdateDto.getMemberId(),
                        argumentCaptor.getValue().getId()),
                () -> assertEquals(memberUpdateDto.getMemberType(),
                        argumentCaptor.getValue().getType()),
                () -> assertEquals(memberUpdateDto.getMemberPw(),
                        argumentCaptor.getValue().getPw()),
                () -> assertEquals(memberUpdateDto.getHp(),
                        argumentCaptor.getValue().getHp()),
                () -> assertEquals(memberUpdateDto.getNickname(),
                        argumentCaptor.getValue().getNickname()),
                () -> assertEquals(memberUpdateDto.getSalt(),
                        argumentCaptor.getValue().getSalt()),
                () -> assertEquals("isLogOn", nameArgList.get(0)),
                () -> assertTrue((Boolean) valueArgList.get(0)),
                () -> assertEquals("memberInfo", nameArgList.get(1)),
                () -> assertEquals(SessionMember.createSessionMember(memberUpdateDto.toVo()),
                        valueArgList.get(1))
        );
    }


    private HashMap<String, String> givenLoginParams(String id, String type, String pw) {
        HashMap<String, String> params = new HashMap<>();
        params.put("member_id", id);
        params.put("member_type", type);
        params.put("member_pw", pw);
        return params;
    }


    private MemberVO givenMember() {
        String salt = SHA256Util.generateSalt();
        String encryptPass = SHA256Util.getEncrypt("1234", salt);
        return MemberVO.builder()
                .id("tester")
                .pw(encryptPass)
                .type("NORMAL")
                .nickname("test-nick")
                .hp("01012341234")
                .salt(salt).build();
    }

    private MemberSaveDto givenMemberSaveDto() {
        MemberSaveDto memberSaveDto = new MemberSaveDto();
        memberSaveDto.setMemberId("tester");
        memberSaveDto.setMemberType("NORMAL");
        memberSaveDto.setNickname("test-nick");
        memberSaveDto.setMemberPw("1234");
        memberSaveDto.setHp("01012341234");
        return memberSaveDto;
    }

    private MemberUpdateDto givenMemberUpdateDto() {
        MemberUpdateDto memberUpdateDto = new MemberUpdateDto();
        memberUpdateDto.setMemberId("tester");
        memberUpdateDto.setMemberType("NORMAL");
        memberUpdateDto.setMemberPw("1111");
        memberUpdateDto.setNickname("update-nick");
        memberUpdateDto.setHp("01011111111");
        return memberUpdateDto;
    }
}