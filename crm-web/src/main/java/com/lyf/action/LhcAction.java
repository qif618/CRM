package com.lyf.action;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.lyf.dao.IKaiJiangHaoMaoDao;
import com.lyf.dao.IXiaZhuMingXiDao;
import com.lyf.model.KaiJiangHaoMao;
import com.lyf.model.XiaZhuMingXi;
import com.lyf.web.ReadExcel;

@Controller
@RequestMapping("/lhc")
public class LhcAction {
	@Autowired
	private IKaiJiangHaoMaoDao kjhmDao;
	@Autowired
	private IXiaZhuMingXiDao xzmxDao;
	
	@RequestMapping(value="/kjhmList.jhtml")
	public String kjhmList(Model model) {
		List<KaiJiangHaoMao> kjhmList = kjhmDao.kjhmList();
		model.addAttribute("kjhmList", kjhmList);
		return "lhc/kjhmList";
	}
	
	@RequestMapping(value="/toKjhmInsert.jhtml")
	public String toKjhmInsert() {
		return "lhc/kjhmInsert";
	}
	/**
	 * 输入号码，注入对应肖
	 * @param kjhm
	 * @return
	 */
	@RequestMapping(value="/kjhmInsert.jhtml")
	public String kjhmInsert(KaiJiangHaoMao kjhm) {
		List<String> list = new ArrayList<>();
		list.add(kjhm.getPm1());
		list.add(kjhm.getPm2());
		list.add(kjhm.getPm3());
		list.add(kjhm.getPm4());
		list.add(kjhm.getPm5());
		list.add(kjhm.getPm6());
		list.add(kjhm.getTm());
		String ptx = "";
		for(int i=0;i<list.size();i++){
			if("01,13,25,37,49".contains(list.get(i))){
				ptx = "猴";
			}else if("02,14,26,38".contains(list.get(i))){
				ptx = "羊";
			}else if("03,15,27,39".contains(list.get(i))){
				ptx = "马";
			}else if("04,16,28,40".contains(list.get(i))){
				ptx = "蛇";
			}else if("05,17,29,41".contains(list.get(i))){
				ptx = "龙";
			}else if("06,18,30,42".contains(list.get(i))){
				ptx = "兔";
			}else if("07,19,31,43".contains(list.get(i))){
				ptx = "虎";
			}else if("08,20,32,44".contains(list.get(i))){
				ptx = "牛";
			}else if("09,21,33,45".contains(list.get(i))){
				ptx = "鼠";
			}else if("10,22,34,46".contains(list.get(i))){
				ptx = "猪";
			}else if("11,23,35,47".contains(list.get(i))){
				ptx = "狗";
			}else if("12,24,36,48".contains(list.get(i))){
				ptx = "鸡";
			}
			if(i==0){
				kjhm.setPx1(ptx);
			}else if(i==1){
				kjhm.setPx2(ptx);
			}else if(i==2){
				kjhm.setPx3(ptx);
			}else if(i==3){
				kjhm.setPx4(ptx);
			}else if(i==4){
				kjhm.setPx5(ptx);
			}else if(i==5){
				kjhm.setPx6(ptx);
			}else if(i==6){
				kjhm.setTx(ptx);
			}
		}
		System.out.println("保存号码"+kjhm);
		kjhmDao.save(kjhm);
		return "redirect:/lhc/kjhmList.jhtml";
	}
	
