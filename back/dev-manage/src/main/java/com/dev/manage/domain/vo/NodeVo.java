package com.dev.manage.domain.vo;

import com.dev.manage.domain.Node;
import com.dev.manage.domain.Partner;
import com.dev.manage.domain.Region;
import lombok.Data;

@Data
public class NodeVo extends Node {

    // 设备数量
    private int vmCount;

    // 区域
    private Region region;

    // 合作商
    private Partner partner;
}
