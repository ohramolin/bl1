<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DynamicOrderPropertyUi.ascx.cs" Inherits="UCommerce.Web.UI.UCommerce.Marketing.Targets.DynamicOrderPropertyUi" %>

<% var containerId = Guid.NewGuid().ToString(); %>
<table cellpadding="0" cellspacing="0" style="width: 100%;" id="<% =containerId %>">
    <tr>
        <td>
            <div class="ReadOnlyPanel">
                <asp:Literal runat="server" id="ReadOnlyMessage"></asp:Literal>
            </div>

            <div class="EditorPanel" style="display: none;">
                <asp:textBox runat="server" id="KeyTextBox" CssClass="key" autocompletetype="None" />&nbsp;
			    <asp:localize runat="server" meta:resourcekey="OnLabel" />&nbsp;
                <asp:DropDownList runat="server" id="TargetOrderLineOrOrderDropDownList" cssclass="targetOrderOrLine" />&nbsp;
                <asp:DropDownlist runat="server" id="CompareModeDropDownList" DataTextField="Key" DataValueField="Value" DataSource="<%# GetCompareModes() %>" />&nbsp;
                <asp:TextBox runat="server" id="TargetValueTextBox" />
            </div>
        </td>
        <td style="width: 50px; text-align: right; vertical-align: top;">
            <img src="../Images/ui/pencil.png" class="editButton" style="cursor: pointer;" id="button" alt="<%#GetLocalResourceObject("Edit.Text") %>" />
            <asp:imagebutton id="SaveButton" runat="server" imageurl="../../Images/save.gif" meta:resourcekey="Save" onclick="SaveButton_Click" ValidationGroup="DynamicOrderPropertyGroup" CssClass="saveButton" />
            <asp:imagebutton id="DeleteButton" runat="server" imageurl="../../Images/ui/cross.png" meta:resourcekey="Delete" onclick="DeleteButton_Click" /><br />
        </td>
    </tr>
</table>

<script>
    function bindUi() {

        var container = $("#<%=containerId%>");

        var availableOrderProperties = [
            <%# GetDistinctDynamicOrderPropertyKeys() %>];

        var availableOrderLineProperties = [
            <%# GetDistinctDynamicOrderLinePropertyKeys() %>];

        container.find(".targetOrderOrLine").change(function() {
            var keyInput = container.find(".key");
            if (this.value == "0")
                keyInput.autocomplete("option", "source", availableOrderProperties);
            else
                keyInput.autocomplete("option", "source", availableOrderLineProperties);
        });

        container.find(".key").autocomplete({
            minLength: 0,
            source: availableOrderProperties
        });

        container.find(".key").focus(function() {
            if (this.value == "")
                $(this).autocomplete("search", "");
        });
        
        container.find(".editButton").click(function() {
            container.find(".ReadOnlyPanel").toggle();
            container.find(".EditorPanel").toggle();
            container.find(".editButton").toggle();
            container.find(".saveButton").toggle();
        });
    }

    $(bindUi());

</script>