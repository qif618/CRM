package com.lyf.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table
public class XiaZhuMingXi {
	@Id
	@GeneratedValue(generator="_native")
	@GenericGenerator(name="_native",strategy="native")
	private int id;
	private String qs;
	private String xzr;
	private String xzsj;
	private String xzfs;
	private String xznr;
	private String je;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getQs() {
		return qs;
	}
	public void setQs(String qs) {
		this.qs = qs;
	}
	public String getXzr() {
		return xzr;
	}
	public void setXzr(String xzr) {
		this.xzr = xzr;
	}
	public String getXzsj() {
		return xzsj;
	}
	public void setXzsj(String xzsj) {
		this.xzsj = xzsj;
	}
	public String getXzfs() {
		return xzfs;
	}
	public void setXzfs(String xzfs) {
		this.xzfs = xzfs;
	}
	public String getXznr() {
		return xznr;
	}
	public void setXznr(String xznr) {
		this.xznr = xznr;
	}
	public String getJe() {
		return je;
	}
	public void setJe(String je) {
		this.je = je;
	}
	@Override
	public String toString() {
		return "XiaZhuMingXi [qs=" + qs + ", xzr=" + xzr + ", xzsj=" + xzsj
				+ ", xzfs=" + xzfs + ", xznr=" + xznr + ", je=" + je + "]";
	}
	
	
}
