package ${basePackage}.web;
import ${basePackage}.core.Result;
import ${basePackage}.core.ResultGenerator;
import ${basePackage}.model.${modelNameUpperCamel};
import ${basePackage}.service.${modelNameUpperCamel}Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.List;

/**
* Created by ${author} on ${date}.
*/
@Api("${modelNameUpperCamel}对象相关接口")
@RestController
public class ${modelNameUpperCamel}Controller {
    @Resource
    private ${modelNameUpperCamel}Service ${modelNameLowerCamel}Service;

    @ApiOperation(value="新增")
    @PostMapping("${baseRequestMapping}/add")
    public Result add(
            @ApiParam(name="${modelNameLowerCamel}",value="${modelNameLowerCamel}对象",required=true)
            @RequestBody
                ${modelNameUpperCamel} ${modelNameLowerCamel}) {
        ${modelNameLowerCamel}Service.save(${modelNameLowerCamel});
        return ResultGenerator.genSuccessResult();
    }
    @ApiOperation(value="删除")
    @PostMapping("${baseRequestMapping}/delete")
    public Result delete(
            @RequestParam
            @ApiParam(name="id",value="id主键",required=true)
                Integer id) {
        ${modelNameLowerCamel}Service.deleteById(id);
        return ResultGenerator.genSuccessResult();
    }
    @ApiOperation(value="更新")
    @PostMapping("${baseRequestMapping}/update")
    public Result update(
            @ApiParam(name="${modelNameLowerCamel}",value="${modelNameLowerCamel}对象",required=true)
            @RequestBody
                ${modelNameUpperCamel} ${modelNameLowerCamel}) {
        ${modelNameLowerCamel}Service.update(${modelNameLowerCamel});
        return ResultGenerator.genSuccessResult();
    }
    @ApiOperation(value="详情")
    @PostMapping("${baseRequestMapping}/detail")
    public Result detail(@RequestParam Integer id) {
        ${modelNameUpperCamel} ${modelNameLowerCamel} = ${modelNameLowerCamel}Service.findById(id);
        return ResultGenerator.genSuccessResult(${modelNameLowerCamel});
    }

    @ApiOperation(value="列表")
    @PostMapping("${baseRequestMapping}/list")
    public Result list(
            @RequestParam(defaultValue = "0")
            @ApiParam(name="page",value="页码",required=true)
                Integer page,
            @RequestParam(defaultValue = "0")
            @ApiParam(name="size",value="分页大小",required=true)
                Integer size) {
        PageHelper.startPage(page, size);
        List<${modelNameUpperCamel}> list = ${modelNameLowerCamel}Service.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return ResultGenerator.genSuccessResult(pageInfo);
    }
}
