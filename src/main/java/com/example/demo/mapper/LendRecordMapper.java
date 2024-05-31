package com.example.demo.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.demo.entity.LendRecord;
import com.example.demo.entity.TotalLendRecord;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Mapper
public interface LendRecordMapper extends BaseMapper<LendRecord> {
    @Select("select count(reader_id) from lend_record where lend_time > #{begin} and lend_time < #{end} and lend_time is not null")
    Integer countByLendTime(@Param("begin") LocalDateTime begin, @Param("end") LocalDateTime end);

    @Select("select count(reader_id) from lend_record where lend_time > #{begin} and lend_time < #{end} and return_time is not null")
    Integer countByReturnTime(@Param("begin") LocalDateTime begin, @Param("end") LocalDateTime end);

    @Select("select count(reader_id) from lend_record where lend_time > #{begin} and lend_time < #{end}")
    Integer countById(@Param("begin") LocalDateTime begin, @Param("end") LocalDateTime end);

    @Select("select reader_id, isbn, bookname, lend_time, return_time from lend_record where lend_time > #{begin} and lend_time < #{end}")
    List<LendRecord> getByTime(@Param("begin") LocalDateTime begin, @Param("end") LocalDateTime end);
    @Select("SELECT u.nick_name " +
            "FROM lend_record lt " +
            "JOIN user u ON lt.reader_id = u.id " +
            "WHERE lt.lend_time > #{begin} AND lt.lend_time < #{end}")
    List<String> getByNameWithTime(@Param("begin") LocalDateTime begin, @Param("end") LocalDateTime end);

}
