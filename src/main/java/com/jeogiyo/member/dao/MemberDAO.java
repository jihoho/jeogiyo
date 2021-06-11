package com.jeogiyo.member.dao;

import com.jeogiyo.member.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import java.util.Map;

@Mapper
public interface MemberDAO {
    String selectOverlappedID(Map<String,String> idMap) throws DataAccessException;

    void insertNewMember(MemberVO memberVO) throws DataAccessException;

    MemberVO login(Map<String, String> loginMap) throws  DataAccessException;


    void updateMemberByIdAndType(MemberVO memberVO) throws DataAccessException;

    String selectMemberSaltByIdAndType(@Param("memberId") String memberId,@Param("memberType") String memberType) throws DataAccessException;

    void updateMemberByIdAndTypeExcludePw(MemberVO memberVO) throws DataAccessException;
}
