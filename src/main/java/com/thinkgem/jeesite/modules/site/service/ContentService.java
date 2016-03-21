package com.thinkgem.jeesite.modules.site.service;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.site.entity.Content;
import com.thinkgem.jeesite.modules.site.entity.Nav;
import com.thinkgem.jeesite.modules.site.dao.ContentDao;
import com.thinkgem.jeesite.modules.site.dao.NavDao;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * TODO 网站内容管理
 *
 * @author lupan
 * @version 2015/12/21 0021
 */

@Service
@Transactional(readOnly = true)
public class ContentService extends CrudService<ContentDao, Content> {

    @Autowired
    private ContentDao contentDao;
    @Autowired
    private NavDao navDao;

    @Transactional(readOnly = false)
    public Page<Content> findPage(Page<Content> page, Content content) {
        // 更新过期的权重，间隔为“6”个小时
//        Date updateExpiredWeightDate =  (Date) CacheUtils.get("updateExpiredWeightDateByContent");
//        if (updateExpiredWeightDate == null || (updateExpiredWeightDate != null
//                && updateExpiredWeightDate.getTime() < new Date().getTime())){
//            dao.updateExpiredWeight(content);
//            CacheUtils.put("updateExpiredWeightDateByContent", DateUtils.addHours(new Date(), 6));
//        }
        if (content.getNav()!=null && StringUtils.isNotBlank(content.getNav().getId()) && !Nav.isRoot(content.getNav().getId())){
            Nav nav = navDao.get(content.getNav().getId());
            if (nav==null){
                nav = new Nav();
            }
            nav.setParentIds(nav.getId());
            content.setNav(nav);
        }
        else{
            content.setNav(new Nav());
        }

        return super.findPage(page, content);

    }

    @Transactional(readOnly = false)
    public void save(Content content) {
        if (content.getContent()!=null){
            content.setContent(StringEscapeUtils.unescapeHtml4(
                    content.getContent()));
        }
        // 如果没有审核权限，则将当前内容改为待审核状态
        if (!UserUtils.getSubject().isPermitted("site:content:audit")){
            content.setDelFlag(Nav.DEL_FLAG_AUDIT);
        }
        // 如果栏目不需要审核，则将该内容设为发布状态
        if (content.getNav()!=null&&StringUtils.isNotBlank(content.getNav().getId())){
            Nav nav = navDao.get(content.getNav().getId());
            if (!Global.YES.equals(nav.getIsAudit())){
                content.setDelFlag(Content.DEL_FLAG_NORMAL);
            }
        }
        //判断是新增还是修改
        if(StringUtils.isBlank(content.getId())){
            content.preInsert();
            dao.insert(content);
        }else{
            content.preUpdate();
            dao.update(content);
        }

    }

    @Transactional(readOnly = false)
    public void delete(Content content, Boolean isRe) {
        if(isRe!=null && isRe == true){
            content.setDelFlag(Content.DEL_FLAG_NORMAL);
            contentDao.updateDelFlag(content);
        }else{
            super.delete(content);
        }
    }
}
