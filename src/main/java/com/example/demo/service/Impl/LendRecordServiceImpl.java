package com.example.demo.service.Impl;

import com.example.demo.entity.LendRecord;
import com.example.demo.entity.TotalLendRecord;
import com.example.demo.mapper.LendRecordMapper;
import com.example.demo.service.LendRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class LendRecordServiceImpl implements LendRecordService {
    @Autowired
    private LendRecordMapper lendRecordMapper;
    @Override
    public TotalLendRecord getBookData(LocalDateTime begin, LocalDateTime end) {
        TotalLendRecord totalLendRecord = new TotalLendRecord();
        //获得数据
        Integer lendTotal = lendRecordMapper.countByLendTime(begin,end);
        Integer returnTotal = lendRecordMapper.countByReturnTime(begin,end);

        Integer allTotal = lendRecordMapper.countById(begin,end);

        //封装返回
        totalLendRecord.setLendTotal(lendTotal);
        totalLendRecord.setReturnTotal(returnTotal);
        totalLendRecord.setAllTotal(allTotal);
        return  totalLendRecord;
    }

    @Override
    public List<LendRecord> getLendRecordData(LocalDateTime begin, LocalDateTime end) {
        return lendRecordMapper.getByTime(begin,end);
    }

    @Override
    public List<String> getUserName(LocalDateTime begin, LocalDateTime end) {
        return lendRecordMapper.getByNameWithTime(begin, end);
    }

}
