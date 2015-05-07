<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewOrderGroupOrders.ascx.cs" Inherits="UCommerce.Web.UI.Orders.ViewOrderGroupOrders" %>
<style type="text/css">
	.orderClickable
	{
	}
</style>

<script type="text/javascript">
	function openOrderView(id) {
		this.document.location.href = 'EditOrder.aspx?id=' + id;
	}

	function toggleAllCheckboxes(toggle) {
		
		$('.orderSelect input').each(function () {
			var element = $(this);
			if (element == null) {
				alert('error');
			}

			element.prop('checked', toggle);

		});
	}

	$(function () {
		$("#orderTable").dataTable(
            {
            	"bPaginate": false,
            	// disable initial sort
            	"aaSorting": [],
            	// disable sorting on first column
            	"aoColumnDefs": [
					{ 'bSortable': false, 'aTargets': [0] },
                    { 'iDataSort': 5, 'aTargets': [4] },
	                { 'bVisible': false, 'aTargets': [5] }
	            ]
            });

		$(".orderClickable").click(function () {
			openOrderView($(this).parent().data('orderid'));
		});
	});
</script>



<div class="propertyPane">

	<asp:DropDownList class="mediumWidth" runat="server" ID="FilterOrdersDropDownList" style="margin-top: 20px;" AutoPostBack="True" OnSelectedIndexChanged="FilterOrdersDropDownList_Changed" ClientIDMode="Static">
		<asp:ListItem Value="day" meta:resourcekey="Today"></asp:ListItem>
		<asp:ListItem Value="week" meta:resourcekey="ThisWeek"></asp:ListItem>
		<asp:ListItem Value="month" meta:resourcekey="ThisMonth"></asp:ListItem>
		<asp:ListItem Value="3months" meta:resourcekey="Last3Months"></asp:ListItem>
		<asp:ListItem Value="year" meta:resourcekey="ThisYear"></asp:ListItem>
		<asp:ListItem Value="all" meta:resourcekey="All"></asp:ListItem>
		<asp:ListItem Value="custom" meta:resourcekey="Custom"></asp:ListItem>
	</asp:DropDownList>
	
	<asp:Panel runat="server" Visible="False" ID="CustomFilterPanel" CssClass="customFilter">
    	<asp:PlaceHolder runat="server" ID="StartsOnDatePicker" />
		<span class="customFilterDivider">-</span>
		<asp:PlaceHolder runat="server" ID="EndsOnDatePicker" />
		<asp:Button runat="server" meta:resourcekey="Filter" ID="customFilterButton" onclick="FilterOrdersDropDownList_Changed" CssClass="mediumButton" /> 
	</asp:Panel>

	<asp:Repeater runat="server" ID="OrdersRepeater" EnableViewState="false">
		<HeaderTemplate>
			<table class="dataList" cellspacing="0" width="100%" id="orderTable">
				<thead>
					<tr>
						<th><asp:CheckBox runat="server" ID="CheckAll" OnClick="toggleAllCheckboxes($(this).is(':checked'));" /></th>
						<th><asp:Localize runat="server" meta:resourceKey="Ordernumber" /></th>
						<th><asp:Localize runat="server" meta:resourceKey="CustomerName" /></th>
						<th><asp:Localize runat="server" meta:resourceKey="Status" /></th>
						<th><asp:Localize runat="server" meta:resourceKey="CompletedDate" /></th>
						<th><asp:Localize runat="server" meta:resourceKey="CompletedDate" /></th>
						<th><asp:Localize runat="server" meta:resourceKey="CatalogSetName" /></th>
						<th><asp:Localize runat="server" meta:resourceKey="Currency" /></th>
						<th class="rightAligned" ><asp:Localize runat="server" meta:resourceKey="OrderTotal" /></th>
					</tr>
				</thead>
				<tbody>
		</HeaderTemplate>
		<ItemTemplate>
			<tr data-orderid="<%# DataBinder.Eval(Container.DataItem, "OrderId") %>" class="clickable">
				<td class="orderSelect"><asp:CheckBox runat="server" ID="purchaseOrders" Visible='<%# CanChangeOrderStatusForProductCatalogGroup((int)DataBinder.Eval(Container.DataItem, "ProductCatalogGroupId")) %>' /></td>
				<td style="padding-right: 20px" class="orderClickable"><%# DataBinder.Eval(Container.DataItem, "OrderNumber") %></td>
				<td class="orderClickable"><%# DataBinder.Eval(Container.DataItem, "CustomerName") %></td>
				<td class="orderClickable"><%# View.OrderStatus.Name %></td>
				<td class="orderClickable"><%# DataBinder.Eval(Container.DataItem, "CompletedDate") %></td>
				<td class="orderClickable"><%# GetCompletedDateTicks(Container.DataItem) %></td>
				<td class="orderClickable"><%# DataBinder.Eval(Container.DataItem, "ProductCatalogGroupName")%></td>
				<td class="orderClickable"><%# DataBinder.Eval(Container.DataItem, "BillingCurrencyIsoCode")%></td>
				<td style="padding-right: 15px" align="right" class="rightAligned orderClickable"><%# DataBinder.Eval(Container.DataItem, "OrderTotal", "{0:N}")%></td>
			</tr>
		</ItemTemplate>
		<FooterTemplate>
			</tbody>
            </table>
		</FooterTemplate>
	</asp:Repeater>
	<div class="propertyPaneFooter">-</div>
</div>