     @RequestMapping(value = "/import.jhtml", method = RequestMethod.POST)
     public String batchimport(@RequestParam(value="filename") MultipartFile file,HttpServletRequest request,HttpServletResponse response) throws IOException{
    	 System.out.println("开始导入");
         //判断文件是否为空
         if(file==null) {
        	 System.out.println("文件为空");
        	 return null;
         }
         //获取文件名
         String name=file.getOriginalFilename();
         //进一步判断文件是否为空（即判断其大小是否为0或其名称是否为null）
         long size=file.getSize();
         System.out.println("文件名："+name+"，文件大小："+size);
         if(name==null || ("").equals(name) && size==0){
        	 System.out.println("文件名或者大小为空");
        	 return null;
         }
         //批量导入。参数：文件名，文件。
         boolean b = batchImport(name,file);
         if(b){
              String Msg ="批量导入EXCEL成功！";
              System.out.println(Msg);
         }else{
              String Msg ="批量导入EXCEL失败！";
              System.out.println(Msg);
         } 
         return "redirect:/lhc/viewList.jhtml";
     }
	         
     //批量导入客户
     public boolean batchImport(String name,MultipartFile file){
    	 System.out.println("进到Import方法");
         boolean b = false;
         //创建处理EXCEL
         ReadExcel readExcel=new ReadExcel();
         //解析excel，获取客户信息集合。
         List<XiaZhuMingXi> xzmxList = readExcel.getExcelInfo(name ,file);
         System.out.println("list长度："+xzmxList.size()+"明细："+xzmxList.toString());
         if(xzmxList != null){
             b = true;
         }
         
         //迭代添加客户信息（注：实际上这里也可以直接将customerList集合作为参数，在Mybatis的相应映射文件中使用foreach标签进行批量添加。）
         for(XiaZhuMingXi xzmx:xzmxList){
             xzmxDao.saveXzmx(xzmx);;
         }
         return b;
     }
     
     
	@RequestMapping("/allzhongjiang.jhtml")
	public  String allzhongjiang(HttpServletRequest request,Model model) throws UnsupportedEncodingException{
		String qs = request.getParameter("qs");
		String xzr = request.getParameter("xzr");
		List<XiaZhuMingXi> list = null;
		if(xzr!=null&&!xzr.equals("")){
			xzr = new String(xzr.getBytes("ISO-8859-1"), "UTF-8"); //get请求默认编码ISO-8859-1，需转换
			list = xzmxDao.xzmxListByQsAndXzr(qs,xzr);//获取本期所有投注
		}else{
			list = xzmxDao.xzmxListByQs(qs);//获取本期所有投注
		}
		String xzfs1 = "一肖#二连肖#三连肖#四连肖#五连肖#平特一码#特码#二全中#三中二#三全中";
		String xzfs2 = "五不中#六不中#七不中#八不中#九不中#十不中#十一不中#十二不中";
		System.out.println("期数："+qs);
		KaiJiangHaoMao kjhm = kjhmDao.getKjhmByQs(qs);
		List<String> kjhmPT = new ArrayList<>();
		List<XiaZhuMingXi> zjmxList = new ArrayList<>();//中奖List
		kjhmPT.add(kjhm.getPm1());
		kjhmPT.add(kjhm.getPm2());
		kjhmPT.add(kjhm.getPm3());
		kjhmPT.add(kjhm.getPm4());
		kjhmPT.add(kjhm.getPm5());
		kjhmPT.add(kjhm.getPm6());
		kjhmPT.add(kjhm.getTm());
		kjhmPT.add(kjhm.getPx1());
		kjhmPT.add(kjhm.getPx2());
		kjhmPT.add(kjhm.getPx3());
		kjhmPT.add(kjhm.getPx4());
		kjhmPT.add(kjhm.getPx5());
		kjhmPT.add(kjhm.getPx6());
		kjhmPT.add(kjhm.getTx());
		
		System.out.println("list:"+list.size());
		String xzmxStr[];
		for(XiaZhuMingXi xzmx: list){
			xzmxStr = xzmx.getXznr().split(",");//下注内容
			boolean flag = true;
			System.out.println("下注方法:"+xzmx.getXzfs());
			if(xzfs1.contains(xzmx.getXzfs())){
				System.out.println("买中的");
				int szeFlag = 0;
				for(String xzx : xzmxStr){
					if("特码".equals(xzmx.getXzfs())){
						System.out.println("下注特码："+xzx);
						if(!kjhm.getTm().equals(xzx)){
							flag = false;
							break;
						}
					}else if(xzmx.getXzfs().equals("三中二")){
						System.out.println("买三中二");
						if(kjhmPT.contains(xzx)&&!kjhm.getTm().equals(xzx)){
							System.out.println("下注方式:"+xzmx.getXzfs()+",中的："+xzx);
							szeFlag++;
						}
					}else if(!kjhmPT.contains(xzx)){
						System.out.println("下注方式:"+xzmx.getXzfs()+",有不中的："+xzx);
						flag = false;
						break;//只要有一个不在list里面，跳出循环
					}
				}
				System.out.println("szeFlag:"+szeFlag);
				if(xzmx.getXzfs().equals("三中二")&&szeFlag<2){
					flag = false;
				}
			}else if(xzfs2.contains(xzmx.getXzfs())){
				for(String xzx : xzmxStr){
					if(kjhmPT.contains(xzx)){
						System.out.println("下注方式:"+xzmx.getXzfs()+",有不准的："+xzx);
						flag = false;
						break;//只要有一个不在list里面，跳出循环
					}
				}
			}
			if(flag){
				System.out.println("中奖："+xzmx.getXznr());
				zjmxList.add(xzmx);
			}
		}
		model.addAttribute("zjmxList", zjmxList);
		model.addAttribute("kjhm", kjhm);
		return "lhc/allzhongjiangList";
	}
	
