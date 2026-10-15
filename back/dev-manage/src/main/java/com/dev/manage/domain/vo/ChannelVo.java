package com.dev.manage.domain.vo;

import com.dev.manage.domain.Channel;
import com.dev.manage.domain.Sku;
import lombok.Data;

@Data
public class ChannelVo extends Channel {

    // 商品
    private Sku sku;
}