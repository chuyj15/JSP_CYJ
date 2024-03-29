package shop.dto;

import java.io.Serializable;
/**
 * Product 자바빈즈
 * -상품아이디
 * -상품명
 * -상품가격 Integer
 * -상품설명
 * -제조사
 * -분류
 * -재고 수 long
 * -상태(condition) 
 */

public class Product implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String productId;
	private String name;
	private Integer unitPrice;
	private String description;
	private String manufacturer;
	private String category;
	private long unitsInStock;
	private String condition;
	
	
	public Product() {
		
	}
	
	public Product(String productId, String name, Integer unitPrice) {
		super();
		this.productId = productId;
		this.name = name;
		this.unitPrice = unitPrice;
	}

	public String getProductId() {
		return productId;
	}


	public void setProductId(String productId) {
		this.productId = productId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public Integer getUnitPrice() {
		return unitPrice;
	}


	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getManufacturer() {
		return manufacturer;
	}


	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public long getUnitsInStock() {
		return unitsInStock;
	}


	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}


	public String getCondition() {
		return condition;
	}


	public void setCondition(String condition) {
		this.condition = condition;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
