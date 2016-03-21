package com.thinkgem.jeesite.modules.site.web;

import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.site.entity.Nav;
import com.thinkgem.jeesite.modules.site.service.NavService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * TODO 网站后台管理controller
 *
 * @author lupan
 * @version 2016/1/15 0015
 */

@Controller
@RequestMapping("${adminPath}/site")
public class SiteManageController extends BaseController {

    @Autowired
    private NavService navService;


    /**
     * 跳转到主页
     * @return
     */
    @RequiresPermissions("site:view")
    @RequestMapping(value = "")
    public String index() {
        return "modules/site/siteIndex";
    }

    /**
     * 栏目树页面
     * @param model
     * @return
     */
    @RequiresPermissions("site:view")
    @RequestMapping(value = "siteTree")
    public String tree(Model model) {
        model.addAttribute("navList", navService.findList());
        return "modules/site/siteTree";
    }

    /**
     * 框架空白页面
     * @return
     */
    @RequiresPermissions("site:view")
    @RequestMapping(value = "none")
    public String none() {
        return "modules/site/siteNone";
    }

    /**
     * 访问网站栏目并定位
     * @param nav
     * @return
     */
    @RequestMapping(value = "/visit")
    public String visit(Nav nav){
        Nav entity =  navService.get(nav);
        Nav parent =  navService.get(entity.getParent().getId());
        if(parent.getValue().equals("news")){
            return "redirect:" + websitePath + "/site/page/"+parent.getValue()+","+entity.getValue();
        }else{
            return "redirect:" + websitePath + "/site/goTo/"+parent.getValue()+","+entity.getValue();
        }
    }

    /**
     * 访问网站栏目并定位（通过栏目列表）
     * @param nav
     * @return
     */
    @RequestMapping(value = "/navVisit")
    public String navVisit(Nav nav){
        Nav entity =  navService.get(nav);
        Nav parent =  navService.get(entity.getParent().getId());
        if(parent.getValue().equals("news")){
            return "redirect:" + websitePath + "/site/page/"+parent.getValue()+","+entity.getValue();
        }else{
            return "redirect:" + websitePath + "/site/goTo/"+parent.getValue()+","+entity.getValue();
        }
    }
}
