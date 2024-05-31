package com.example.demo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TotalLendRecord {
    //借阅数量
    private Integer LendTotal;
    //归还数量
    private Integer ReturnTotal;
    //总数量
    private Integer AllTotal;
}
