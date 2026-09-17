package com.dkd.manage.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import cn.hutool.core.bean.BeanUtil;
import com.dkd.common.constant.DkdContants;
import com.dkd.common.utils.DateUtils;
import com.dkd.common.utils.uuid.UUIDUtils;
import com.dkd.manage.domain.*;
import com.dkd.manage.mapper.ChannelMapper;
import com.dkd.manage.mapper.VmTypeMapper;
import com.dkd.manage.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dkd.manage.mapper.VendingMachineMapper;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.View;

import static com.dkd.common.core.domain.AjaxResult.error;
import static com.dkd.common.core.domain.AjaxResult.success;

/**
 * 设备管理Service业务层处理
 * 
 * @author lilian
 * @date 2026-07-23
 */
@Service
public class VendingMachineServiceImpl implements IVendingMachineService 
{
    @Autowired
    private VendingMachineMapper vendingMachineMapper;

    @Autowired
    private IVmTypeService vmTypeService;

    @Autowired
    private INodeService nodeService;

    @Autowired
    private IChannelService  channelService;

    @Autowired
    private IEmpService empService;
    @Autowired
    private View error;

    /**
     * 查询设备管理
     * 
     * @param id 设备管理主键
     * @return 设备管理
     */
    @Override
    public VendingMachine selectVendingMachineById(Long id)
    {
        return vendingMachineMapper.selectVendingMachineById(id);
    }

    /**
     * 查询设备管理列表
     * 
     * @param vendingMachine 设备管理
     * @return 设备管理
     */
    @Override
    public List<VendingMachine> selectVendingMachineList(VendingMachine vendingMachine)
    {
        return vendingMachineMapper.selectVendingMachineList(vendingMachine);
    }

    /**
     * 新增设备管理
     * 
     * @param vendingMachine 设备管理
     * @return 结果
     */
    @Transactional
    @Override
    public int insertVendingMachine(VendingMachine vendingMachine)
    {
        //新增设备
        //生成唯一标识
        String innerCode = UUIDUtils.getUUID();
        vendingMachine.setInnerCode(innerCode);
        //设置容量
        VmType vmType = vmTypeService.selectVmTypeById(vendingMachine.getVmTypeId());
        vendingMachine.setChannelMaxCapacity(vmType.getChannelMaxCapacity());
        //点位数据
        Node node = nodeService.selectNodeById(vendingMachine.getNodeId());
        BeanUtil.copyProperties(node,vendingMachine,"id");
        vendingMachine.setAddr(node.getAddress());
        vendingMachine.setVmStatus(DkdContants.VM_STATUS_NODEPLOY);
        //设置创建和修改时间
        vendingMachine.setCreateTime(DateUtils.getNowDate());
        vendingMachine.setUpdateTime(DateUtils.getNowDate());
        //保存
        int result = vendingMachineMapper.insertVendingMachine(vendingMachine);

        //新增货道
        List<Channel> channelList = new ArrayList<>();
        for(int i=1;i<= vmType.getVmRow();i++){
            for(int j=1;j<=vmType.getVmCol();j++){
                Channel channel=new Channel();
                channel.setChannelCode(i+"-"+j);
                channel.setVmId(vendingMachine.getId());
                channel.setInnerCode(vendingMachine.getInnerCode());
                channel.setMaxCapacity(vmType.getChannelMaxCapacity());
                channel.setCreateTime(DateUtils.getNowDate());
                channel.setUpdateTime(DateUtils.getNowDate());
                //channelService.insertChannel(channel);
                channelList.add(channel);
            }
        }
        channelService.insertBatchChannel(channelList);
        return result;
    }

    /**
     * 修改设备管理
     * 
     * @param vendingMachine 设备管理
     * @return 结果
     */
    @Override
    public int updateVendingMachine(VendingMachine vendingMachine)
    {
        //查询点位表，补充点位信息
        Node node = nodeService.selectNodeById(vendingMachine.getNodeId());
        BeanUtil.copyProperties(node, vendingMachine, "id");// 商圈类型、区域、合作商
        vendingMachine.setAddr(node.getAddress());// 设备地址
        vendingMachine.setUpdateTime(DateUtils.getNowDate());// 更新时间
        return vendingMachineMapper.updateVendingMachine(vendingMachine);
    }

    /**
     * 批量删除设备管理
     * 
     * @param ids 需要删除的设备管理主键
     * @return 结果
     */
    @Override
    public int deleteVendingMachineByIds(Long[] ids)
    {
        return vendingMachineMapper.deleteVendingMachineByIds(ids);
    }

    /**
     * 删除设备管理信息
     * 
     * @param id 设备管理主键
     * @return 结果
     */
    @Override
    public int deleteVendingMachineById(Long id)
    {
        return vendingMachineMapper.deleteVendingMachineById(id);
    }

    /**
     * 根据设备编号查询设备信息
     * @param innerCode
     * @return
     */
    @Override
    public VendingMachine selectVendingMachineByInnerCode(String innerCode) {
        return vendingMachineMapper.selectVendingMachineByInnerCode(innerCode);
    }

    /**
     * 根据售货机编号查询对应区域业务员
     * @param innerCode 售货机编号
     * @return 业务员列表
     */
    @Override
    public List<Emp> selectBusinessEmpByInnerCode(String innerCode) {
        VendingMachine vm = selectVendingMachineByInnerCode(innerCode);
        if (vm == null) {
            return Collections.emptyList();
        }
        Emp empParam = new Emp();
        empParam.setRegionId(vm.getRegionId());
        empParam.setStatus(DkdContants.EMP_STATUS_NORMAL);
        empParam.setRoleCode(DkdContants.ROLE_CODE_BUSINESS);
        return empService.selectEmpList(empParam);
    }

    /**
     * 根据售货机编号查询对应区域运维人员
     * @param innerCode 售货机编号
     * @return 业务员列表
     */
    @Override
    public List<Emp> selectOperationEmpByInnerCode(String innerCode) {
        VendingMachine vm = selectVendingMachineByInnerCode(innerCode);
        if (vm == null) {
            return Collections.emptyList();
        }
        Emp empParam = new Emp();
        empParam.setRegionId(vm.getRegionId());
        empParam.setStatus(DkdContants.EMP_STATUS_NORMAL);
        empParam.setRoleCode(DkdContants.ROLE_CODE_OPERATOR);
        return empService.selectEmpList(empParam);
    }
}
