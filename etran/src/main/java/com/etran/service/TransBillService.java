package com.etran.service;

import org.springframework.data.domain.Page;

import com.etran.entity.TransBill;


public interface TransBillService {

     public void saveTransBill(TransBill bill);
     public Page<TransBill> getTransBill( int pageNumber, int pageSize, String sortType) ;
 	public void deleteBill(Long id);
}
