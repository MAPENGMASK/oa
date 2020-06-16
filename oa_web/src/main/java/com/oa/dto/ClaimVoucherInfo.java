package com.oa.dto;

import com.oa.entity.ClaimVoucher;
import com.oa.entity.ClaimVoucherItem;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class ClaimVoucherInfo {
    private ClaimVoucher claimVoucher;
    private List<ClaimVoucherItem> items;
}
