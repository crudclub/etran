package com.etran.entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 货运单据信息
 * 
 * @author dsy
 * @date 20150612
 * 
 */
@Entity
@Table(name = "transFlow")
public class TransFlow {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	/**
	 * 托运单号需要自动生成
	 */
	@Column(length = 32)
	private String transFlowNo;

	/**
	 * 托运日期
	 */
	@Column(length = 32)
	private String transDate;

	/**
	 * 始发地
	 */
	@Column(length = 255)
	private String startAddress;

	/**
	 * 目的地
	 */
	@Column(length = 255)
	private String endAddress;

	/**
	 * 托运人id
	 */
	private Long transTuoId;

	/**
	 * 收货人id
	 */
	private Long transShouId;

	/**
	 * 付款方式 0:现付 1：到付 2 月结 3 其他
	 */
	@Column(length = 4)
	private String payType;

	/**
	 * 其他付款描述
	 * 
	 */
	@Column(length = 255)
	private String otherPay;

	/**
	 * 签收单是否返回 0:是 1:否
	 * 
	 */
	@Column(length = 4)
	private String isBillBack;

	/**
	 * 服务方式 0 上门收货 1 客户自提 2 送货上门 3 其他
	 */
	@Column(length = 4)
	private String serviceType;

	/**
	 * 服务方式其他描述
	 */
	@Column(length = 255)
	private String otherService;

	/**
	 * 运单打印次数
	 */
	private Long printCount;

	/**
	 * 创建日期
	 */
	@Column(length = 32)
	private String createDate;

	/**
	 * 件数
	 */
	private BigDecimal packages;

	/**
	 * 重量
	 */
	private BigDecimal weight;

	/**
	 * 体积
	 */
	private BigDecimal volume;

	/**
	 * 保险费
	 */
	private BigDecimal preminum;

	/**
	 * 投保价值
	 */
	private BigDecimal insuredValue;

	/**
	 * 合计费用
	 */
	private BigDecimal sumPay;

	/**
	 * 操作员编号
	 */
	private Long operateId;

	/**
	 * 运单状态 0：新增 1：已打印 2：已作废
	 */
	@Column(length = 4)
	private String status;

	/**
	 * 运单所属公司
	 */
	private Long ownComId;

	/**
	 * 配载单号
	 */
	@Column(length = 32)
	private String stowageNO;

	/**
	 * 装车单号
	 */
	@Column(length = 32)
	private String entruckNo;

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

	public String getTransDate() {
		return transDate;
	}

	public void setTransDate(String transDate) {
		this.transDate = transDate;
	}

	public String getStartAddress() {
		return startAddress;
	}

	public void setStartAddress(String startAddress) {
		this.startAddress = startAddress;
	}

	public String getEndAddress() {
		return endAddress;
	}

	public void setEndAddress(String endAddress) {
		this.endAddress = endAddress;
	}

	public Long getTransTuoId() {
		return transTuoId;
	}

	public void setTransTuoId(Long transTuoId) {
		this.transTuoId = transTuoId;
	}

	public Long getTransShouId() {
		return transShouId;
	}

	public void setTransShouId(Long transShouId) {
		this.transShouId = transShouId;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getOtherPay() {
		return otherPay;
	}

	public void setOtherPay(String otherPay) {
		this.otherPay = otherPay;
	}

	public String getIsBillBack() {
		return isBillBack;
	}

	public void setIsBillBack(String isBillBack) {
		this.isBillBack = isBillBack;
	}

	public String getServiceType() {
		return serviceType;
	}

	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}

	public String getOtherService() {
		return otherService;
	}

	public void setOtherService(String otherService) {
		this.otherService = otherService;
	}

	public Long getPrintCount() {
		return printCount;
	}

	public void setPrintCount(Long printCount) {
		this.printCount = printCount;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
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

	public BigDecimal getVolume() {
		return volume;
	}

	public void setVolume(BigDecimal volume) {
		this.volume = volume;
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

	public BigDecimal getSumPay() {
		return sumPay;
	}

	public void setSumPay(BigDecimal sumPay) {
		this.sumPay = sumPay;
	}

	public Long getOperateId() {
		return operateId;
	}

	public void setOperateId(Long operateId) {
		this.operateId = operateId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Long getOwnComId() {
		return ownComId;
	}

	public void setOwnComId(Long ownComId) {
		this.ownComId = ownComId;
	}

	public String getStowageNO() {
		return stowageNO;
	}

	public void setStowageNO(String stowageNO) {
		this.stowageNO = stowageNO;
	}

	public String getEntruckNo() {
		return entruckNo;
	}

	public void setEntruckNo(String entruckNo) {
		this.entruckNo = entruckNo;
	}

}