	public static void main(String[] args){
		String xzfs1 = "一肖#二连肖#三连肖#四连肖#五连肖#平特一码#特码#二全中#三中二#三全中";
		String xzfs2 = "五不中#六不中#七不中#八不中#九不中#十不中#十一不中#十二不中";
		KaiJiangHaoMao kjhm = new KaiJiangHaoMao();
		XiaZhuMingXi xzmx2 = new XiaZhuMingXi();
		xzmx2.setXzfs("三中二");
		xzmx2.setXznr("18,40,09");
		kjhm.setPm1("13");
		kjhm.setPm2("01");
		kjhm.setPm3("35");
		kjhm.setPm4("16");
		kjhm.setPm5("18");
		kjhm.setPm6("02");
		kjhm.setTm("49");
		kjhm.setPx1("猴");
		kjhm.setPx2("猴");
		kjhm.setPx3("狗");
		kjhm.setPx4("蛇");
		kjhm.setPx5("兔");
		kjhm.setPx6("羊");
		kjhm.setTx("猴");
		
		List<String> kjhmPT = new ArrayList<>();
		kjhmPT.add(kjhm.getPm1());
		kjhmPT.add(kjhm.getPm2());
		kjhmPT.add(kjhm.getPm3());
		kjhmPT.add(kjhm.getPm4());
		kjhmPT.add(kjhm.getPm5());
		kjhmPT.add(kjhm.getPm6());
		kjhmPT.add(kjhm.getTm());
		kjhmPT.add(kjhm.getPx1());
		kjhmPT.add(kjhm.getPx2());
		kjhmPT.add(kjhm.getPx3());
		kjhmPT.add(kjhm.getPx4());
		kjhmPT.add(kjhm.getPx5());
		kjhmPT.add(kjhm.getPx6());
		kjhmPT.add(kjhm.getTx());
		List<XiaZhuMingXi> list = new ArrayList<>();
		list.add(xzmx2);
		String xzmxStr[];
		for(XiaZhuMingXi xzmx: list){
			xzmxStr = xzmx.getXznr().split(",");//下注内容
			boolean flag = true;
			if(xzfs1.contains(xzmx.getXzfs())){
				int szeFlag = 0;
				for(String xzx : xzmxStr){
					if("特码".equals(xzmx.getXzfs())){
						System.out.println("下注特码："+xzx);
						if(!kjhm.getTm().equals(xzx)){
							flag = false;
							break;
						}
					}else if(xzmx.getXzfs().equals("三中二")){
						if(kjhmPT.contains(xzx)&&!kjhm.getTm().equals(xzx)){
							System.out.println("下注方式:"+xzmx.getXzfs()+",中的："+xzx);
							szeFlag++;
						}
					}else if(!kjhmPT.contains(xzx)){
						System.out.println("下注方式:"+xzmx.getXzfs()+",有不中的："+xzx);
						flag = false;
						break;//只要有一个不在list里面，跳出循环
					}
				}
				System.out.println("szeFlag:"+szeFlag);
				if(szeFlag<2){
					flag = false;
					break;
				}
			}else if(xzfs2.contains(xzmx.getXzfs())){
				System.out.println("买不中的");
				for(String xzx : xzmxStr){
					if(kjhmPT.contains(xzx)){
						System.out.println("下注方式:"+xzmx.getXzfs()+",有不准的："+xzx);
						flag = false;
						break;//只要有一个不在list里面，跳出循环
					}
				}
			}
			if(flag){
				System.out.println("中奖："+xzmx.getXznr());
			}
		}
	}
	
