package psf.common;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UbbUtils {

	/*
	 * 王艳芳 add at 2011-09-05 获取 ubb 编码的纯文本字符串。
	 */
	public static String ubb2Text(String argString) {
		if (argString == null) {
			return "";
		}
		String tString = argString;
		if (!tString.equals("")) {
			Boolean tState = true;
			/*
			 * 这里的纯文本，是可以直接输出的纯文本。 如果现实到 html 中，要使用 <c:out />
			 */
			// tString = tString.replace("&", "&amp;");
			// tString = tString.replace(">", "&gt;");
			// tString = tString.replace("<", "&lt;");
			// tString = tString.replace("\"", "&quot;");
			tString = tString.replaceAll("\\[br\\]", "");
			String[][] tRegexAry = {
					{ "\\[p\\]([^\\[]*?)\\[\\/p\\]", "$1" },
					{ "\\[b\\]([^\\[]*?)\\[\\/b\\]", "$1" },
					{ "\\[i\\]([^\\[]*?)\\[\\/i\\]", "$1" },
					{ "\\[u\\]([^\\[]*?)\\[\\/u\\]", "$1" },
					{ "\\[ol\\]([^\\[]*?)\\[\\/ol\\]", "$1" },
					{ "\\[ul\\]([^\\[]*?)\\[\\/ul\\]", "$1" },
					{ "\\[li\\]([^\\[]*?)\\[\\/li\\]", "$1" },
					{ "\\[code\\]([^\\[]*?)\\[\\/code\\]", "$1" },
					{ "\\[quote\\]([^\\[]*?)\\[\\/quote\\]", "$1" },
					{ "\\[color=([^\\]]*)\\]([^\\[]*?)\\[\\/color\\]", "$2" },
					{
							"\\[hilitecolor=([^\\]]*)\\]([^\\[]*?)\\[\\/hilitecolor\\]",
							"$2" },
					{ "\\[align=([^\\]]*)\\]([^\\[]*?)\\[\\/align\\]", "$2" },
					{ "\\[url=([^\\]]*)\\]([^\\[]*?)\\[\\/url\\]", "$2" },
					{ "\\[img\\]([^\\[]*?)\\[\\/img\\]", "" } };
			while (tState) {
				tState = false;
				for (int ti = 0; ti < tRegexAry.length; ti++) {
					String tvalue1, tvalue2;
					Pattern tPattern = Pattern.compile(tRegexAry[ti][0]);
					Matcher tMatcher = tPattern.matcher(tString);
					while (tMatcher.find()) {
						tState = true;
						tvalue1 = tMatcher.group();
						tvalue2 = tRegexAry[ti][1];
						for (int tk = 1; tk < (tMatcher.groupCount() + 1); tk++)
							tvalue2 = tvalue2.replace("$" + tk,
									tMatcher.group(tk));
						tString = tString.replace(tvalue1, tvalue2);
					}
				}
			}
		}
		return tString;
	}

	public static String ubb2Html(String argString) {
		if (argString == null) {
			return "";
		}
		String tString = argString;
		if (!tString.equals("")) {
			Boolean tState = true;
			tString = tString.replace("&", "&amp;");
			tString = tString.replace(">", "&gt;");
			tString = tString.replace("<", "&lt;");
			tString = tString.replace("\"", "&quot;");
			tString = tString.replaceAll("\\[br\\]", "<br />");
			String[][] tRegexAry = {
					{ "\\[p\\]([^\\[]*?)\\[\\/p\\]", "$1<br />" },
					{ "\\[b\\]([^\\[]*?)\\[\\/b\\]", "<b>$1</b>" },
					{ "\\[i\\]([^\\[]*?)\\[\\/i\\]", "<i>$1</i>" },
					{ "\\[u\\]([^\\[]*?)\\[\\/u\\]", "<u>$1</u>" },
					{ "\\[ol\\]([^\\[]*?)\\[\\/ol\\]", "<ol>$1</ol>" },
					{ "\\[ul\\]([^\\[]*?)\\[\\/ul\\]", "<ul>$1</ul>" },
					{ "\\[li\\]([^\\[]*?)\\[\\/li\\]", "<li>$1</li>" },
					{ "\\[code\\]([^\\[]*?)\\[\\/code\\]",
							"<div class=\"ubb_code\">$1</div>" },
					{ "\\[quote\\]([^\\[]*?)\\[\\/quote\\]",
							"<div class=\"ubb_quote\">$1</div>" },
					{ "\\[color=([^\\]]*)\\]([^\\[]*?)\\[\\/color\\]",
							"<font style=\"color: $1\">$2</font>" },
					{
							"\\[hilitecolor=([^\\]]*)\\]([^\\[]*?)\\[\\/hilitecolor\\]",
							"<font style=\"background-color: $1\">$2</font>" },
					{ "\\[align=([^\\]]*)\\]([^\\[]*?)\\[\\/align\\]",
							"<div style=\"text-align: $1\">$2</div>" },
					{ "\\[url=([^\\]]*)\\]([^\\[]*?)\\[\\/url\\]",
							"<a href=\"$1\" target=\"_blank\">$2</a>" },
					{
							"\\[img\\]http://static.psf100.com/ubbeditor/([^\\[]*?)\\[\\/img\\]",
							"<img src=\"http://static.psf100.com/ubbeditor/$1\" style=\"height:19px; width:19px;\"/>" }, // 王艳芳
																															// add
																															// 2011-09-09
																															// 头像的大小要固定尺寸
					{
							"\\[img\\]([^\\[]*?)\\[\\/img\\]",
							"<a href=\"$1\" target=\"_blank\"><img src=\"$1\" onload=\"cls.img.tResize(this, 600, 1800);\" /></a>" } };
			while (tState) {
				tState = false;
				for (int ti = 0; ti < tRegexAry.length; ti++) {
					String tvalue1, tvalue2;
					Pattern tPattern = Pattern.compile(tRegexAry[ti][0]);
					Matcher tMatcher = tPattern.matcher(tString);
					while (tMatcher.find()) {
						tState = true;
						tvalue1 = tMatcher.group();
						tvalue2 = tRegexAry[ti][1];
						for (int tk = 1; tk < (tMatcher.groupCount() + 1); tk++)
							tvalue2 = tvalue2.replace("$" + tk,
									tMatcher.group(tk));
						tString = tString.replace(tvalue1, tvalue2);
					}
				}
			}
		}
		return tString;
	}
}
