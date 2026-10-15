package com.dev.manage.domain.vo;


import com.dev.manage.domain.Partner;
import lombok.Data;

@Data
public class PartnerVo extends Partner {

    //点位数量
    private int nodeCount;
}
