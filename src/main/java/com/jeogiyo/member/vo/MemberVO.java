package com.jeogiyo.member.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.stereotype.Component;


@Getter
@Setter
@ToString
@Component("memberVO")
public class MemberVO {
    private String id;
    private String pw;
    private String type;
    private String nickname;
    private String hp;
    private String isDelete;
    private String salt;


}
