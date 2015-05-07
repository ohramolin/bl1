<%@ control language="C#" autoeventwireup="true" codebehind="Sorter.ascx.cs" inherits="UCommerce.Web.UI.UCommerce.Controls.Sorter" %>
<div class="sorterContainer">
	<div id="sectionGroup">
		<div class="propertyPane" style="margin-top: 20px;">
		<asp:repeater runat="server" id="SortingRepeater" DataSource="<%# DataSource %>">
			<HeaderTemplate>
				<table id="sortable" cellspacing="0" class="dataList">
					<thead>
						<tr>
							<th style="min-width: 200px;">
								<asp:localize id="Localize1" runat="server" meta:resourcekey="NameColumn" Text="Name(*)" />
							</th>
							<th style="text-align: right;">
								<asp:localize id="Localize2" runat="server" meta:resourcekey="SortOrderColumn" text="Sort Order(*)" />
							</th>
						</tr>
					</thead>
					<tbody>
			</HeaderTemplate>
			<ItemTemplate>
				<tr>
					<td id="Td1" class="idCell" runat="server" value="<%# AsSortable(Container.DataItem).Id %>">
						<%# AsSortable(Container.DataItem).Name %>
					</td>
					<td id="Td2" runat="server">
						<%# AsSortable(Container.DataItem).SortOrder %>
					</td>
				</tr>
			</ItemTemplate>
			<FooterTemplate>
				</tbody>
			</table>
			</FooterTemplate>
		</asp:repeater>
		<div class="propertyPaneFooter"></div>
		<asp:textbox runat="server" cssclass="newSortOrder" id="NewSortOrder" />
		<div style="margin:10px; margin-left: -2px;">
			<asp:button runat="server" CssClass="mediumButton" id="SaveButton" onclientclick="setSortOrder();" onclick="SaveButton_Click" meta:resourcekey="SaveButton" />    
		</div>
	</div>
	</div>
</div>

<script language="javascript">
    $(function () {
        $("#sortable tbody").sortable().disableSelection();
    });

    function setSortOrder() {
        var sortOrder = "";

        $(".idCell").each(function (index) {
            sortOrder += $(this).attr("value") + ",";
        });

        $(".newSortOrder").val(sortOrder);
    }
</script>
