package com.jeogiyo.member.dto;

import com.jeogiyo.member.vo.MemberVO;
import lombok.Getter;
import lombok.Setter;

/**
 * Created by IntelliJ IDEA
 * User: hojun
 * Date: 2021-06-15 Time: 오후 8:27
 */

@Getter
@Setter
public class MemberSaveDto {

    private String memberId;
    private String memberPw;
    private String memberType;
    private String nickname;
    private String hp;
    private String salt;

    public MemberVO toVo() {
        return MemberVO.builder()
                .id(memberId)
                .pw(memberPw)
                .type(memberType)
                .nickname(nickname)
                .hp(hp)
                .salt(salt)
                .build();
    }
}
