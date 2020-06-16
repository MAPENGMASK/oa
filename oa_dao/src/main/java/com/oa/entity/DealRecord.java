package com.oa.entity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Getter
@Setter
public class DealRecord {
    private Integer id;

    private Integer claimVoucherId;

    private String dealSn;

    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
    private Date dealTime;

    private String dealWay;

    private String dealResult;

    private String comment;


    private Employee dealer;

}