	@RequestMapping(value="/xzEveryList.jhtml")
	public String xzEveryList(HttpServletRequest request,Model model) throws UnsupportedEncodingException {
		 String xzr = request.getParameter("xzr");
		 xzr = new String(xzr.getBytes("ISO-8859-1"), "UTF-8"); //get请求默认编码ISO-8859-1，需转换
		System.out.println("下注人："+xzr);
		List<Map<String,Object>> alljeList = xzmxDao.allXzmxByXzr(xzr);
		model.addAttribute("alljeList", alljeList);
		return "lhc/xzEveryList";
	}
	
	
	@RequestMapping(value="/xzList.jhtml")
	public String xzList(HttpServletRequest request,Model model) {
		String qs = request.getParameter("qs");
		System.out.println("下注期数："+qs);
		List<XiaZhuMingXi> xzmxList = xzmxDao.xzmxListByQs(qs);
		KaiJiangHaoMao kjhm =kjhmDao.getKjhmByQs(qs);
		model.addAttribute("kjhm", kjhm);
		model.addAttribute("xzmxList", xzmxList);
		return "lhc/xzList";
	}
	
	@RequestMapping(value="/xzListByXzrAndQs.jhtml")
	public String xzListByXzrAndQs(HttpServletRequest request,Model model) throws UnsupportedEncodingException {
		String qs = request.getParameter("qs");
		String xzr = request.getParameter("xzr");
		 xzr = new String(xzr.getBytes("ISO-8859-1"), "UTF-8"); //get请求默认编码ISO-8859-1，需转换
		System.out.println("下注期数："+qs);
		List<XiaZhuMingXi> xzmxList = xzmxDao.xzmxListByQsAndXzr(qs,xzr);
		KaiJiangHaoMao kjhm =kjhmDao.getKjhmByQs(qs);
		model.addAttribute("kjhm", kjhm);
		model.addAttribute("xzmxList", xzmxList);
		return "lhc/xzList";
	}
	
	
	@RequestMapping(value="/xzrList.jhtml")
	public void xzrList(HttpServletResponse response) throws IOException {
		System.out.println("来，获取");
		List<String> xzrList = xzmxDao.xzrList();
		response.setContentType("text/html;charset=UTF-8");
		JSONArray subMsgs = JSONArray.fromObject(xzrList);
		System.out.println(subMsgs.toString());
    	response.getWriter().print(subMsgs.toString());
	}
	
	@RequestMapping(value="/viewList.jhtml")
	public String viewList(Model model) {
		System.out.println("总览");
		List<Map<String, Object>> mqzeList = xzmxDao.allXzmx();
		model.addAttribute("mqzeList", mqzeList);
		return "lhc/viewList";
	}
	
	
}










