<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="设备编号" prop="innerCode">
        <el-input
          v-model="queryParams.innerCode"
          placeholder="请输入设备编号"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-table v-loading="loading" :data="vmList" @selection-change="handleSelectionChange">
      <el-table-column label="序号" type="index" width="60" align="center" />
      <el-table-column label="设备编号" align="center" prop="innerCode" />
      <el-table-column label="设备型号" align="center">
        <template #default="scope">
          {{ getVmTypeName(scope.row.vmTypeId) }}
        </template>
      </el-table-column>
      <el-table-column label="详细地址"  align="left" prop="addr" show-overflow-tooltip />
      <el-table-column label="合作商" align="left" show-overflow-tooltip>
        <template #default="scope">
          {{ getPartnerName(scope.row.partnerId) }}
        </template>
      </el-table-column>
      <el-table-column label="运营状态" align="center" prop="vmStatus">
        <template #default="scope">
          <dict-tag :options="vm_status" :value="scope.row.vmStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="设备状态" align="center" prop="vmStatus">
        <template #default="scope">
          <span >
            {{ scope.row.runningStatus == '正常' ? '正常' : '异常' }}
          </span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary"  @click="getVmInfo(scope.row)" v-hasPermi="['manage:vm:query']">查看详情</el-button>

        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 查看设备管理对话框 -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="vmRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="设备编号" prop="innerCode">
          <span>{{ form.innerCode ==null ? '系统自动生成' : form.innerCode }}</span>
        </el-form-item>
        <el-form-item label="供货时间" v-if="form.lastSupplyTime!==null">
          <span>{{ parseTime(form.lastSupplyTime, "{y}-{m}-{d} {h}:{i}:{s}") }}</span>
        </el-form-item>
        <el-form-item label="设备型号" >
          {{ getVmTypeName(form.vmTypeId) }}
        </el-form-item>
        <el-form-item label="设备容量" >
          {{ form.channelMaxCapacity }}
        </el-form-item>
        <el-form-item label="点位" prop="nodeId">
          <span>{{ nodeList.find(item => item.id === form.nodeId)?.nodeName || '暂无点位' }}</span>
        </el-form-item>
        <el-form-item label="合作商"   >
          <template v-if="form.partnerId">
            {{ getPartnerName(form.partnerId) }}
          </template>
        </el-form-item>
        <el-form-item label="所属区域" prop="regionId"  >
          {{ getRegionName(form.regionId) }}
        </el-form-item>
        <el-form-item label="详细地址" prop="addr"  >
          <template v-if="form.partnerId">
            {{ form.addr }}
          </template>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Vm">
import { listVm, getVm, delVm, addVm, updateVm } from "@/api/manage/vm";
import { listPartner } from "@/api/manage/partner";
import { listVmtype } from "@/api/manage/vmtype";
import { listNode } from "@/api/manage/node";
import { listRegion } from "@/api/manage/region";

const { proxy } = getCurrentInstance();
const { vm_status } = proxy.useDict('vm_status');
const vmList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const single = ref(true);
const multiple = ref(true);
const total = ref(0);
const title = ref("");

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    innerCode: null,
    nodeId: null,
    businessType: null,
    regionId: null,
    partnerId: null,
    vmTypeId: null,
    clientId: null,
    policyId: null,
  },
  rules: {
    vmTypeId: [
      { required: true, message: "设备型号不能为空", trigger: "blur" }
    ],
  }
});

const { queryParams, form, rules } = toRefs(data);

/** 查询设备管理列表 */
function getList() {
  loading.value = true;
  listVm(queryParams.value).then(response => {
    vmList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}

// 取消按钮
function cancel() {
  open.value = false;
  reset();
}

// 表单重置
function reset() {
  form.value = {
    id: null,
    innerCode: null,
    channelMaxCapacity: null,
    nodeId: null,
    addr: null,
    lastSupplyTime: null,
    businessType: null,
    regionId: null,
    partnerId: null,
    vmTypeId: null,
    vmStatus: null,
    runningStatus: null,
    longitudes: null,
    latitude: null,
    clientId: null,
    policyId: null,
    createTime: null,
    updateTime: null
  };
  proxy.resetForm("vmRef");
}

/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}

/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}

// 多选框选中数据
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.id);
  single.value = selection.length != 1;
  multiple.value = !selection.length;
}


/** 修改按钮操作 */
function getVmInfo(row) {
  reset();
  const _id = row.id || ids.value
  getVm(_id).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改设备管理";
  });
}

/** 提交按钮 */
function submitForm() {
  proxy.$refs["vmRef"].validate(valid => {
    if (valid) {
      if (form.value.id != null) {
        updateVm(form.value).then(response => {
          proxy.$modal.msgSuccess("修改成功");
          open.value = false;
          getList();
        });
      } else {
        addVm(form.value).then(response => {
          proxy.$modal.msgSuccess("新增成功");
          open.value = false;
          getList();
        });
      }
    }
  });
}


//加载合作商下拉
const partnerOptions = ref([]);
function getPartnerOptions() {
  listPartner({ pageNum:1, pageSize:9999 }).then(res => {
    partnerOptions.value = res.rows;
  })
}

function getPartnerName(pid) {
  const target = partnerOptions.value.find(item => item.id === pid)
  return target ? target.partnerName : "未知合作商"
}

//加载设备型号下拉
const vmTypeList = ref([]);
function getVmTypeList() {
  listVmtype({ pageNum:1, pageSize:9999 }).then(response => {
    vmTypeList.value = response.rows;
  })
}

function getVmTypeName(vmTypeId) {
  const target = vmTypeList.value.find(item => item.id === vmTypeId)
  if (!target) return "未知设备型号"
  return target.name || "未知设备型号"
}

//加载点位信息
const nodeList = ref([]);
function getNodeList() {
  listNode({ pageNum:1, pageSize:9999 }).then(response => {
    nodeList.value = response.rows;
  })
}

//加载区域信息
const regionList = ref([]);
function getRegionList() {
  listRegion({ pageNum:1, pageSize:9999 }).then(response => {
    regionList.value = response.rows;
  })
}

function getRegionName(regionId) {
  const target = regionList.value.find(item => item.id === regionId)
  return target ? target.regionName : "未知区域"
}



getList();
getPartnerOptions();
getVmTypeList(); 
getNodeList();
getRegionList();
</script>
