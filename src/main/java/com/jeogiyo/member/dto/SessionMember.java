package com.jeogiyo.member.dto;

import com.jeogiyo.member.vo.MemberVO;
import java.util.Objects;
import lombok.Getter;
import lombok.Setter;

/**
 * Created by IntelliJ IDEA
 * User: hojun
 * Date: 2021-06-11 Time: 오후 6:21
 */

@Getter
@Setter
public class SessionMember {

    private String memberId;
    private String memberType;
    private String nickname;
    private String hp;
    private String isDelete;

    public SessionMember(String memberId, String memberType, String nickname, String hp,
            String isDelete) {
        this.memberId = memberId;
        this.memberType = memberType;
        this.nickname = nickname;
        this.hp = hp;
        this.isDelete = isDelete;
    }

    public static SessionMember createSessionMember(MemberVO memberVO) {
        return new SessionMember(memberVO.getId(), memberVO.getType(), memberVO.getNickname(),
                memberVO.getHp(), memberVO.getIsDelete());
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        SessionMember that = (SessionMember) o;
        return Objects.equals(memberId, that.memberId) && Objects
                .equals(memberType, that.memberType) && Objects
                .equals(nickname, that.nickname) && Objects.equals(hp, that.hp)
                && Objects.equals(isDelete, that.isDelete);
    }

    @Override
    public int hashCode() {
        return Objects.hash(memberId, memberType, nickname, hp, isDelete);
    }
}
