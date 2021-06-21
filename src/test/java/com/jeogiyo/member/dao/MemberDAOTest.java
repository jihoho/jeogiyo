package com.jeogiyo.member.dao;

import com.jeogiyo.common.util.SHA256Util;
import com.jeogiyo.member.vo.MemberVO;
import java.util.HashMap;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Created by IntelliJ IDEA
 * User: hojun
 * Date: 2021-06-21 Time: 오후 4:19
 */

@MybatisTest
class MemberDAOTest {

    @Autowired
    MemberDAO memberDAO;

    MemberVO savedMember;

    @BeforeEach
    void save_init_member() throws Exception {
        savedMember = givenMember();
        memberDAO.insertNewMember(savedMember);
    }

    @Test
    @DisplayName("회원 등록 및 조회")
    void save_and_find_member() throws Exception {
        // given
        HashMap<String, String> params = new HashMap<>();
        params.put("member_id", savedMember.getId());
        params.put("member_type", savedMember.getType());
        params.put("member_pw", savedMember.getPw());
        // then
        assertEquals(savedMember, memberDAO
                .selectMemberByIdAndTypeAndPw(params));
    }

    @Test
    @DisplayName("회원 아이디 중복 체크")
    void check_unique_member_id() throws Exception {
        // given
        String memberId = savedMember.getId();
        String memberType = "NORMAL";
        // then
        assertEquals("true", memberDAO.selectOverlappedID(memberId, memberType));
    }

    @Test
    @DisplayName("회원 수정")
    void update_member() throws Exception {
        // given
        MemberVO updateMember = savedMember;
        updateMember.setNickname("updated-nick");
        updateMember.setHp("01011111111");
        HashMap<String, String> params = new HashMap<>();
        params.put("member_id", updateMember.getId());
        params.put("member_type", updateMember.getType());
        params.put("member_pw", updateMember.getPw());
        // when
        memberDAO.updateMemberByIdAndType(updateMember);
        // then
        assertEquals(updateMember, memberDAO.selectMemberByIdAndTypeAndPw(params));
    }

    @Test
    @DisplayName("회원의 salt 값 조회")
    void find_member_salt() throws Exception{
        // given
        String expectedSalt=savedMember.getSalt();
        // then
        assertEquals(expectedSalt,memberDAO.selectMemberSaltByIdAndType(savedMember.getId(),savedMember.getType()));
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

}