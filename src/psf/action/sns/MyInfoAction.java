package psf.action.sns;

import java.util.List;

import net.sf.json.JSONArray;

import psf.Psf;
import psf.PsfAction;
import psf.common.PageParam;
import psf.common.PageResult;
import psf.common.PsfTime;
import psf.common.ValidateUtil;
import psf.entity.EcsUsers;
import psf.entity.TIndustry;
import psf.entity.TUser;
import psf.entity.TUser0;
import psf.entity.TUserAccount;
import psf.entity.TUserAddress;
import psf.entity.TUserEdu;
import psf.entity.TUserJob;
import psf.entity.TZone;
import psf.framework.PsfException;
import psf.vo.sns.IndustryVO;
import psf.vo.sns.SnsUserInfoVO;
import psf.vo.sns.UserAddressVO;
import psf.vo.sns.ZoneVO;

public class MyInfoAction extends PsfAction {
	
	public void myPrivate() throws Exception {
		set("myInfoTab","private");
		Integer uid = getLoginUserId();
		TUser user = userService.queryPrivateByUid(uid);
		set("ap_msg",user.getAp_msg());
		set("ap_wealthtype",user.getAp_wealthtype());
	}
	public void updateApPrivate() throws Exception {
		try{
			Integer ap_msg = p2int("ap_msg");
			Integer ap_wealthtype = p2int("ap_wealthtype");
			Integer uid = getLoginUserId();
			if(uid == null){
				set("success",0);
				set("info","登陆后再修改");
			} else {
				userService.updatePrivateByUid(uid, ap_msg, ap_wealthtype);
				set("success",1);
			}
		}catch(Exception e){
			set("success",0);
			set("info",e.getMessage());
		}
	}
	public void bankAccount() throws Exception {
		set("myInfoTab","bankaccount");
		Integer uid = getLoginUserId();
		Integer page = p2int("page");
		if(page == null){
			page = 1;
		}
		PageParam pp = new PageParam(page,20);
		PageResult<TUserAccount> result = userService.queryAccountByUid(uid, pp);
		set("accountList",result.getList());
	}
	public void saveBankAccount() throws Exception{
		try{
			String bankname = p("bankname");
			String accountcode = p("accountcode");
			String accountname = p("accountname");

			TUserAccount account = new TUserAccount();
			account.setAccountcode(accountcode);
			account.setAccountname(accountname);
			account.setBankname(bankname);
			account.setUid(getLoginUserId());
			int accountid = userService.addAccount(account);
			set("success",1);
			set("accountid",accountid);
			
		}catch(Exception e){
			set("success",0);
			set("info",e.getMessage());
		}
	}
	public void delBankAccount() throws Exception {
		try{
			Integer accountid = p2int("accountid");
			userService.delAccount(accountid);
			set("success",1);
		}catch(Exception e){
			set("success",0);
			set("info",e.getMessage());
		}
	}
	public void saveUpdateBankAccount() throws Exception {
		try{
			String bankname = p("newbankname");
			String accountcode = p("newaccountcode");
			String accountname = p("newaccountname");
			Integer accountid = p2int("accountid");
	
			TUserAccount account = new TUserAccount();
			account.setAccountcode(accountcode);
			account.setAccountname(accountname);
			account.setBankname(bankname);
			account.setAccountid(accountid);
			account.setUid(getLoginUserId());
			userService.updateAccount(account);
			set("success",1);
		}catch(Exception e){
			set("success",0);
			set("info",e.getMessage());
		}
	}
	public void blackList() throws Exception {
		set("myInfoTab","blacklist");
		PageResult<SnsUserInfoVO> result = snsService.queryBlacklistByUid(getLoginUserId(), null);
		set("users",result.getList());
		set("count",result.getList().size());
	}
	public void address() throws Exception {
		set("myInfoTab","address");
		List<UserAddressVO> list = userService.queryUserAddressByUid(getLoginUserId());
		List<ZoneVO> listZoneVO = zoneService.queryAllZoneVO();
		JSONArray json = new JSONArray();
		json.addAll(listZoneVO);
		set("addressList",list);
		set("addedCount",list.size());
		set("toAddCount",10-list.size());
		set("zones",json.toString());
	}
	public void infoBasic() throws Exception {
		set("myInfoTab","info");
		set("infoTab","basic");
		List<ZoneVO> listZoneVO = zoneService.queryAllZoneVO();
		JSONArray json = new JSONArray();
		json.addAll(listZoneVO);
		TUser user = userService.queryUserByID(getLoginUserId());
		TZone nowzone = zoneService.queryZoneByID(user.getNowzoneid());
		TZone homezone = zoneService.queryZoneByID(user.getHomezoneid());
		set("user",user);
		set("nowzone",nowzone);
		set("homezone",homezone);
		set("zones",json.toString());
		
	}
	public void infoAvatar() throws Exception {
		set("myInfoTab","info");
		set("infoTab","avatar");
		set("user",getLoginUser());
	}
	public void infoJob() throws Exception {
		set("myInfoTab","info");
		set("infoTab","job");
		List<TUserJob> jobList = userService.queryJobByUid(getLoginUserId());
		List<IndustryVO> industryList = userService.queryAllIndustry();
		TUser my = userService.queryUserByID(getLoginUserId());
		TIndustry myIndustry = new TIndustry();
		if(my.getIndustryid() != null && my.getIndustryid() != 0){
			myIndustry = userService.queryIndustryByIndustryid(my.getIndustryid());
			set("industryid",my.getIndustryid());
		} else {
			set("industryid",0);
		}	
		JSONArray json = new JSONArray();
		json.addAll(industryList);
		set("industryList",json.toString());
		set("jobList",jobList);
		if(jobList.size() == 0 || jobList == null){
			set("accesspower",1);
		} else {
			set("accesspower",jobList.get(0).getAccesspower());	
		}
		set("parentindustryid",myIndustry.getParentid());
		set("ap_industry",my.getAp_industry());
	}
	public void saveInfoJob() throws Exception {
		try {
			String companyname = p("companyname");
			String position = p("position");
			Integer beginyear = p2int("beginyear");
			Integer beginmonth = p2int("beginmonth");
			Integer endyear = p2int("endyear");
			Integer endmonth = p2int("endmonth");
			Integer accesspower = p2int("companyaccesspower");
			
			if(companyname == null || companyname.trim().length() == 0 || "".equals(companyname)){
				throw new Exception("公司不能为空");
			} else if (position == null || position.trim().length() == 0 || "".equals(position)){
				throw new Exception("工作内容不能为空");
			} else if ( beginyear == 0 || endyear == 0 || beginmonth == 0 || endmonth == 0){
				throw new Exception("选择开始结束的工作年月");
			} else if (beginyear > endyear) { 
				throw new Exception("时间参数有误");
			} else if ( beginyear == endyear ){
				if(beginmonth > endmonth){
					throw new Exception("时间参数有误");
				}
			} else {
				TUserJob job = new TUserJob();
				job.setCompanyname(companyname);
				if(endmonth < 10){
					job.setEnddate(endyear+"0"+endmonth);
				} else {
					job.setEnddate(endyear+""+endmonth);
				}
				if(beginmonth < 10){
					job.setStartdate(beginyear+"0"+beginmonth);
				} else {
					job.setStartdate(beginyear+""+beginmonth);
				}
				job.setPosition(position);
				job.setUid(getLoginUserId());
				job.setAccesspower(accesspower);
				int jobid = userService.addJob(job);
				set("success",1);
				set("companyname",companyname);
				set("position",position);
				set("startdate",beginyear+"年"+beginmonth+"月");
				set("enddate",endyear+"年"+endmonth+"月");
				set("jobid",jobid);
			}
			
		} catch(PsfException e) {
			set("success",0);
			set("info",e.getMessage());
		} catch (Exception e) {
			set("success",0);
			set("info",e.getMessage());
		}
	}
	public void updateJob() throws Exception {
		try {
			Integer jobid = p2int("jobid");
			String companyname = p("newcompanyname");
			String position = p("newposition");
			Integer beginyear = p2int("beginyear");
			Integer beginmonth = p2int("beginmonth");
			Integer endyear = p2int("endyear");
			Integer endmonth = p2int("endmonth");
			
			if(companyname == null || companyname.trim().length() == 0 || "".equals(companyname)){
				throw new Exception("公司不能为空");
			} else if (position == null || position.trim().length() == 0 || "".equals(position)){
				throw new Exception("工作内容不能为空");
			} else if ( beginyear == 0 || endyear == 0 || beginmonth == 0 || endmonth == 0){
				throw new Exception("选择开始结束的工作年月");
			} else if (beginyear > endyear) { 
				throw new Exception("时间参数有误");
			} else if ( beginyear == endyear ){
				if(beginmonth > endmonth){
					throw new Exception("时间参数有误");
				}
			} else {
				TUserJob job = new TUserJob();
				job.setCompanyname(companyname);
				job.setStartdate(beginyear+getXX(beginmonth));
				job.setEnddate(endyear+getXX(endmonth));
				job.setPosition(position);
				job.setUid(getLoginUserId());
				job.setJobid(jobid);
				userService.updateJob(job);
				set("success",1);
				set("companyname",companyname);
				set("position",position);
				set("jobid",jobid);
				set("startdate",beginyear+"年"+beginmonth+"月");
				set("enddate",endyear+"年"+endmonth+"月");
				
			}	
		} catch(PsfException e) {
			set("success",0);
			set("info",e.getMessage());
		} catch (Exception e) {
			set("success",0);
			set("info",e.getMessage());
		}
	}
	public void delJob() throws Exception {
		Integer jobid = p2int("jobid");
		try{
			if(getLoginUserId() == null){
				set("success",0);
				set("info","请先登录");
			}
			userService.delJob(jobid);
			set("success",1);
		}catch(Exception e) {
			set("success",0);
			set("info", e.getMessage());
		}
	}
	public void setJobPower() throws Exception {
		try {
			Integer accesspower = p2int("company");
			Integer industryid = p2int("industry");
			Integer ap_industry = p2int("ap_industry");
			Integer uid = getLoginUserId();
			if( uid == null){
				set("success",0);
				set("info","请先登录");
			} else {
				userService.updateJobAccesspower(accesspower, uid);
				userService.updateIndustryByUid(uid, industryid,ap_industry);
				set("success",1);
			}
		}catch(Exception e){
			set("success",0);
			set("info",e.getMessage());
		}
	}
	
