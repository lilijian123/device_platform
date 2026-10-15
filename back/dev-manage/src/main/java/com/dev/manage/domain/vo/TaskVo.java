package com.dev.manage.domain.vo;

import com.dev.manage.domain.Task;
import com.dev.manage.domain.TaskType;
import lombok.Data;

@Data
public class TaskVo extends Task {

    //工单类型
    private TaskType taskType;
}
