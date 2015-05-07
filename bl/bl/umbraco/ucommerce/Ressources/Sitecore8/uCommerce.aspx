<%@ page language="C#" autoeventwireup="true" codebehind="uCommerce.aspx.cs" inherits="UCommerce.Web.UI.UCommerce.Ressources.Sitecore8.uCommerce" %>
<%@ Register TagPrefix="uc" Namespace="UCommerce.Web.Shell.Web.Controls" Assembly="UCommerce.Web.Shell" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title> 
	<uc:ClientDependencyShell runat="server" id="ClientDependency" />
    <asp:PlaceHolder runat="server" ID="JavaScriptPlaceHolder"></asp:PlaceHolder>
    <asp:PlaceHolder runat="server" ID="CssPlaceHolder"></asp:PlaceHolder>
</head>
<body>
	<div id="uCommerceHeader">
		<a href="/sitecore/shell/sitecore/client/applications/launchpad" id="ctl10_globalLogo" class="sc-global-logo"></a>
	</div>
	<iframe id="uCommerce-contentFrame" src="/Sitecore%20Modules/shell/ucommerce/shell/index.aspx"></iframe>
</body>
</html>
