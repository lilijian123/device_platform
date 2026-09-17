package com.dkd.manage.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.dkd.common.annotation.Excel;
import com.dkd.common.core.domain.BaseEntity;

/**
 * 区域管理对象 tb_region
 * 
 * @author example
 * @date 2026-07-21
 */
public class Region extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 区域主键ID */
    private Long id;

    /** 区域名称 */
    @Excel(name = "区域名称")
    private String regionName;

    ////新增点位数量
    //private Integer nodeCount;
    //
    //public Integer getNodeCount() {
    //    return nodeCount;
    //}
    //
    //public void setNodeCount(Integer nodeCount) {
    //    this.nodeCount = nodeCount;
    //}

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setRegionName(String regionName) 
    {
        this.regionName = regionName;
    }

    public String getRegionName() 
    {
        return regionName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("regionName", getRegionName())
            //.append("nodeCount", getNodeCount())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("createBy", getCreateBy())
            .append("updateBy", getUpdateBy())
            .append("remark", getRemark())
            .toString();
    }
}
