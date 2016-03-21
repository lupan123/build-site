package com.thinkgem.jeesite.modules.site.web;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.site.entity.Content;
import com.thinkgem.jeesite.modules.site.entity.Nav;
import com.thinkgem.jeesite.modules.site.service.ContentService;
import com.thinkgem.jeesite.modules.site.service.NavService;
import com.thinkgem.jeesite.modules.sys.utils.WebsiteUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * TODO 外部网站管理controller
 *
 * @author lupan
 * @version 2016/1/4 0004
 */
@Controller
@RequestMapping("${websitePath}/site")
public class WebsiteController extends BaseController{

    @Autowired
    private NavService navService;
    @Autowired
    private ContentService contentService;


    /**
     * 公众端网页页面跳转方法
     * @param pageNavPath
     * @return
     */
    @RequestMapping(value = "/goTo/{pageNavPath}")
    public String goTo(Model model , @PathVariable("pageNavPath") String pageNavPath){
        String[] path = pageNavPath.split(",");
        String pagePath = path[0]; //页面名称
        String navPath = ""; //栏目定位id
        if(path.length>1){
            navPath = path[1];
        }
        model.addAttribute("navPath",navPath);

        Nav entity = new Nav();
        entity.setValue(pagePath);
        Nav parent = navService.getByValue(entity);
        //找到下级子节点
        List<Nav> navList = navService.findByParentId(parent.getId());
        //找到子节点的所有网站内容
        Content content = new Content();
        for (Nav nav : navList) {
            if(StringUtils.isNotBlank(nav.getValue())){
                content.setNav(nav);
                model.addAttribute(nav.getValue(),contentService.findList(content));
            }
        }
        //添加联系方式模型
        WebsiteUtils.addFooterModel(model,"contact");
        return "website/"+pagePath;
    }

    /**
     * 公众端网页页面跳转方法
     * 页面栏目包含有需要分页的时候，调用此函数！
     * @param pageNavPath 页面栏目的定位字符串
     * @param content 查询条件封装
     * @return
     */
    @RequestMapping(value = "/page/{pageNavPath}")
    public String goToReturnPage(Model model , @PathVariable("pageNavPath") String pageNavPath, HttpServletRequest request, HttpServletResponse response,Content content){
        String[] path = pageNavPath.split(",");
        String pagePath = path[0]; //页面名称
        String navPath = ""; //栏目定位id
        if(path.length>1){
            navPath = path[1];
        }
        model.addAttribute("navPath",navPath);

        Nav entity = new Nav();
        entity.setValue(pagePath);
        Nav parent = navService.getByValue(entity);
        //找到下级子节点
        List<Nav> navList = navService.findByParentId(parent.getId());
        //找到子节点的所有网站内容
        for (Nav nav : navList) {
            if(StringUtils.isNotBlank(nav.getValue())){
                content.setNav(nav);
                //需要分页的栏目返回Page
                if(nav.getValue().contains("_page")){
                    Page<Content> page = contentService.findPage(new Page<Content>(request, response), content);
                    model.addAttribute(nav.getValue(),page);
                }else{
                    model.addAttribute(nav.getValue(),contentService.findList(content));
                }
            }
        }
        //添加联系方式模型
        WebsiteUtils.addFooterModel(model,"contact");
        return "website/"+pagePath;
    }

    /**
     * 播放音频文件
     * @param model
     * @param content
     * @return
     */
    @RequestMapping(value = "/audioPlay")
    public String audioPlay(Model model ,Content content){
        model.addAttribute("content",content);
        return "website/audio-play";
    }



}
