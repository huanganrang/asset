package asset.controller;

import asset.model.AssetBaseInfo;
import asset.service.AssetBaseServiceI;
import jb.pageModel.Json;
import jb.pageModel.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by guxin on 2016/3/7.
 */
@Controller
@RequestMapping("/asset/ledger")
public class LedgerController {

    @Autowired
    private AssetBaseServiceI assetBaseService;

    @RequestMapping("/list")
    public String getLedgerList(HttpServletRequest request, PageHelper ph) {
        List ledgerList = assetBaseService.getLedgerList(ph);
        request.setAttribute("ledgerList", ledgerList);
        return "/assets/ledger";
    }

    //assetId为空，其他不能为空的参数必需添加
    @RequestMapping("/add")
    @ResponseBody
    public Json add(AssetBaseInfo assetBaseInfo) {
        Json j = new Json();
        try {
            assetBaseService.add(assetBaseInfo);
            j.setSuccess(true);
            j.setMsg("添加成功！");
            j.setObj(assetBaseInfo);
        } catch (Exception e) {
            j.setMsg(e.getMessage());
        }
        return j;
    }

    //assetId不能为空，添加需要修改的参数即可
    @RequestMapping("/edit")
    @ResponseBody
    public Json edit(AssetBaseInfo assetBaseInfo) {
        Json j = new Json();
        try {
            assetBaseService.edit(assetBaseInfo);
            j.setSuccess(true);
            j.setMsg("修改成功！");
            j.setObj(assetBaseInfo);
        } catch (Exception e) {
            j.setMsg(e.getMessage());
        }
        return j;
    }

    //assetId不能为空，若批量删除，以逗号分隔
    @RequestMapping("/delete")
    @ResponseBody
    public Json delete(String assetId) {
        Json j = new Json();
        try {
            assetBaseService.delete(assetId);
            j.setSuccess(true);
            j.setMsg("删除成功！");
        } catch (Exception e) {
            j.setMsg(e.getMessage());
        }
        return j;
    }

}
