package com.etran.entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 货运单明细
 * 
 * @author dsy
 * @date 20150612
 * 
 */
@Entity
@Table(name = "TransFlowDetail")
public class TransFlowDetail {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	/**
	 * 货运单号
	 */
	@Column(length = 32)
	private String transFlowNo;

	/**
	 * 品名
	 */
	@Column(length = 255)
	private String goodName;

	/**
	 * 包装
	 */
	@Column(length = 32)
	private String packaging;

	/**
	 * 件数
	 */
	private BigDecimal packages;

	/**
	 * 重量
	 */
	private BigDecimal weight;

	/**
	 * 单位
	 */
	@Column(length = 32)
	private String unit;

	/**
	 * 体积
	 */
	private BigDecimal volume;

	/**
	 * 运费
	 */
	private BigDecimal freight;

	/**
	 * 是否投保 0:是 1:否
	 */
	@Column(length = 4)
	private String isInsure;

	/**
	 * 保费
	 */
	private BigDecimal preminum;

	/**
	 * 投保价值
	 */
	private BigDecimal insuredValue;

	/**
	 * 货物类型
	 */
	@Column(length = 32)
	private String goodType;

	/**
	 * 申明价值
	 */
	private BigDecimal declareValue;

	/**
	 * 包装费
	 */
	private BigDecimal packExpense;

	/**
	 * 提货费
	 */
	private BigDecimal pickUpCost;

	/**
	 * 送货费
	 */
	private BigDecimal sendCost;

	/**
	 * 其他费用
	 */
	private BigDecimal otherCost;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTransFlowNo() {
		return transFlowNo;
	}

	public void setTransFlowNo(String transFlowNo) {
		this.transFlowNo = transFlowNo;
	}

	public String getGoodName() {
		return goodName;
	}

	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}

	public String getPackaging() {
		return packaging;
	}

	public void setPackaging(String packaging) {
		this.packaging = packaging;
	}

	public BigDecimal getPackages() {
		return packages;
	}

	public void setPackages(BigDecimal packages) {
		this.packages = packages;
	}

	public BigDecimal getWeight() {
		return weight;
	}

	public void setWeight(BigDecimal weight) {
		this.weight = weight;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public BigDecimal getVolume() {
		return volume;
	}

	public void setVolume(BigDecimal volume) {
		this.volume = volume;
	}

	public BigDecimal getFreight() {
		return freight;
	}

	public void setFreight(BigDecimal freight) {
		this.freight = freight;
	}

	public String getIsInsure() {
		return isInsure;
	}

	public void setIsInsure(String isInsure) {
		this.isInsure = isInsure;
	}

	public BigDecimal getPreminum() {
		return preminum;
	}

	public void setPreminum(BigDecimal preminum) {
		this.preminum = preminum;
	}

	public BigDecimal getInsuredValue() {
		return insuredValue;
	}

	public void setInsuredValue(BigDecimal insuredValue) {
		this.insuredValue = insuredValue;
	}

	public String getGoodType() {
		return goodType;
	}

	public void setGoodType(String goodType) {
		this.goodType = goodType;
	}


	public BigDecimal getDeclareValue() {
		return declareValue;
	}

	public void setDeclareValue(BigDecimal declareValue) {
		this.declareValue = declareValue;
	}

	public BigDecimal getPackExpense() {
		return packExpense;
	}

	public void setPackExpense(BigDecimal packExpense) {
		this.packExpense = packExpense;
	}

	public BigDecimal getPickUpCost() {
		return pickUpCost;
	}

	public void setPickUpCost(BigDecimal pickUpCost) {
		this.pickUpCost = pickUpCost;
	}

	public BigDecimal getSendCost() {
		return sendCost;
	}

	public void setSendCost(BigDecimal sendCost) {
		this.sendCost = sendCost;
	}

	public BigDecimal getOtherCost() {
		return otherCost;
	}

	public void setOtherCost(BigDecimal otherCost) {
		this.otherCost = otherCost;
	}

}
