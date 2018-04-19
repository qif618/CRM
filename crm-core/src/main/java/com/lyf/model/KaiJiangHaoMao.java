package com.lyf.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class KaiJiangHaoMao {
	@Id
	private String qs;
	
	private String pm1;
	private String pm2;
	private String pm3;
	private String pm4;
	private String pm5;
	private String pm6;
	private String tm;
	
	private String px1;
	private String px2;
	private String px3;
	private String px4;
	private String px5;
	private String px6;
	private String tx;
	
	
	public String getQs() {
		return qs;
	}
	public void setQs(String qs) {
		this.qs = qs;
	}
	public String getPm1() {
		return pm1;
	}
	public void setPm1(String pm1) {
		this.pm1 = pm1;
	}
	public String getPm2() {
		return pm2;
	}
	public void setPm2(String pm2) {
		this.pm2 = pm2;
	}
	public String getPm3() {
		return pm3;
	}
	public void setPm3(String pm3) {
		this.pm3 = pm3;
	}
	public String getPm4() {
		return pm4;
	}
	public void setPm4(String pm4) {
		this.pm4 = pm4;
	}
	public String getPm5() {
		return pm5;
	}
	public void setPm5(String pm5) {
		this.pm5 = pm5;
	}
	public String getPm6() {
		return pm6;
	}
	public void setPm6(String pm6) {
		this.pm6 = pm6;
	}
	public String getTm() {
		return tm;
	}
	public void setTm(String tm) {
		this.tm = tm;
	}
	public String getPx1() {
		return px1;
	}
	public void setPx1(String px1) {
		this.px1 = px1;
	}
	public String getPx2() {
		return px2;
	}
	public void setPx2(String px2) {
		this.px2 = px2;
	}
	public String getPx3() {
		return px3;
	}
	public void setPx3(String px3) {
		this.px3 = px3;
	}
	public String getPx4() {
		return px4;
	}
	public void setPx4(String px4) {
		this.px4 = px4;
	}
	public String getPx5() {
		return px5;
	}
	public void setPx5(String px5) {
		this.px5 = px5;
	}
	public String getPx6() {
		return px6;
	}
	public void setPx6(String px6) {
		this.px6 = px6;
	}
	public String getTx() {
		return tx;
	}
	public void setTx(String tx) {
		this.tx = tx;
	}
	@Override
	public String toString() {
		return "KaiJiangHaoMao [pm1=" + pm1 + ", pm2=" + pm2
				+ ", pm3=" + pm3 + ", pm4=" + pm4 + ", pm5=" + pm5 + ", pm6="
				+ pm6 + ", tm=" + tm + ", px1=" + px1 + ", px2=" + px2
				+ ", px3=" + px3 + ", px4=" + px4 + ", px5=" + px5 + ", px6="
				+ px6 + ", tx=" + tx + "]";
	}
	
	
	
	
}
