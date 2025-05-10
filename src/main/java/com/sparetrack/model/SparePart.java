package com.sparetrack.model;

public class SparePart {
	private int partId;
    private String partName;
    private String category;
    private String modelNumber;
    private String brand;
    private int quantityInStock;
    private double unitPrice;
    private String description;
    
	public int getPartId() {
		return partId;
	}
	public String getPartName() {
		return partName;
	}
	public String getCategory() {
		return category;
	}
	public String getModelNumber() {
		return modelNumber;
	}
	public String getBrand() {
		return brand;
	}
	public int getQuantityInStock() {
		return quantityInStock;
	}
	public double getUnitPrice() {
		return unitPrice;
	}
	public String getDescription() {
		return description;
	}
	public void setPartId(int partId) {
		this.partId = partId;
	}
	public void setPartName(String partName) {
		this.partName = partName;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public void setModelNumber(String modelNumber) {
		this.modelNumber = modelNumber;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public void setQuantityInStock(int quantityInStock) {
		this.quantityInStock = quantityInStock;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}