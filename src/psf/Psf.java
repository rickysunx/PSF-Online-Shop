package psf;

/**
 * 常量和设置
 * 
 * @author 孙锐
 */
public class Psf {

	public static boolean running = true;
	public static String webRoot = null;

	/* OTYPE类型 */
	public static final int OTYPE_Blog = 1;
	public static final int OTYPE_Show = 2;
	public static final int OTYPE_Shopexp = 3;
	public static final int OTYPE_Guide = 4;
	public static final int OTYPE_Group = 5;
	public static final int OTYPE_Event = 6;
	public static final int OTYPE_Forward = 8;	//转发
	public static final int OTYPE_Announcement = 9;	//公告
	public static final int OTYPE_User = 10;
	public static final int OTYPE_Brand = 11;
	public static final int OTYPE_Product = 12;
	public static final int OTYPE_Event_Create = 13; //专门用于活动创建申请
	public static final int OTYPE_Ask_For_Follow = 14; //求关注
	public static final int OTYPE_Avatar = 15;
	public static final int OTYPE_Question = 16;
	public static final int OTYPE_Friend = 20;
	public static final int OTYPE_Msg = 21;

	/* 团购状态 */
	public static final int GroupbuyStatus_NotSuccess = 0; // 未成功
	public static final int GroupbuyStatus_Success = 1; // 成功
	public static final int GroupbuyStatus_Finished = 2; // 完成
	public static final int GroupbuyStatus_Expired = 3; // 失败过期
	public static final String[] GroupbuyStatuses = new String[] { "未成功", "成功", "完成", "失败过期" };

	/* 发票类型 */
	public static final int InvoiceType_NoNeed = 0; // 无需发票
	public static final int InvoiceType_Detail = 1; // 明细
	public static final int InvoiceType_Custom = 2; // 自定义
	public static final String[] InvoiceTypes = new String[] { "无需发票", "明细", "自定义" };

	/* 支付检查状态 */
	public static final int PayCheckResult_Success = 0; // 交易成功
	public static final int PayCheckResult_NetworkError = 1; // 网络异常
	public static final int PayCheckResult_NoTrans = 2; // 无此交易
	public static final int PayCheckResult_TransError = 3; // 交易失败
	public static final String[] PayCheckResults = new String[] { "交易成功", "网络异常", "无此交易", "交易失败" };

	/* 发布方式 */
	public static final int AddBy_Web = 1; // 通过网站发布
	public static final int AddBy_Mobile = 2; // 通过手机发布
	public static final String[] AddBys = new String[] { "未知", "网络", "手机" };

	/* 圈子类型 */
	public static final int GroupType_Public = 1; // 开放式
	public static final int GroupType_HalfPublic = 2; // 半开放式
	public static final int GroupType_Secret = 3; // 私密圈子
	public static final String[] GroupTypes = new String[] { "", "开放式", "半开放式", "私密圈子" };

	/* 活动参加类型 */
	public static final int JoinType_Public = 1; // 任何人都能参加
	public static final int JoinType_Invite = 2; // 只有邀请才能参加

	/* 活动邀请权限 */
	public static final int InvitePower_Creator = 1; // 只有发起人能邀请
	public static final int InvitePower_Member = 2; // 参与活动者都可以邀请

	/* 申请类型 */
	public static final int ApplyType_Apply = 1; // 申请
	public static final int ApplyType_Invite = 2; // 邀请

	/* 申请审核状态 */
	public static final int ApplyCheckStatus_NotConfirmed = 0; // 未确认
	public static final int ApplyCheckStatus_Confirmed = 1; // 确认通过
	public static final int ApplyCheckStatus_Reject = 2; // 确认拒绝
	public static final int ApplyCheckStatus_Ignore = 3; // 忽略

	/* 社交状态 */
	public static final int SnsStatus_Unknown = 0; // 保密
	public static final int SnsStatus_Single = 1; // 单身
	public static final int SnsStatus_InLove = 2; // 恋爱中
	public static final int SnsStatus_Married = 3; // 已婚

	/* 性别 */
	public static final int UserSex_Unknown =0; //保密
	public static final int UserSex_Man = 1;  //男
	public static final int UserSex_Woman = 2; //女
	
	/*工作，教育，行业，财富  公开方式 accesspower,ap_industry,ap_wealth*/
	public static final int Userinfo_Access_All = 1; //完全公开
	public static final int Userinfo_Access_ToFriend = 2; //对好友公开
	public static final int Userinfo_Access_ToFollow = 3; //对关注公开
	public static final int Userinfo_Access_Nobody = 4; //完全隐藏
	
	/* 私信权限设置 ap_msg*/
	public static final int Msg_Access_All = 1; //所有人
	public static final int Msg_Access_FriendAndFollow = 2; //好友，关注的人
	public static final int Msg_Access_Nobody = 3; //不允许任何人
	
	/* 财产类型公开方式  ap_wealthtype*/
	public static final int Wealthtype_Access_All = 1; //全部财产公开
	public static final int Wealthtype_Access_Point = 2; //只公开积分
	public static final int Wealthtype_Access_Nothing = 3; //保密
	
	/*教育经历学校类型*/
	public static final int SchoolType_University = 1; //大学
	public static final int SchoolType_Senior = 2; //高中
	public static final int SchoolType_Junior = 3; //初中
	public static final int SchoolType_Primary = 4; //小学
	public static final int SchoolType_Other = 5;	//其他
	
	/* 全文检索 */
	public static final String Index_Dir = "E:\\Workspaces\\LuceneTest\\psf_index"; // 索引目录

	/* 商品 */
	public static final int Link_Count = 4;		//商品关联的总数量
	public static final int Filter_Link = 9;	//商品筛选的总数量
	
	public static final String ShortUrlPrefix = "http://t.psf100.com/";
	public static final int ShortUrlIdLength = 5;
	
	public static final int UrlType_Normal = 0;  //普通链接
	public static final int UrlType_Video = 1;   //视频链接
	
	public static final int Session_Timeout = 3600;  //Session过期时间(秒)
	public static final String SessionId_KeyName = "psf_session_id";
	
}
