package com.company.project.web;
import com.company.project.core.Result;
import com.company.project.core.ResultGenerator;
import com.company.project.model.User;
import com.company.project.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.List;

/**
* Created by CodeGenerator on 2020/06/24.
*/
@Api("User对象相关接口")
@RestController
public class UserController {
    @Resource
    private UserService userService;

    @ApiOperation(value="新增")
    @PostMapping("/user/add")
    public Result add(
            @ApiParam(name="user",value="user对象",required=true)
            @RequestBody
                User user) {
        userService.save(user);
        return ResultGenerator.genSuccessResult();
    }
    @ApiOperation(value="删除")
    @PostMapping("/user/delete")
    public Result delete(
            @RequestParam
            @ApiParam(name="id",value="id主键",required=true)
                Integer id) {
        userService.deleteById(id);
        return ResultGenerator.genSuccessResult();
    }
    @ApiOperation(value="更新")
    @PostMapping("/user/update")
    public Result update(
            @ApiParam(name="user",value="user对象",required=true)
            @RequestBody
                User user) {
        userService.update(user);
        return ResultGenerator.genSuccessResult();
    }
    @ApiOperation(value="详情")
    @PostMapping("/user/detail")
    public Result detail(@RequestParam Integer id) {
        User user = userService.findById(id);
        return ResultGenerator.genSuccessResult(user);
    }

    @ApiOperation(value="列表")
    @PostMapping("/user/list")
    public Result list(
            @RequestParam(defaultValue = "0")
            @ApiParam(name="page",value="页码",required=true)
                Integer page,
            @RequestParam(defaultValue = "0")
            @ApiParam(name="size",value="分页大小",required=true)
                Integer size) {
        PageHelper.startPage(page, size);
        List<User> list = userService.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return ResultGenerator.genSuccessResult(pageInfo);
    }
}