	public void infoEdu() throws Exception {
		set("myInfoTab","info");
		set("infoTab","edu");
		Integer uid = getLoginUserId();
		List<TUserEdu> universityList = userService.queryEduByUidAndSchooltype(uid,Psf.SchoolType_University );
		List<TUserEdu> seniorList = userService.queryEduByUidAndSchooltype(uid, Psf.SchoolType_Senior);
		List<TUserEdu> junionList = userService.queryEduByUidAndSchooltype(uid, Psf.SchoolType_Junior);
		List<TUserEdu> primaryList = userService.queryEduByUidAndSchooltype(uid, Psf.SchoolType_Primary);
		List<TUserEdu> otherList = userService.queryEduByUidAndSchooltype(uid, Psf.SchoolType_Other);
		set("universityList",universityList);
		set("seniorList",seniorList);
		set("junionList",junionList);
		set("primaryList",primaryList);
		set("otherList",otherList);
	}
	public void saveInfoEdu() throws Exception {
		try {
			Integer schooltype = p2int("edutime");
			String schoolname = p("schoolname");
			Integer beginyear = p2int("beginyear");
			Integer beginmonth = p2int("beginmonth");
			Integer endyear = p2int("endyear");
			Integer endmonth = p2int("endmonth");
			String classname = p("classname");

			if(schoolname == null || schoolname.trim().length() == 0 || "".equals(schoolname)){
				throw new Exception("学校不能为空");
			} else if (classname == null || classname.trim().length() == 0 || "".equals(classname)){
				throw new Exception("班级不能为空");
			} else if ( beginyear == 0 || endyear == 0 || beginmonth == 0 || endmonth == 0){
				throw new Exception("选择开始结束的工作年月");
			} else if (beginyear > endyear) { 
				throw new Exception("时间参数有误");
			} else if ( beginyear == endyear ){
				if(beginmonth > endmonth){
					throw new Exception("时间参数有误");
				}
			} else {
				TUserEdu edu = new TUserEdu();
				edu.setSchoolname(schoolname);
				edu.setSchooltype(schooltype);
				if(schooltype == Psf.SchoolType_University || schooltype == Psf.SchoolType_Other){
					edu.setMajorname(classname);
				} else {
					edu.setClassname(classname);
				}
				edu.setStartdate(beginyear+getXX(beginmonth));
				edu.setEnddate(endyear+getXX(endmonth));
				edu.setUid(getLoginUserId());
				int eduid = userService.addEdu(edu);
				set("success",1);
				set("schoolname",schoolname);
				set("classname",classname);
				set("schooltype",schooltype);
				set("startdate",beginyear+"年"+beginmonth+"月");
				set("enddate",endyear+"年"+endmonth+"月");
				set("eduid",eduid);
			}
			
		} catch(PsfException e) {
			set("success",0);
			set("info",e.getMessage());
		} catch (Exception e) {
			set("success",0);
			set("info",e.getMessage());
		}	
	}
	public void delEdu() throws Exception {
		Integer eduid = p2int("eduid");
		try{
			if(getLoginUserId() == null){
				set("success",0);
				set("info","请先登录");
			}
			userService.delEdu(eduid);
			set("success",1);
		}catch(Exception e) {
			set("success",0);
			set("info", e.getMessage());
		}
	}
	public void updateEdu() throws Exception {
		try{
			Integer schooltype = p2int("schooltypeval");
			String schoolname = p("newschoolname");
			Integer beginyear = p2int("beginyear");
			Integer beginmonth = p2int("beginmonth");
			Integer endyear = p2int("endyear");
			Integer endmonth = p2int("endmonth");
			String classname = p("newclassname");
			Integer eduid = p2int("eduid");
			
			if(schoolname == null || schoolname.trim().length() == 0 || "".equals(schoolname)){
				throw new Exception("学校不能为空");
			} else if (classname == null || classname.trim().length() == 0 || "".equals(classname)){
				throw new Exception("班级不能为空");
			} else if ( beginyear == 0 || endyear == 0 || beginmonth == 0 || endmonth == 0){
				throw new Exception("选择开始结束的工作年月");
			} else if (beginyear > endyear) { 
				throw new Exception("时间参数有误");
			} else if ( beginyear == endyear ){
				if(beginmonth > endmonth){
					throw new Exception("时间参数有误");
				}
			} else {
				TUserEdu edu = new TUserEdu();
				edu.setEduid(eduid);
				edu.setSchoolname(schoolname);
				edu.setSchooltype(schooltype);
				if(schooltype == Psf.SchoolType_University || schooltype == Psf.SchoolType_Other){
					edu.setMajorname(classname);
				} else {
					edu.setClassname(classname);
				}
				edu.setStartdate(beginyear+getXX(beginmonth));
				edu.setEnddate(endyear+getXX(endmonth));
				edu.setUid(getLoginUserId());
				userService.updateEdu(edu);
				set("success",1);
				set("schoolname",schoolname);
				set("classname",classname);
				set("schooltype",schooltype);
				set("startdate",beginyear+"年"+beginmonth+"月");
				set("enddate",endyear+"年"+endmonth+"月");
				set("eduid",eduid);
			}
		} catch(PsfException e) {
			set("success",0);
			set("info",e.getMessage());
		} catch (Exception e) {
			set("success",0);
			set("info",e.getMessage());
		}	
	}
	public void setEduPower() throws Exception {
		try {
			Integer eduid = p2int("eduid");
			if(getLoginUserId() == null){
				set("success",0);
				set("info","请先登录");
			} else {
				userService.updateEduAccesspower(eduid, 4);
				set("success",1);
			}
		}catch(Exception e){
			set("success",0);
			set("info",e.getMessage());
		}
	}
	
