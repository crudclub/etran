package com.etran.spec;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;

import com.etran.entity.TransBill;

public class TransBillSpec  {
	

	public static Specification<TransBill> findByCardNoSpec(final String cardNo) {
	    return new Specification<TransBill>() {
	      public Predicate toPredicate(Root<TransBill> root, CriteriaQuery<?> query,CriteriaBuilder builder) {
            return builder.equal(root.get("cardNo"), cardNo);
	      }
	    };
	  }
	
	 /**
     * 动态生成where语句
     * @param searchArticle
     * @return
     */
    public Specification<TransBill> getWhereClause(final SearchTransBill searchArticle){
        return new Specification<TransBill>() {
            @Override
            public Predicate toPredicate(Root<TransBill> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                List<Predicate> predicate = new ArrayList<Predicate>();
                if(searchArticle.getCardNo()!=null){
                    predicate.add(cb.equal(root.get("cardNo"), searchArticle.getCardNo()));
                }
//                if(searchArticle.getPostTimeEnd()!=null){
//                    predicate.add(cb.lessThanOrEqualTo(root.get("postTime").as(Date.class), searchArticle.getPostTimeEnd()));
//                }
//                if(searchArticle.getRecTimeStart()!=null){
//                    predicate.add(cb.greaterThanOrEqualTo(root.get("recommendTime").as(Date.class), searchArticle.getRecTimeStart()));
//                }
//                if (searchArticle.getRecTimeEnd()!=null){
//                    predicate.add(cb.lessThanOrEqualTo(root.get("recommendTime").as(Date.class), searchArticle.getRecTimeEnd()));
//                }
//                if (StringUtils.isNotBlank(searchArticle.getNickname())){
//                    //两张表关联查询
//                    Join<Article,User> userJoin = root.join(root.getModel().getSingularAttribute("user",User.class),JoinType.LEFT);
//                    predicate.add(cb.like(userJoin.get("nickname").as(String.class), "%" + searchArticle.getNickname() + "%"));
//                }
                Predicate[] pre = new Predicate[predicate.size()];
                return query.where(predicate.toArray(pre)).getRestriction();
            }
        };
    }

}
