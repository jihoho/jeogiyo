package com.jeogiyo.member.dao;

import com.jeogiyo.member.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import java.util.Map;

@Mapper
public interface MemberDAO {
    String selectOverlappedID(@Param("memberId") String memberId,@Param("memberType") String memberType) throws DataAccessException;

    void insertNewMember(MemberVO memberVO) throws DataAccessException;

    MemberVO selectMemberByIdAndTypeAndPw(Map<String, String> params) throws  DataAccessException;

    void updateMemberByIdAndType(MemberVO memberVO) throws DataAccessException;

    String selectMemberSaltByIdAndType(@Param("memberId") String memberId,@Param("memberType") String memberType) throws DataAccessException;

}
