package com.oa.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Employee {
    private String sn;

    private String password;

    private String name;

    private String departmentSn;

    private String post;

    //部门对象
    private Department department;

}