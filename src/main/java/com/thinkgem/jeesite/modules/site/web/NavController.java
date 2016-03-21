package com.thinkgem.jeesite.modules.site.web;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.Category;
import com.thinkgem.jeesite.modules.site.entity.Nav;
import com.thinkgem.jeesite.modules.site.service.NavService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * TODO 网站栏目controller
 *
 * @author lupan
 * @version 2016/1/5 0005
 */
@Controller
@RequestMapping(value = "${adminPath}/site/nav")
public class NavController extends BaseController {

    @Autowired
    private NavService navService;

    @ModelAttribute("nav")
    public Nav get(@RequestParam(required=false) String id) {
        if (StringUtils.isNotBlank(id)){
            return navService.get(id);
        }else{
            return new Nav();
        }
    }

    @RequiresPermissions("site:nav:view")
    @RequestMapping(value = {"list",""})
    public String list(Model model){
        List<Nav> list = navService.findList();
        model.addAttribute("list",list);
        return "modules/site/navList";
    }

    @RequiresPermissions("site:Nav:view")
    @RequestMapping(value = "form")
    public String form(Nav nav, Model model) {
        if (nav.getParent()==null||nav.getParent().getId()==null){
            nav.setParent(new Nav("1"));
        }
        Nav parent = navService.get(nav.getParent().getId());
        nav.setParent(parent);

        model.addAttribute("nav", nav);
        return "modules/site/navForm";
    }

    @RequiresPermissions("site:nav:edit")
    @RequestMapping(value = "save")
    public String save(Nav nav, Model model, RedirectAttributes redirectAttributes) {
        if(Global.isDemoMode()){
            addMessage(redirectAttributes, "演示模式，不允许操作！");
            return "redirect:" + adminPath + "/site/nav/";
        }
        if (!beanValidator(model, nav)){
            return form(nav, model);
        }
        navService.save(nav);
        addMessage(redirectAttributes, "保存栏目'" + nav.getName() + "'成功");
        return "redirect:" + adminPath + "/site/nav/";
    }

    @RequiresPermissions("site:nav:edit")
    @RequestMapping(value = "delete")
    public String delete(Nav nav, RedirectAttributes redirectAttributes) {
        if(Global.isDemoMode()){
            addMessage(redirectAttributes, "演示模式，不允许操作！");
            return "redirect:" + adminPath + "/site/nav/";
        }
        if (Nav.isRoot(nav.getId())){
            addMessage(redirectAttributes, "删除栏目失败, 不允许删除顶级栏目或编号为空");
        }else{
            navService.delete(nav);
            addMessage(redirectAttributes, "删除栏目成功");
        }
        return "redirect:" + adminPath + "/site/nav/";
    }

    /**
     * 批量修改栏目排序
     */
    @RequiresPermissions("site:nav:edit")
    @RequestMapping(value = "updateSort")
    public String updateSort(String[] ids, Integer[] sorts, RedirectAttributes redirectAttributes) {
        int len = ids.length;
        Nav[] entitys = new Nav[len];
        for (int i = 0; i < len; i++) {
            entitys[i] = navService.get(ids[i]);
            entitys[i].setSort(sorts[i]);
            navService.save(entitys[i]);
        }
        addMessage(redirectAttributes, "保存栏目排序成功!");
        return "redirect:" + adminPath + "/site/nav/";
    }

    /**
     * 弹出框树结构
     * @param module 页面模型
     * @param extId
     * @param response 响应对象
     * @return json数组
     */
    @RequiresUser
    @ResponseBody
    @RequestMapping(value = "treeData")
    public List<Map<String, Object>> treeData(String module, @RequestParam(required=false) String extId, HttpServletResponse response) {
        response.setContentType("application/json; charset=UTF-8");
        List<Map<String, Object>> mapList = Lists.newArrayList();
        List<Nav> list = navService.findList();
        for (int i=0; i<list.size(); i++){
            Nav e = list.get(i);
            if (extId == null || (extId!=null && !extId.equals(e.getId()) && e.getParentIds().indexOf(","+extId+",")==-1)){
                Map<String, Object> map = Maps.newHashMap();
                map.put("id", e.getId());
                map.put("pId", e.getParent()!=null?e.getParent().getId():0);
                map.put("name", e.getName());
                mapList.add(map);
            }
        }
        return mapList;
    }
}
