package com.example.demo.controller;

import com.example.demo.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("/report")
public class ReportController {

    @Resource
    private ReportService reportService;

    /**
     * 导出运营数据报表
     * @param response
     */
    @GetMapping("/export")
    @CrossOrigin(origins = {"http://localhost:9876","http://localhost:9877", "http://localhost:9878"})
    public void export(HttpServletResponse response){
        reportService.exportBookData(response);
    }

}
