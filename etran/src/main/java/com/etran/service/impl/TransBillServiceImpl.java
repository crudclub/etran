package com.etran.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Component;

import com.etran.entity.TransBill;
import com.etran.repository.TransBillRepository;
import com.etran.service.TransBillService;
import com.etran.spec.SearchTransBill;
import com.etran.spec.TransBillSpec;

@Component("transBillService")
public class TransBillServiceImpl implements TransBillService {
	
	
	private static Logger log = LoggerFactory.getLogger(TransBillServiceImpl.class);
	
	@Autowired
	private TransBillRepository transBillRepository;

	@Override
	public void saveTransBill(TransBill bill) {
		
		transBillRepository.save(bill);
	}
	
	public void deleteBill(Long id)
	{
		transBillRepository.delete(id);
	}
	
	
	public Page<TransBill> getTransBill( int pageNumber, int pageSize, String sortType) {
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
//        Specification<TransBill> spec = buildSpecification(userId, searchParams);
        SearchTransBill searchTransBill = new SearchTransBill();
        searchTransBill.setCardNo("456");
        TransBillSpec transBillSpec = new TransBillSpec();
        return transBillRepository.findAll(transBillSpec.findByCardNoSpec("456"),pageRequest);
//        return  transBillRepository.findAll(transBillSpec.getWhereClause(searchTransBill),pageRequest);
    }
 
    /**
     * 创建分页请求.
     */
    private PageRequest buildPageRequest(int pageNumber, int pagzSize, String sortType) {
        Sort sort = null;
        if ("auto".equals(sortType)) {
            sort = new Sort(Direction.DESC, "id");
        } else if ("title".equals(sortType)) {
            sort = new Sort(Direction.ASC, "title");
        }
 
        return new PageRequest(pageNumber, pagzSize, sort);
    }
 
//    /**
//     * 创建动态查询条件组合.
//     */
//    private Specification<TransBill> buildSpecification(Long id, Map<String, Object> searchParams) {
//        Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
//        filters.put("user.id", new SearchFilter("user.id", Operator.EQ, id));
//        Specification<TransBill> spec = DynamicSpecifications.bySearchFilter(filters.values(), TransBill.class);
//        return spec;
//    }
}
