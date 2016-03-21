package com.thinkgem.jeesite.modules.site.web;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.Article;
import com.thinkgem.jeesite.modules.cms.entity.Category;
import com.thinkgem.jeesite.modules.cms.entity.Site;
import com.thinkgem.jeesite.modules.cms.utils.CmsUtils;
import com.thinkgem.jeesite.modules.site.entity.Content;
import com.thinkgem.jeesite.modules.site.entity.Nav;
import com.thinkgem.jeesite.modules.site.service.ContentService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * TODO 网站内容管理Controller
 *
 * @author lupan
 * @version 2015/12/21 0021
 */

@Controller
@RequestMapping("${adminPath}/site/content")
public class ContentController extends BaseController {

    @Autowired
    private ContentService contentService;

    /**
     * 通用模型数据（每个controller方法执行之前先执行，取得模型）
     * @param id id字段
     * @return 实体类
     */
    @ModelAttribute
    public Content get(@RequestParam(required = false)String id){
        if(StringUtils.isNotBlank(id)){
           return contentService.get(id);
        }else{
            return new Content();
        }
    }

    /**
     * 网站内容List
     * @param content 内容
     * @param request 请求
     * @param response 响应
     * @param model 页面模型
     * @return 视图名
     */
    @RequiresPermissions("site:content:view")
    @RequestMapping(value = {"list", ""})
    public String list(Content content, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<Content> page = contentService.findPage(new Page<Content>(request, response), content );
        model.addAttribute("page", page);
        return "modules/site/contentList";
    }

    /**
     * 网站内容查看、修改
     * @param content 内容
     * @param model 页面模型
     * @return 视图名
     */
    @RequiresPermissions("site:content:view")
    @RequestMapping(value = "form")
    public String form(Content content, Model model) {
        model.addAttribute("content", content);
        return "modules/site/contentForm";
    }

    /**
     * 保存网站内容
     * @param content
     * @param model
     * @param redirectAttributes
     * @return
     */
    @RequiresPermissions("site:content:edit")
    @RequestMapping(value = "save")
    public String save(Content content, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, content)){
            return form(content, model);
        }
        contentService.save(content);
        addMessage(redirectAttributes, "保存网站内容'" + StringUtils.abbr(content.getH1(),50) + "'成功");
        String navId = content.getNav()!=null?content.getNav().getId():null;
        return "redirect:" + adminPath + "/site/content/?repage&nav.id="+(navId!=null?navId:"");
    }

    /**
     * 删除或重新发布网站内容
     * @param navId
     * @param content
     * @param isRe 是否将删除的重新发布
     * @param redirectAttributes
     * @return
     */
    @RequiresPermissions("site:content:edit")
    @RequestMapping(value = "delete")
    public String delete(Content content, String navId, @RequestParam(required=false) Boolean isRe, RedirectAttributes redirectAttributes) {
        // 如果没有审核权限，则不允许删除或发布。
        if (!UserUtils.getSubject().isPermitted("site:content:audit")){
            addMessage(redirectAttributes, "你没有删除或发布权限");
        }
        contentService.delete(content,isRe);
        addMessage(redirectAttributes, (isRe!=null&&isRe?"发布":"删除")+"网站内容成功");
        return "redirect:" + adminPath + "/site/content/?repage&nav.id="+(content!=null?navId:"");
    }
}
