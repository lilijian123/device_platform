CREATE TABLE `gen_table` (
                             `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                             `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
                             `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
                             `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
                             `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
                             `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
                             `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
                             `tpl_web_type` varchar(30) DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
                             `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
                             `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
                             `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
                             `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
                             `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
                             `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
                             `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
                             `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
                             `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                             `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                             `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                             `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                             PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表'

CREATE TABLE `gen_table_column` (
                                    `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                                    `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
                                    `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
                                    `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
                                    `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
                                    `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
                                    `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
                                    `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
                                    `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
                                    `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
                                    `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
                                    `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
                                    `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
                                    `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
                                    `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
                                    `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
                                    `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
                                    `sort` int DEFAULT NULL COMMENT '排序',
                                    `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                                    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                    `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                                    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                    PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段'

CREATE TABLE `sys_config` (
                              `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
                              `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
                              `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
                              `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
                              `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
                              `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                              `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                              `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                              `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                              `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                              PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表'

CREATE TABLE `sys_dept` (
                            `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
                            `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
                            `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
                            `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
                            `order_num` int DEFAULT '0' COMMENT '显示顺序',
                            `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
                            `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
                            `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
                            `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
                            `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表'

CREATE TABLE `sys_dict_data` (
                                 `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
                                 `dict_sort` int DEFAULT '0' COMMENT '字典排序',
                                 `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
                                 `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
                                 `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
                                 `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
                                 `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
                                 `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
                                 `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
                                 `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                                 `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                 `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                                 `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                 `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                                 PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表'

CREATE TABLE `sys_dict_type` (
                                 `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
                                 `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
                                 `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
                                 `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
                                 `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                                 `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                 `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                                 `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                 `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                                 PRIMARY KEY (`dict_id`),
                                 UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表'

CREATE TABLE `sys_job` (
                           `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
                           `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
                           `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
                           `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
                           `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
                           `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
                           `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
                           `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
                           `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                           `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                           `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                           `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                           `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
                           PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表'

CREATE TABLE `sys_job_log` (
                               `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
                               `job_name` varchar(64) NOT NULL COMMENT '任务名称',
                               `job_group` varchar(64) NOT NULL COMMENT '任务组名',
                               `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
                               `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
                               `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
                               `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
                               `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                               PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表'

CREATE TABLE `sys_logininfor` (
                                  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
                                  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
                                  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
                                  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
                                  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
                                  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
                                  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
                                  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
                                  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
                                  PRIMARY KEY (`info_id`),
                                  KEY `idx_sys_logininfor_s` (`status`),
                                  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录'

CREATE TABLE `sys_menu` (
                            `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
                            `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
                            `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
                            `order_num` int DEFAULT '0' COMMENT '显示顺序',
                            `path` varchar(200) DEFAULT '' COMMENT '路由地址',
                            `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
                            `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
                            `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
                            `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
                            `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
                            `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
                            `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
                            `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
                            `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) DEFAULT '' COMMENT '备注',
                            PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2088 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表'

CREATE TABLE `sys_notice` (
                              `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
                              `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
                              `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
                              `notice_content` longblob COMMENT '公告内容',
                              `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
                              `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                              `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                              `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                              `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                              `remark` varchar(255) DEFAULT NULL COMMENT '备注',
                              PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表'

CREATE TABLE `sys_oper_log` (
                                `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
                                `title` varchar(50) DEFAULT '' COMMENT '模块标题',
                                `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
                                `method` varchar(100) DEFAULT '' COMMENT '方法名称',
                                `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
                                `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
                                `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
                                `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
                                `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
                                `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
                                `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
                                `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
                                `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
                                `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
                                `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
                                `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
                                `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
                                PRIMARY KEY (`oper_id`),
                                KEY `idx_sys_oper_log_bt` (`business_type`),
                                KEY `idx_sys_oper_log_s` (`status`),
                                KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录'

CREATE TABLE `sys_post` (
                            `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
                            `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
                            `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
                            `post_sort` int NOT NULL COMMENT '显示顺序',
                            `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                            PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表'

CREATE TABLE `sys_role` (
                            `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
                            `role_name` varchar(30) NOT NULL COMMENT '角色名称',
                            `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
                            `role_sort` int NOT NULL COMMENT '显示顺序',
                            `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
                            `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
                            `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
                            `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
                            `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                            PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表'

CREATE TABLE `sys_role_dept` (
                                 `role_id` bigint NOT NULL COMMENT '角色ID',
                                 `dept_id` bigint NOT NULL COMMENT '部门ID',
                                 PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表'

CREATE TABLE `sys_role_menu` (
                                 `role_id` bigint NOT NULL COMMENT '角色ID',
                                 `menu_id` bigint NOT NULL COMMENT '菜单ID',
                                 PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表'

CREATE TABLE `sys_user` (
                            `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
                            `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
                            `user_name` varchar(30) NOT NULL COMMENT '用户账号',
                            `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
                            `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
                            `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
                            `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
                            `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
                            `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
                            `password` varchar(100) DEFAULT '' COMMENT '密码',
                            `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
                            `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                            `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
                            `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                            PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表'

CREATE TABLE `sys_user_post` (
                                 `user_id` bigint NOT NULL COMMENT '用户ID',
                                 `post_id` bigint NOT NULL COMMENT '岗位ID',
                                 PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表'

CREATE TABLE `sys_user_role` (
                                 `user_id` bigint NOT NULL COMMENT '用户ID',
                                 `role_id` bigint NOT NULL COMMENT '角色ID',
                                 PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表'

CREATE TABLE `tb_channel` (
                              `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
                              `channel_code` varchar(10) NOT NULL COMMENT '货道编号',
                              `sku_id` bigint DEFAULT '0' COMMENT '商品Id',
                              `vm_id` bigint NOT NULL COMMENT '售货机Id',
                              `inner_code` varchar(15) NOT NULL COMMENT '售货机软编号',
                              `max_capacity` int NOT NULL DEFAULT '0' COMMENT '货道最大容量',
                              `current_capacity` int DEFAULT '0' COMMENT '货道当前容量',
                              `last_supply_time` datetime DEFAULT NULL COMMENT '上次补货时间',
                              `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                              `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                              PRIMARY KEY (`id`),
                              KEY `channel_vendingmachine_Id_fk` (`vm_id`),
                              KEY `tb_channel_inner_code_index` (`inner_code`),
                              CONSTRAINT `tb_channel_ibfk_1` FOREIGN KEY (`vm_id`) REFERENCES `tb_vending_machine` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5245 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='售货机货道表'

CREATE TABLE `tb_emp` (
                          `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
                          `user_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '员工名称',
                          `region_id` int unsigned DEFAULT NULL COMMENT '所属区域Id',
                          `region_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '区域名称',
                          `role_id` int DEFAULT NULL COMMENT '角色id',
                          `role_code` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色编号',
                          `role_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色名称',
                          `mobile` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
                          `image` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '员工头像',
                          `status` tinyint DEFAULT '1' COMMENT '是否启用',
                          `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                          `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
                          PRIMARY KEY (`id`),
                          UNIQUE KEY `tb_user_Id_uindex` (`id`),
                          UNIQUE KEY `tb_user_user_name_uindex` (`user_name`),
                          UNIQUE KEY `tb_user_mobile_uindex` (`mobile`),
                          KEY `role_id` (`role_id`),
                          KEY `region_id` (`region_id`),
                          CONSTRAINT `tb_emp_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `tb_role` (`role_id`),
                          CONSTRAINT `tb_emp_ibfk_2` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='工单员工表'

CREATE TABLE `tb_job` (
                          `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
                          `alert_value` int DEFAULT '0' COMMENT '警戒值百分比',
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='自动补货任务'

CREATE TABLE `tb_node` (
                           `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '点位主键ID',
                           `region_id` int unsigned DEFAULT NULL COMMENT '所属区域ID，关联tb_region.id',
                           `partner_id` int unsigned DEFAULT NULL COMMENT '所属合作商ID，关联tb_partner.id',
                           `node_name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '点位名称',
                           `address` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '详细地址',
                           `business_type` int NOT NULL DEFAULT '0' COMMENT '商圈类型：1商务CBD 2潮流购物中心 3社区商业 4文旅步行街',
                           `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                           `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
                           `create_by` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin' COMMENT '创建人账号',
                           `update_by` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin' COMMENT '修改人账号',
                           `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注信息',
                           PRIMARY KEY (`id`),
                           KEY `fk_node_partner` (`partner_id`),
                           KEY `fk_node_region` (`region_id`),
                           CONSTRAINT `fk_node_partner` FOREIGN KEY (`partner_id`) REFERENCES `tb_partner` (`id`),
                           CONSTRAINT `fk_node_region` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='线下广告点位信息表'

CREATE TABLE `tb_order` (
                            `id` bigint NOT NULL COMMENT '主键',
                            `order_no` varchar(50) NOT NULL COMMENT '订单编号',
                            `third_no` varchar(34) DEFAULT NULL COMMENT '第三方平台单号',
                            `inner_code` varchar(15) DEFAULT NULL COMMENT '机器编号',
                            `channel_code` varchar(10) DEFAULT NULL COMMENT '货道编号',
                            `sku_id` bigint DEFAULT NULL COMMENT 'skuId',
                            `sku_name` varchar(20) DEFAULT NULL COMMENT '商品名称',
                            `class_id` int DEFAULT NULL COMMENT '商品类别Id',
                            `status` int DEFAULT NULL COMMENT '订单状态:0-待支付;1-支付完成;2-出货成功;3-出货失败;4-已取消',
                            `amount` int NOT NULL DEFAULT '0' COMMENT '支付金额',
                            `price` int NOT NULL DEFAULT '0' COMMENT '商品金额',
                            `pay_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '支付类型，1支付宝 2微信',
                            `pay_status` int DEFAULT '0' COMMENT '支付状态，0-未支付;1-支付完成;2-退款中;3-退款完成',
                            `bill` int DEFAULT '0' COMMENT '合作商账单金额',
                            `addr` varchar(200) DEFAULT NULL COMMENT '点位地址',
                            `region_id` bigint DEFAULT NULL COMMENT '所属区域Id',
                            `region_name` varchar(50) DEFAULT NULL COMMENT '区域名称',
                            `business_type` int DEFAULT NULL COMMENT '所属商圈',
                            `partner_id` int DEFAULT NULL COMMENT '合作商Id',
                            `open_id` varchar(200) DEFAULT NULL COMMENT '跨站身份验证',
                            `node_id` bigint DEFAULT NULL COMMENT '点位Id',
                            `node_name` varchar(50) DEFAULT NULL COMMENT '点位名称',
                            `cancel_desc` varchar(200) DEFAULT '' COMMENT '取消原因',
                            `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
                            `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `Order_OrderNo_uindex` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单表'

CREATE TABLE `tb_order_collect` (
                                    `id` bigint NOT NULL COMMENT 'Id',
                                    `partner_id` int DEFAULT NULL COMMENT '合作商Id',
                                    `partner_name` varchar(100) DEFAULT NULL COMMENT '合作商名称',
                                    `order_total_money` bigint DEFAULT NULL COMMENT '日订单收入总金额(平台端总数)',
                                    `order_date` date DEFAULT NULL COMMENT '发生日期',
                                    `total_bill` int DEFAULT '0' COMMENT '分成总金额',
                                    `node_id` int DEFAULT NULL,
                                    `node_name` varchar(50) DEFAULT NULL COMMENT '点位',
                                    `order_count` int DEFAULT NULL COMMENT '订单数',
                                    `ratio` int DEFAULT NULL COMMENT '分成比例',
                                    `region_name` varchar(50) DEFAULT NULL COMMENT '区域名称',
                                    PRIMARY KEY (`id`),
                                    UNIQUE KEY `tb_order_collect_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='合作商订单汇总表'

CREATE TABLE `tb_order_month_collect` (
                                          `id` bigint NOT NULL COMMENT 'id',
                                          `partner_id` int DEFAULT NULL COMMENT '合作商Id',
                                          `partner_name` varchar(100) DEFAULT NULL COMMENT '合作商名称',
                                          `region_id` int DEFAULT NULL COMMENT '区域Id',
                                          `region_name` varchar(50) DEFAULT NULL COMMENT '地区名称',
                                          `order_total_money` bigint DEFAULT NULL COMMENT '订单总金额',
                                          `order_total_count` bigint DEFAULT NULL COMMENT '订单总数',
                                          `month` int DEFAULT NULL COMMENT '月份',
                                          `year` int DEFAULT NULL COMMENT '年份',
                                          PRIMARY KEY (`id`),
                                          UNIQUE KEY `tb_order_month_collect_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='按月统计各公司销售情况表'

CREATE TABLE `tb_partner` (
                              `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '合作商主键ID',
                              `partner_name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '合作商名称',
                              `contact_person` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '联系人',
                              `contact_phone` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '联系电话',
                              `divide_ratio` int NOT NULL DEFAULT '0' COMMENT '分成比例（单位%，整数）',
                              `account` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '登录账号',
                              `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '登录密码（加密存储）',
                              `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                              `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
                              `create_by` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin' COMMENT '创建人账号',
                              `update_by` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin' COMMENT '修改人账号',
                              `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注信息',
                              PRIMARY KEY (`id`),
                              UNIQUE KEY `uk_account` (`account`) COMMENT '账号唯一索引'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='广告合作商信息表'

CREATE TABLE `tb_policy` (
                             `policy_id` bigint NOT NULL AUTO_INCREMENT COMMENT '策略id',
                             `policy_name` varchar(30) DEFAULT NULL COMMENT '策略名称',
                             `discount` int DEFAULT NULL COMMENT '策略方案，如：80代表8折',
                             `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                             `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
                             PRIMARY KEY (`policy_id`),
                             UNIQUE KEY `tb_policy_policy_name_uindex` (`policy_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='策略表'

CREATE TABLE `tb_region` (
                             `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '区域主键ID',
                             `region_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '区域名称',
                             `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                             `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
                             `create_by` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin' COMMENT '创建人账号',
                             `update_by` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin' COMMENT '修改人账号',
                             `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注信息',
                             PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='城市区域信息表'

CREATE TABLE `tb_role` (
                           `role_id` int NOT NULL AUTO_INCREMENT,
                           `role_code` varchar(50) DEFAULT NULL COMMENT '角色编码\n',
                           `role_name` varchar(50) DEFAULT NULL COMMENT '角色名称\n',
                           PRIMARY KEY (`role_id`),
                           UNIQUE KEY `tb_role_role_code_uindex` (`role_code`),
                           UNIQUE KEY `tb_role_role_name_uindex` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='工单角色表'

CREATE TABLE `tb_sku` (
                          `sku_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
                          `sku_name` varchar(50) NOT NULL COMMENT '商品名称',
                          `sku_image` varchar(500) NOT NULL COMMENT '商品图片',
                          `brand_Name` varchar(50) NOT NULL COMMENT '品牌',
                          `unit` varchar(20) DEFAULT NULL COMMENT '规格(净含量)',
                          `price` int NOT NULL DEFAULT '1' COMMENT '商品价格，单位分',
                          `class_id` int NOT NULL COMMENT '商品类型Id',
                          `is_discount` tinyint(1) DEFAULT '0' COMMENT '是否打折促销',
                          `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                          `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
                          PRIMARY KEY (`sku_id`),
                          UNIQUE KEY `tb_sku_sku_name_uindex` (`sku_name`),
                          KEY `sku_sku_class_ClassId_fk` (`class_id`),
                          CONSTRAINT `tb_sku_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `tb_sku_class` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品表'

CREATE TABLE `tb_sku_class` (
                                `class_id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
                                `class_name` varchar(50) DEFAULT '' COMMENT '类别名称',
                                `parent_id` int DEFAULT '0' COMMENT '上级id',
                                PRIMARY KEY (`class_id`),
                                UNIQUE KEY `tb_sku_class_class_name_uindex` (`class_name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品类型表'

CREATE TABLE `tb_task` (
                           `task_id` bigint NOT NULL AUTO_INCREMENT COMMENT '工单ID',
                           `task_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '工单编号',
                           `task_status` int DEFAULT NULL COMMENT '工单状态',
                           `create_type` int DEFAULT NULL COMMENT '创建类型 0：自动 1：手动',
                           `inner_code` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '售货机编码',
                           `user_id` int DEFAULT NULL COMMENT '执行人id',
                           `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '执行人名称',
                           `region_id` bigint DEFAULT NULL COMMENT '所属区域Id',
                           `desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
                           `product_type_id` int DEFAULT '1' COMMENT '工单类型id',
                           `assignor_id` int DEFAULT NULL COMMENT '指派人Id',
                           `addr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
                           `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                           `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                           PRIMARY KEY (`task_id`),
                           UNIQUE KEY `tb_task_task_code_uindex` (`task_code`),
                           KEY `task_productiontype_TypeId_fk` (`product_type_id`),
                           KEY `task_taskstatustype_StatusID_fk` (`task_status`),
                           KEY `task_tasktype_TypeId_fk` (`create_type`)
) ENGINE=InnoDB AUTO_INCREMENT=567 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='工单表'

CREATE TABLE `tb_task_collect` (
                                   `id` int NOT NULL AUTO_INCREMENT,
                                   `user_id` int DEFAULT NULL,
                                   `finish_count` int DEFAULT '0' COMMENT '当日工单完成数',
                                   `progress_count` int DEFAULT '0' COMMENT '当日进行中的工单数',
                                   `cancel_count` int DEFAULT '0' COMMENT '当日取消工单数',
                                   `collect_date` date DEFAULT NULL COMMENT '汇总的日期',
                                   PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='工单按日统计表'

CREATE TABLE `tb_task_details` (
                                   `details_id` bigint NOT NULL AUTO_INCREMENT,
                                   `task_id` bigint DEFAULT NULL COMMENT '工单Id',
                                   `channel_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '货道编号',
                                   `expect_capacity` int NOT NULL DEFAULT '0' COMMENT '补货期望容量',
                                   `sku_id` bigint DEFAULT NULL COMMENT '商品Id',
                                   `sku_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   `sku_image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                   PRIMARY KEY (`details_id`),
                                   KEY `taskdetails_task_TaskId_fk` (`task_id`),
                                   CONSTRAINT `taskdetails_task_TaskId_fk` FOREIGN KEY (`task_id`) REFERENCES `tb_task` (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3781 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='工单详情，只有补货工单才有'

CREATE TABLE `tb_task_type` (
                                `type_id` int NOT NULL,
                                `type_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类型名称',
                                `type` int DEFAULT '1' COMMENT '工单类型。1:维修工单;2:运营工单',
                                PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='工单类型'

CREATE TABLE `tb_vending_machine` (
                                      `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
                                      `inner_code` varchar(15) DEFAULT '000' COMMENT '设备编号',
                                      `channel_max_capacity` int DEFAULT NULL COMMENT '设备容量',
                                      `node_id` int NOT NULL COMMENT '点位Id',
                                      `addr` varchar(100) DEFAULT NULL COMMENT '详细地址',
                                      `last_supply_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '上次补货时间',
                                      `business_type` int NOT NULL COMMENT '商圈类型',
                                      `region_id` int NOT NULL COMMENT '区域Id',
                                      `partner_id` int NOT NULL COMMENT '合作商Id',
                                      `vm_type_id` int NOT NULL DEFAULT '0' COMMENT '设备型号',
                                      `vm_status` int NOT NULL DEFAULT '0' COMMENT '设备状态，0:未投放;1-运营;3-撤机',
                                      `running_status` varchar(100) DEFAULT NULL COMMENT '运行状态',
                                      `longitudes` double DEFAULT '0' COMMENT '经度',
                                      `latitude` double DEFAULT '0' COMMENT '维度',
                                      `client_id` varchar(50) DEFAULT NULL COMMENT '客户端连接Id,做emq认证用',
                                      `policy_id` bigint DEFAULT NULL COMMENT '策略id',
                                      `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                      `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
                                      PRIMARY KEY (`id`),
                                      UNIQUE KEY `vendingmachine_VmId_uindex` (`inner_code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='设备表'

CREATE TABLE `tb_vendout_running` (
                                      `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
                                      `order_no` varchar(38) NOT NULL DEFAULT '' COMMENT '订单编号',
                                      `inner_code` varchar(15) NOT NULL COMMENT '售货机编号',
                                      `channel_code` varchar(10) DEFAULT NULL COMMENT '货道编号',
                                      `status` char(1) DEFAULT NULL COMMENT '状态',
                                      `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                      `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                      PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1665296081440129026 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='出货流水'

CREATE TABLE `tb_vm_type` (
                              `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
                              `name` varchar(15) NOT NULL COMMENT '型号名称',
                              `model` varchar(20) DEFAULT NULL COMMENT '型号编码',
                              `image` varchar(500) DEFAULT NULL COMMENT '设备图片',
                              `vm_row` int NOT NULL DEFAULT '1' COMMENT '货道行',
                              `vm_col` int NOT NULL DEFAULT '1' COMMENT '货道列',
                              `channel_max_capacity` int DEFAULT '0' COMMENT '设备容量',
                              PRIMARY KEY (`id`),
                              UNIQUE KEY `tb_vm_type_name_uindex` (`name`),
                              UNIQUE KEY `tb_vm_type_model_uindex` (`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='设备类型表'

