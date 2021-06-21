package com.jeogiyo.member.vo;

import java.util.Objects;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.springframework.stereotype.Component;

@Getter
@Setter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Component("memberVO")
public class MemberVO {
    private String id;
    private String pw;
    private String type;
    private String nickname;
    private String hp;
    private String isDelete;
    private String salt;

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        MemberVO memberVO = (MemberVO) o;
        return Objects.equals(id, memberVO.id) && Objects.equals(pw, memberVO.pw)
                && Objects.equals(type, memberVO.type) && Objects
                .equals(nickname, memberVO.nickname) && Objects.equals(hp, memberVO.hp)
                && Objects.equals(isDelete, memberVO.isDelete) && Objects
                .equals(salt, memberVO.salt);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, pw, type, nickname, hp, isDelete, salt);
    }
}

