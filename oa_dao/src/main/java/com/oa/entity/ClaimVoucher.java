package com.oa.entity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Getter
@Setter
public class ClaimVoucher {
    private Integer id;

    private String cause;

    private String createSn;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
    private Date createTime;

    private String nextDealSn;

    private Double totalAmount;

    private String status;

    private Employee creater;
    private Employee dealer;

}