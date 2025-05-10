package com.sparetrack.model;

public class PurchaseOrder {
	private int orderId;
    private int partId;
    private int supplierId;
    private int quantityOrdered;
    private String orderDate;
    private String receivedDate;
    private int orderedBy;

    // Extra fields from view_purchaseorders
    private String partName;
    private String supplierName;
    private String orderedByName;
    
	public int getOrderId() {
		return orderId;
	}
	public int getPartId() {
		return partId;
	}
	public int getSupplierId() {
		return supplierId;
	}
	public int getQuantityOrdered() {
		return quantityOrdered;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public String getReceivedDate() {
		return receivedDate;
	}
	public int getOrderedBy() {
		return orderedBy;
	}
	public String getPartName() {
		return partName;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public String getOrderedByName() {
		return orderedByName;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public void setPartId(int partId) {
		this.partId = partId;
	}
	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}
	public void setQuantityOrdered(int quantityOrdered) {
		this.quantityOrdered = quantityOrdered;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public void setReceivedDate(String receivedDate) {
		this.receivedDate = receivedDate;
	}
	public void setOrderedBy(int orderedBy) {
		this.orderedBy = orderedBy;
	}
	public void setPartName(String partName) {
		this.partName = partName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public void setOrderedByName(String orderedByName) {
		this.orderedByName = orderedByName;
	}
}