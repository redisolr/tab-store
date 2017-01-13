package com.tab.common.pojo;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonProperty;

@SuppressWarnings("serial")
public class Ad1Node implements Serializable{

	private int height;
	@JsonProperty("width")
	private int weight;
	private int heightB;
	@JsonProperty("widthB")
	private int weightB;
	private String src;
	private String srcB;
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	private String href;
	private String alt;
	private String content;
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public int getHeightB() {
		return heightB;
	}
	public void setHeightB(int heightB) {
		this.heightB = heightB;
	}
	public int getWeightB() {
		return weightB;
	}
	public void setWeightB(int weightB) {
		this.weightB = weightB;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	public String getSrcB() {
		return srcB;
	}
	public void setSrcB(String srcB) {
		this.srcB = srcB;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	public String getAlt() {
		return alt;
	}
	public void setAlt(String alt) {
		this.alt = alt;
	}
	
	
	
}
