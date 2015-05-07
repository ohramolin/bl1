<%@ Language="C#" MasterPageFile="../../masterpages/Dialog.master" AutoEventWireup="true" CodeBehind="SelectFreeGiftProduct.aspx.cs" Inherits="UCommerce.Web.UI.UCommerce.Catalog.Dialogs.SelectFreeGiftProduct" %>

<%@ import namespace="UCommerce.Web.UI.Catalog.Dialogs" %>
<%@ register tagprefix="uc" tagname="catalogItemselector" src="CatalogItemSelector.ascx" %>
<asp:content id="Content1" contentplaceholderid="head" runat="server">
</asp:content>
<asp:content id="Content2" contentplaceholderid="HeaderLabel" runat="server">
    <asp:Localize ID="Localize5" runat="server" meta:resourceKey="Header" />
</asp:content>
<asp:content id="Content3" contentplaceholderid="ContentArea" runat="server">
	<div class="propertyPane dialog-header">
		<h3>
			<span>
				<%= GetLocalResourceObject("Header.Text") %>
			</span>
		</h3>
		<div>
			<p class="guiDialogTiny">
				<%= GetLocalResourceObject("SubHeader.Text") %>
			</p>
		</div>
    </div>
	<div class="propertyPane contentFreeGift">
		<div class="propertyItems">
			<uc:catalogItemselector runat="server" id="catalogItemSelector" selecttype="<%# CatalogItemType.Sellable %>"
				 />
		</div>
		<div class="propertyPaneFooter"></div>
	</div>
    <div class="propertyPane dialog-actions">
	    <div class="footerOkCancel">
			<asp:Button id="SaveButton" CssClass="dialog-saveButton" runat="server" onclick="SaveButton_Clicked" />
			<em><%= GetLocalResourceObject("Or.Text") %> </em>
			<a href="#" class="dialog-cancelButton" onclick="UCommerceClientMgr.closeModalWindow()">
				<%= GetLocalResourceObject("CancelButton.Text") %>
			</a>
		</div>
    </div>
</asp:content>