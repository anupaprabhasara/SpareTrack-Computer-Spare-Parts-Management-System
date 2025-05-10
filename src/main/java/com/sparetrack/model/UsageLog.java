package com.sparetrack.model;

public class UsageLog {
	private int usageId;
    private int partId;
    private int quantityUsed;
    private int usedBy;
    private String usageContext;
    private String usageDate;

    // Extra fields from view_usagelogs
    private String partName;
    private String usedByName;
    
	public int getUsageId() {
		return usageId;
	}
	public int getPartId() {
		return partId;
	}
	public int getQuantityUsed() {
		return quantityUsed;
	}
	public int getUsedBy() {
		return usedBy;
	}
	public String getUsageContext() {
		return usageContext;
	}
	public String getUsageDate() {
		return usageDate;
	}
	public String getPartName() {
		return partName;
	}
	public String getUsedByName() {
		return usedByName;
	}
	public void setUsageId(int usageId) {
		this.usageId = usageId;
	}
	public void setPartId(int partId) {
		this.partId = partId;
	}
	public void setQuantityUsed(int quantityUsed) {
		this.quantityUsed = quantityUsed;
	}
	public void setUsedBy(int usedBy) {
		this.usedBy = usedBy;
	}
	public void setUsageContext(String usageContext) {
		this.usageContext = usageContext;
	}
	public void setUsageDate(String usageDate) {
		this.usageDate = usageDate;
	}
	public void setPartName(String partName) {
		this.partName = partName;
	}
	public void setUsedByName(String usedByName) {
		this.usedByName = usedByName;
	}
}