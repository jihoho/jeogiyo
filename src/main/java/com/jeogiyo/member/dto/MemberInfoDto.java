package com.jeogiyo.member.dto;

import com.jeogiyo.member.vo.MemberVO;
import lombok.Getter;
import lombok.Setter;

/**
 * Created by IntelliJ IDEA
 * User: hojun
 * Date: 2021-06-11 Time: 오후 6:21
 */

@Getter
@Setter
public class MemberInfoDto {

    private String memberId;
    private String memberType;
    private String nickName;
    private String hp;
    private String isDelete;

    public MemberInfoDto(String memberId, String memberType, String nickName, String hp,
            String isDelete) {
        this.memberId = memberId;
        this.memberType = memberType;
        this.nickName = nickName;
        this.hp = hp;
        this.isDelete = isDelete;
    }

    public static MemberInfoDto createMemberInfoDto(MemberVO memberVO) {
        return new MemberInfoDto(memberVO.getId(), memberVO.getType(), memberVO.getNickname(),
                memberVO.getHp(), memberVO.getIsDelete());
    }
}
