package com.etran.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.etran.entity.TransBill;


public interface TransBillRepository  extends  PagingAndSortingRepository<TransBill, Long>, JpaSpecificationExecutor<TransBill>  {
//	 Page<TransBill> findById(Long id, Pageable pageRequest);
}
