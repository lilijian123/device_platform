package com.dkd.manage.service.impl;

import java.util.List;
import com.dkd.common.utils.DateUtils;
import com.dkd.manage.domain.vo.NodeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dkd.manage.mapper.NodeMapper;
import com.dkd.manage.domain.Node;
import com.dkd.manage.service.INodeService;

/**
 * 广告点位管理Service业务层处理
 * 
 * @author example
 * @date 2026-07-21
 */
@Service
public class NodeServiceImpl implements INodeService 
{
    @Autowired
    private NodeMapper nodeMapper;

    /**
     * 查询广告点位管理
     * 
     * @param id 广告点位管理主键
     * @return 广告点位管理
     */
    @Override
    public Node selectNodeById(Long id)
    {
        return nodeMapper.selectNodeById(id);
    }

    /**
     * 查询广告点位管理列表
     * 
     * @param node 广告点位管理
     * @return 广告点位管理
     */
    @Override
    public List<Node> selectNodeList(Node node)
    {
        return nodeMapper.selectNodeList(node);
    }

    /**
     * 新增广告点位管理
     * 
     * @param node 广告点位管理
     * @return 结果
     */
    @Override
    public int insertNode(Node node)
    {
        node.setCreateTime(DateUtils.getNowDate());
        return nodeMapper.insertNode(node);
    }

    /**
     * 修改广告点位管理
     * 
     * @param node 广告点位管理
     * @return 结果
     */
    @Override
    public int updateNode(Node node)
    {
        node.setUpdateTime(DateUtils.getNowDate());
        return nodeMapper.updateNode(node);
    }

    /**
     * 批量删除广告点位管理
     * 
     * @param ids 需要删除的广告点位管理主键
     * @return 结果
     */
    @Override
    public int deleteNodeByIds(Long[] ids)
    {
        return nodeMapper.deleteNodeByIds(ids);
    }

    /**
     * 删除广告点位管理信息
     * 
     * @param id 广告点位管理主键
     * @return 结果
     */
    @Override
    public int deleteNodeById(Long id)
    {
        return nodeMapper.deleteNodeById(id);
    }

    /**
     * 查询点位管理列表
     *
     * @param node
     * @return NodeVo集合
     */
    @Override
    public List<NodeVo> selectNodeVoList(Node node) {
        return nodeMapper.selectNodeVoList(node);
    }
}
