package com.thinkgem.jeesite.modules.sys.utils;

import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.site.entity.Content;
import com.thinkgem.jeesite.modules.site.entity.Nav;
import com.thinkgem.jeesite.modules.site.service.ContentService;
import com.thinkgem.jeesite.modules.site.service.NavService;
import org.springframework.ui.Model;

import java.util.List;

/**
 * TODO 网站管理的工具类
 *
 * @author lupan
 * @version 2016/1/7 0007
 */
public class WebsiteUtils {

    private static NavService navService = SpringContextHolder.getBean(NavService.class);
    private static ContentService contentService = SpringContextHolder.getBean(ContentService.class);

    /**
     * 页面底部联系方式添加模型的方法
     * @param model
     * @param pageName
     */
    public static void addFooterModel(Model model,String pageName){
        Nav entity = new Nav();
        entity.setValue(pageName);
        Nav parent = navService.getByValue(entity);
        //找到下级子节点
        List<Nav> navList = navService.findByParentId(parent.getId());
        //找到子节点的所有网站内容
        Content content = new Content();
        for (Nav nav : navList) {
            if(StringUtils.isNotBlank(nav.getValue())) {
                content.setNav(nav);
                model.addAttribute(nav.getValue(), contentService.findList(content));
            }
        }
    }
}
