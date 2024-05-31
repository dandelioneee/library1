package com.example.demo.service;


import com.example.demo.entity.LendRecord;
import com.example.demo.entity.TotalLendRecord;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

public interface LendRecordService {

    TotalLendRecord getBookData(LocalDateTime begin, LocalDateTime end);

    List<LendRecord> getLendRecordData(LocalDateTime begin, LocalDateTime end);

    List<String> getUserName(LocalDateTime begin, LocalDateTime end);
}
