package com.dkd.manage.mapper;

import java.util.List;
import com.dkd.manage.domain.Node;
import com.dkd.manage.domain.vo.NodeVo;

/**
 * 广告点位管理Mapper接口
 * 
 * @author example
 * @date 2026-07-21
 */
public interface NodeMapper 
{
    /**
     * 查询广告点位管理
     * 
     * @param id 广告点位管理主键
     * @return 广告点位管理
     */
    public Node selectNodeById(Long id);

    /**
     * 查询广告点位管理列表
     * 
     * @param node 广告点位管理
     * @return 广告点位管理集合
     */
    public List<Node> selectNodeList(Node node);

    /**
     * 新增广告点位管理
     * 
     * @param node 广告点位管理
     * @return 结果
     */
    public int insertNode(Node node);

    /**
     * 修改广告点位管理
     * 
     * @param node 广告点位管理
     * @return 结果
     */
    public int updateNode(Node node);

    /**
     * 删除广告点位管理
     * 
     * @param id 广告点位管理主键
     * @return 结果
     */
    public int deleteNodeById(Long id);

    /**
     * 批量删除广告点位管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteNodeByIds(Long[] ids);

    /**
     * 查询点位管理列表
     * @param node
     * @return NodeVo集合
     */
    public List<NodeVo> selectNodeVoList(Node node);
}
