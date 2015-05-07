<%@ page language="C#" autoeventwireup="true" masterpagefile="../../masterpages/Dialog.master" codebehind="EditVariantPrices.aspx.cs" inherits="UCommerce.Web.UI.Catalog.Dialogs.EditVariantPrices" %>

<%@ register src="../EditProductPricing.ascx" tagprefix="commerce" tagname="EditPrices" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:content id="Content2" contentplaceholderid="HeaderLabel" runat="server">
</asp:content>
<asp:content id="Content3" contentplaceholderid="ContentArea" runat="server">
	<div class="propertyPane dialog-header"></div>
	<div class="propertyPane contentPaneZero">
		<div class="propertyItems">
			<commerce:PropertyPanel ID="PropertyPanel1" runat="server">
				<commerce:EditPrices runat="server" ID="EditProductPrices" />
			</commerce:PropertyPanel>
		</div>
	</div>
	<div class="propertyPane dialog-actions">
		<div class="footerOkCancel">
			<asp:Button runat="server" ID="SaveButton" CssClass="dialog-saveButton" Text="Save" OnClick="SaveButton_Clicked" />
			<em>or</em>
			<a href="#" onclick="UCommerceClientMgr.closeModalWindow();" Class="dialog-cancelButton">Cancel</a>    
		</div>
	</div>
</asp:content>
