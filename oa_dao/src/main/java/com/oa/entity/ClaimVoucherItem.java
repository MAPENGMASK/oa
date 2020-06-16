package com.oa.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ClaimVoucherItem {
    private Integer id;

    private Integer claimVoucherId;

    private String item;

    private Double amount;

    private String comment;
}