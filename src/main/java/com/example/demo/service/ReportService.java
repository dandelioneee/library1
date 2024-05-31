package com.example.demo.service;

import com.example.demo.entity.LendRecord;
import com.example.demo.entity.TotalLendRecord;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;

public interface ReportService {
    void exportBookData(HttpServletResponse response);

}
