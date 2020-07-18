package com.hurtownia.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	@Column(name = "name")
	private String name;

	@Column(name = "uniquename")
	private String uniquename;

	@Column(name = "title")
	private String title;

	@Column(name = "kod")
	private String kod;

	@Column(name = "categoryname")
	private String categoryname;

	@Column(name = "categoryid")
	private long categoryid;

	@Column(name = "imgurlsmall")
	private String imgurlsmall;

	@Column(name = "imgurlbig")
	private String imgurlbig;

	@Column(name = "brand")
	private String brand;

	@Column(name = "providername")
	private String providername;

	@Column(name = "provideremail")
	private String provideremail;

	@Column(name = "providerphone")
	private String providerphone;

	@Column(name = "providerwebsite")
	private String providerwebsite;

	@Column(name = "quantity")
	private int quantity;

	@Column(name = "soldnumber")
	private int soldnumber;

	@Column(name = "discription", columnDefinition = "TEXT")
	private String discription;

	@Column(name = "price")
	private Float price;

	@Column(name = "originprice")
	private Float originprice;

	@Column(name = "isactivated")
	private int isactivated = 1;

	@Column(name = "createddate")
	private String createddate;

	@Column(name = "modifieddate")
	private String modifieddate;

	@Column(name = "type")
	private String type;

	@Column(name = "size")
	private String size;

	@Column(name = "color")
	private String color;

	@Column(name = "pack")
	private int pack = 0;

	@Column(name = "carton")
	private int carton = 0;

	// getters and setters
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUniquename() {
		return uniquename;
	}

	public void setUniquename(String uniquename) {
		this.uniquename = uniquename;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCategoryname() {
		return categoryname;
	}

	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}

	public long getCategoryid() {
		return categoryid;
	}

	public void setCategoryid(long categoryid) {
		this.categoryid = categoryid;
	}

	public String getImgurlsmall() {
		return imgurlsmall;
	}

	public void setImgurlsmall(String imgurlsmall) {
		this.imgurlsmall = imgurlsmall;
	}

	public String getImgurlbig() {
		return imgurlbig;
	}

	public void setImgurlbig(String imgurlbig) {
		this.imgurlbig = imgurlbig;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getProvidername() {
		return providername;
	}

	public void setProvidername(String providername) {
		this.providername = providername;
	}

	public String getProvideremail() {
		return provideremail;
	}

	public void setProvideremail(String provideremail) {
		this.provideremail = provideremail;
	}

	public String getProviderphone() {
		return providerphone;
	}

	public void setProviderphone(String providerphone) {
		this.providerphone = providerphone;
	}

	public String getProviderwebsite() {
		return providerwebsite;
	}

	public void setProviderwebsite(String providerwebsite) {
		this.providerwebsite = providerwebsite;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getSoldnumber() {
		return soldnumber;
	}

	public void setSoldnumber(int soldnumber) {
		this.soldnumber = soldnumber;
	}

	public String getDiscription() {
		return discription;
	}

	public void setDiscription(String discription) {
		this.discription = discription;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public int getIsactivated() {
		return isactivated;
	}

	public void setIsactivated(int isactivated) {
		this.isactivated = isactivated;
	}

	public String getCreateddate() {
		return createddate;
	}

	public void setCreateddate(String createddate) {
		this.createddate = createddate;
	}

	public String getModifieddate() {
		return modifieddate;
	}

	public void setModifieddate(String modifieddate) {
		this.modifieddate = modifieddate;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKod() {
		return kod;
	}

	public void setKod(String kod) {
		this.kod = kod;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getPack() {
		return pack;
	}

	public void setPack(int pack) {
		this.pack = pack;
	}

	public int getCarton() {
		return carton;
	}

	public void setCarton(int carton) {
		this.carton = carton;
	}

	public Float getOriginprice() {
		return originprice;
	}

	public void setOriginprice(Float originprice) {
		this.originprice = originprice;
	}

}
