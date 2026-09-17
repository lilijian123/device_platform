package com.dkd.manage.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.dkd.common.annotation.Excel;
import com.dkd.common.core.domain.BaseEntity;

/**
 * 广告点位管理对象 tb_node
 * 
 * @author example
 * @date 2026-07-21
 */
public class Node extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 点位主键ID */
    private Long id;

    /** 所属区域ID，关联tb_region.id */
    @Excel(name = "所属区域ID，关联tb_region.id")
    private Long regionId;

    /** 所属合作商ID，关联tb_partner.id */
    @Excel(name = "所属合作商ID，关联tb_partner.id")
    private Long partnerId;

    /** 点位名称 */
    @Excel(name = "点位名称")
    private String nodeName;

    /** 详细地址 */
    @Excel(name = "详细地址")
    private String address;

    /** 商圈类型：1商务CBD 2潮流购物中心 3社区商业 4文旅步行街 */
    @Excel(name = "商圈类型：1商务CBD 2潮流购物中心 3社区商业 4文旅步行街")
    private Long businessType;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setRegionId(Long regionId)
    {
        this.regionId = regionId;
    }

    public Long getRegionId()
    {
        return regionId;
    }
    public void setPartnerId(Long partnerId)
    {
        this.partnerId = partnerId;
    }

    public Long getPartnerId()
    {
        return partnerId;
    }
    public void setNodeName(String nodeName) 
    {
        this.nodeName = nodeName;
    }

    public String getNodeName() 
    {
        return nodeName;
    }
    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }
    public void setBusinessType(Long businessType) 
    {
        this.businessType = businessType;
    }

    public Long getBusinessType() 
    {
        return businessType;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("regionId", getRegionId())
            .append("partnerId", getPartnerId())
            .append("nodeName", getNodeName())
            .append("address", getAddress())
            .append("businessType", getBusinessType())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("createBy", getCreateBy())
            .append("updateBy", getUpdateBy())
            .append("remark", getRemark())
            .toString();
    }
}
