package com.jeogiyo.common.handler;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import java.sql.*;

public class CustomDateHandler extends BaseTypeHandler<Date> {
    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, Date parameter, JdbcType jdbcType) throws SQLException {

    }

    @Override
    public Date getNullableResult(ResultSet rs, String columnName) throws SQLException {
        Timestamp sqlTimestamp = rs.getTimestamp(columnName);
        if (sqlTimestamp != null) {
            return new Date(sqlTimestamp.getTime());
        }
        return null;
    }

    @Override
    public Date getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        return null;
    }

    @Override
    public Date getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        return null;
    }
}
