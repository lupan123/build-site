package com.thinkgem.jeesite.modules.site.service;

import com.thinkgem.jeesite.common.service.TreeService;
import com.thinkgem.jeesite.modules.site.dao.NavDao;
import com.thinkgem.jeesite.modules.site.entity.Nav;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * TODO 网站栏目service
 *
 * @author lupan
 * @version 2016/1/4 0004
 */
@Service
@Transactional(readOnly = true)
public class NavService extends TreeService<NavDao,Nav> {

    private static final java.lang.String CACHE_NAV_LIST = "navList";

    /**
     * 查找栏目树，存入缓存
     * @return 节点列表
     */
    @SuppressWarnings("unchecked")
    public List<Nav> findList(){
        List<Nav> list = (List<Nav>) UserUtils.getCache(CACHE_NAV_LIST);
        if(list == null){
            list = super.findList(new Nav());
            UserUtils.putCache(CACHE_NAV_LIST, list);
        }
        return list;
    }

    @Transactional(readOnly = false)
    public void save(Nav nav) {
        super.save(nav);
        UserUtils.removeCache(CACHE_NAV_LIST);
    }

    @Transactional(readOnly = false)
    public void delete(Nav nav) {
        super.delete(nav);
        UserUtils.removeCache(CACHE_NAV_LIST);
    }

    public List<Nav> findByParentId(String parentId){
        Nav parent = new Nav();
        parent.setId(parentId);
        Nav entity = new Nav();
        entity.setParent(parent);
        return dao.findByParentId(entity);
    }

    public Nav getByValue(Nav entity) {
        return dao.getByValue(entity);
    }
}
