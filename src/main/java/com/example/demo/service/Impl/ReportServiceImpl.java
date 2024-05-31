package com.example.demo.service.Impl;

import com.example.demo.controller.UserController;
import com.example.demo.entity.LendRecord;
import com.example.demo.entity.TotalLendRecord;
import com.example.demo.service.LendRecordService;
import com.example.demo.service.ReportService;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Map;

@Service
public class ReportServiceImpl implements ReportService {

    @Autowired
    private LendRecordService lendRecordService;
    @Override
    public void exportBookData(HttpServletResponse response) {
        //1.查询数据库，获取最近120天的营业数据
        LocalDate dateBegin = LocalDate.now().plusDays(-120);
        //todo 此处应为-1，为了便于测试改为0
        LocalDate dateEnd = LocalDate.now().plusDays(0);
        //天数差
        long daysDifference = dateBegin.until(dateEnd, ChronoUnit.DAYS);
        //在类路径下读取资源返回输入流对象
        InputStream in = this.getClass().getClassLoader().getResourceAsStream("template/图书借阅登记报表.xlsx");
        //获得数据
        TotalLendRecord totalLendRecord = lendRecordService.getBookData(LocalDateTime.of(dateBegin, LocalTime.MIN), LocalDateTime.of(dateEnd, LocalTime.MAX));
        //2.通过poi将数据写入到Excel文件中
        try {
            //基于模板文件创建一个新的excel文件
            XSSFWorkbook excel = new XSSFWorkbook(in);
            XSSFSheet sheet = excel.getSheet("Sheet1");
            //填充时间数据
            sheet.getRow(1).getCell(1).setCellValue("时间" + dateBegin + "至" + dateEnd);
            //获得第四行
            XSSFRow row = sheet.getRow(3);
            row.getCell(2).setCellValue(totalLendRecord.getLendTotal());
            row.getCell(4).setCellValue(totalLendRecord.getReturnTotal());
            row.getCell(6).setCellValue(totalLendRecord.getAllTotal()-totalLendRecord.getReturnTotal());
            //填充明细数据
            int currentRow = 6; //代表第七行开始
            //todo 便于测试此时改为=
            for (int i = 0; i <= daysDifference; i++) {
                LocalDate date = dateBegin.plusDays(i);
                //查询某一天的图书数据
                List<LendRecord> lendRecord = lendRecordService.getLendRecordData(LocalDateTime.of(date, LocalTime.MIN), LocalDateTime.of(date, LocalTime.MAX));
                List<String> userName = lendRecordService.getUserName(LocalDateTime.of(date, LocalTime.MIN), LocalDateTime.of(date, LocalTime.MAX));
                if (lendRecord == null || lendRecord.isEmpty()) {
                    continue;
                }
                for(int j = 0;j<lendRecord.size();j++){
                    row = sheet.getRow(currentRow);
                    if (row == null) {
                        row = sheet.createRow(currentRow);
                    }
                    row.getCell(1).setCellValue(lendRecord.get(j).getIsbn());
                    row.getCell(2).setCellValue(lendRecord.get(j).getBookname());
                    // 创建SimpleDateFormat对象并指定日期时间格式
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                    row.getCell(3).setCellValue(sdf.format(lendRecord.get(j).getLendTime()));
                    if(lendRecord.get(j).getReturnTime() == null){
                        row.getCell(4).setCellValue("未归还");
                    }
                    else{
                        row.getCell(4).setCellValue(sdf.format(lendRecord.get(j).getReturnTime()));
                    }
                    //todo 换上名字
                    row.getCell(5).setCellValue(userName.get(j));
                    row.getCell(6).setCellValue("无");
                    currentRow++; // 更新当前行号
                }
            }

            //设置响应头
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader("Content-Disposition", "attachment; filename=book_data.xlsx");

            //3.通过输出流将Excel文件下载到浏览器中
            ServletOutputStream out = response.getOutputStream();
            excel.write(out);
            //关闭资源
            out.close();
            //excel.close();
            //in.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