	public void infoMylabel() throws Exception {
		set("myInfoTab","info");
		set("infoTab","mylabel");
	}
	public void saveInfoBasic() throws Exception {
		try {
			String username = p("username");
			String realname = p("realname");
			Integer sex = p2int("sex");
			String signature = p("signature");
			Integer nowzone_city = p2int("nowzone_city");
			Integer homezone_city = p2int("homezone_city");
			String mobile = p("mobile");
			String email = p("email");
			String qq = p("qq");
			Integer snsstatus = p2int("snsstatus");
			int birthday_year = p2int("birthday_year");
			int birthday_month = p2int("birthday_month");
			int birthday_date = p2int("birthday_date");
			
			if(ValidateUtil.isNull(username)) {
				throw new PsfException("昵称不能为空");
			}
			if(sex==null) sex = 0;
			if(sex.intValue()<0 || sex.intValue()>3) throw new Exception("性别参数不合法");
			if(!ValidateUtil.isNull(email)) {
				if(!ValidateUtil.isEmail(email)) {
					throw new Exception("Email地址格式不对");
				}
			}
			if(snsstatus==null) snsstatus=0;
			if(snsstatus.intValue()<0 || snsstatus.intValue()>3) {
				throw new PsfException("交友状态参数不合法");
			}
			if(birthday_year!=0) {
				if(!(birthday_year>1900 && birthday_year<2030)) throw new Exception ("出生年份参数不合法");
				if(!(birthday_month>=1 && birthday_month<=12)) throw new Exception("出生月份参数不合法");
				if(!(birthday_date>=1 && birthday_date<=PsfTime.getDaysByMonth(birthday_year, birthday_month))) {
					throw new Exception("出生日期参数不合法");
				}
			}
			
			Integer uid = getLoginUserId();
			
			if(userService.usernameExists(uid,username)) {
				throw new Exception("昵称已经存在");
			}
			
			if(userService.emailExists(uid,email)) {
				throw new Exception("邮箱已经存在");
			}
			
			TUser0 user = userService.queryUser0ByID(uid);
			user.setRealname(realname);
			user.setSex(sex);
			user.setSignature(signature);
			user.setNowzoneid(nowzone_city);
			user.setHomezoneid(homezone_city);
			user.setSnsstatus(snsstatus);
			if(birthday_year==0) {
				user.setBirthday(null);
			} else {
				user.setBirthday(""+birthday_year+getXX(birthday_month)+getXX(birthday_date));
			}
			userService.updateUser(user);
			
			EcsUsers ecsUser = userService.queryEcsUser(uid);
			ecsUser.setUser_name(username);
			ecsUser.setMobile_phone(mobile);
			ecsUser.setEmail(email);
			ecsUser.setQq(qq);
			userService.updateEcsUser(ecsUser);
			
			set("success",1);
		} catch(PsfException e) {
			set("success",0);
			set("info",e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			set("success",0);
			set("info",e.getMessage());
		}
	}
	public void delBlackList() throws Exception {
		try {
			Integer blockuid = p2int("blockuid");
			Integer uid = getLoginUserId();
			if(uid == null) {
				set("success",0);
				set("info","请先登录");
			} else {
				snsService.delBlackList(uid, blockuid);
				set("success",1);
			}	
		}catch(Exception e){
			set("success",0);
			set("info",e.getMessage());
		}
	}
	
	public void saveAddress() throws Exception {
		try{
			String consignee = p("consignee");
			Integer address_city = p2int("address_city");
			String address = p("address");
			String telnum1 = p("telnum1");
			String telnum2 = p("telnum2");
			String telnum3 = p("telnum3");
			String phone = p("phone");
			Integer uid = getLoginUserId();
			List<UserAddressVO> list = userService.queryUserAddressByUid(uid);
			TZone cityZone = zoneService.queryZoneByID(address_city);
			TZone pZone = zoneService.queryZoneByID(cityZone.getLevel1id());
			if(uid == null) {
				set("success",0);
				set("info","请先登录");
			} else if(consignee.trim().length() == 0){
				set("success",0);
				set("info","收件人错误");
			} else if(address.trim().length() == 0){
				set("success",0);
				set("info","地址错误");
			} else if(list.size() == 10) {
				set("success",0);
				set("info","只能添加10个收获地址");
			} else {
				TUserAddress userAddress = new TUserAddress();
				userAddress.setAddress(address);
				userAddress.setConsignee(consignee);
				userAddress.setExpresszoneid(address_city);
				userAddress.setIsdefault(0);
				userAddress.setUid(uid);
				if(telnum1.trim().length() != 0 && telnum2.trim().length() != 0){
					if(telnum3.trim().length() != 0){
						userAddress.setPhone1(telnum1+"-"+telnum2+"-"+telnum3);
					} else {
						userAddress.setPhone1(telnum1+"-"+telnum2);
					}
				}
				userAddress.setPhone2(phone);
				int addressid = userService.addUserAddress(userAddress);
				set("zonename",	pZone.getZonename()+" "+cityZone.getZonename());
				set("addressid",addressid);
				if(telnum1.trim().length() != 0 && telnum2.trim().length() != 0 && telnum3.trim().length() != 0){
					set("tel",telnum1+"-"+telnum2+"-"+telnum3);
				} else if (telnum1.trim().length() != 0 && telnum2.trim().length() != 0){
					set("tel",telnum1+"-"+telnum2);
				}
				set("success",1);
			}	
		}catch(Exception e){
			set("success",0);
			set("info",e.getMessage());
		}
	}
	public void setDefaultAddress() throws Exception {
		try{
			Integer addressid = p2int("addressid");
			Integer uid = getLoginUserId();
			if(uid == null) {
				set("success",0);
				set("info","请先登录");
			} else {
				userService.updateDefaultAddress(addressid, uid);
				set("success",1);
			}
		}catch(Exception e){
			set("success",0);
			set("info",e.getMessage());
		}
	}
	public void delAddress() throws Exception {
		try{
			Integer addressid = p2int("addressid");
			Integer uid = getLoginUserId();
			if(uid == null) {
				set("success",0);
				set("info","请先登录");
			} else {
				userService.delAddress(addressid);	
				set("success",1);
			}
		}catch(Exception e){
			set("success",0);
			set("info",e.getMessage());
		}
	}
	public void updateAddress() throws Exception {
		try{
			String consignee = p("newconsignee");
			Integer address_city = p2int("newaddress_city");
			String address = p("newaddress");
			String post = p("newpost");
			String telnum1 = p("newtelnum1");
			String telnum2 = p("newtelnum2");
			String telnum3 = p("newtelnum3");
			String phone = p("newphone");
			Integer uid = getLoginUserId();
			Integer addressid = p2int("addressid");
			TUserAddress useraddress = userService.queryUserAddressByAddressid(addressid);
			TZone cityZone = zoneService.queryZoneByID(address_city);
			TZone pZone = zoneService.queryZoneByID(cityZone.getLevel1id());
			if(uid == null) {
				set("success",0);
				set("info","请先登录");
			} else if(consignee.trim().length() == 0){
				set("success",0);
				set("info","收件人错误");
			} else if(address.trim().length() == 0){
				set("success",0);
				set("info","地址错误");
			} else {
				TUserAddress userAddress = new TUserAddress();
				userAddress.setAddress(address);
				userAddress.setConsignee(consignee);
				userAddress.setExpresszoneid(address_city);
				userAddress.setIsdefault(useraddress.getIsdefault());
				userAddress.setUid(uid);
				userAddress.setAddressid(addressid);
				if(telnum1.trim().length() != 0 && telnum2.trim().length() != 0){
					if(telnum3.trim().length() != 0){
						userAddress.setPhone1(telnum1+"-"+telnum2+"-"+telnum3);
					} else {
						userAddress.setPhone1(telnum1+"-"+telnum2);
					}
				}
				userAddress.setPhone2(phone);
				userService.updateAddress(userAddress);
				set("addressid",addressid);
				set("zonename",	pZone.getZonename()+" "+cityZone.getZonename());
				set("success",1);
			}	
		}catch(Exception e){
			set("success",0);
			set("info",e.getMessage());
		}
	}
	public String getXX(int n) {
		return (n<10)?("0"+n):(""+n);
	}
}
