<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    	.auto-style2 {
			font-size: xx-large;
		}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <div class="auto-style1">
            	<span class="auto-style2">健康管理表</span><br />
				<br />
            </div>
            <asp:GridView align="center" ID="GridView1" runat="server" AutoGenerateColumns="False" EnableModelValidation="True" DataKeyNames="日時" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="日時" HeaderText="日時" ReadOnly="True" SortExpression="日時" HtmlEncode="False" />
<asp:BoundField HeaderText="お名前" DataField="お名前" SortExpression="お名前"></asp:BoundField>
                    <asp:BoundField HeaderText="体温" DataField="体温" SortExpression="体温" />
                	<asp:BoundField HeaderText="症状" DataField="症状" SortExpression="症状" />
					<asp:BoundField DataField="備考" HeaderText="備考" SortExpression="備考" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:healthDBConnectionString %>" DeleteCommand="DELETE FROM [health] WHERE [日時] = @日時" InsertCommand="INSERT INTO [health] ([日時], [写真], [コメント]) VALUES (@日時, @写真, @コメント)" SelectCommand="SELECT * FROM [health]" UpdateCommand="UPDATE [health] SET [写真] = @写真, [コメント] = @コメント WHERE [日時] = @日時">
                <DeleteParameters>
                    <asp:Parameter Name="日時" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="日時" Type="String" />
                    <asp:Parameter Name="写真" Type="String" />
                    <asp:Parameter Name="コメント" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="写真" Type="String" />
                    <asp:Parameter Name="コメント" Type="String" />
                    <asp:Parameter Name="日時" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
				<br />
				お名前<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
&nbsp;体温<asp:DropDownList ID="DropDownList1" runat="server">
					<asp:ListItem>25.0</asp:ListItem>
					<asp:ListItem>25.5</asp:ListItem>
					<asp:ListItem>26.0</asp:ListItem>
					<asp:ListItem>26.5</asp:ListItem>
					<asp:ListItem>27.0</asp:ListItem>
					<asp:ListItem>27.5</asp:ListItem>
					<asp:ListItem>28.0</asp:ListItem>
					<asp:ListItem>28.5</asp:ListItem>
					<asp:ListItem>29.0</asp:ListItem>
					<asp:ListItem>29.5</asp:ListItem>
					<asp:ListItem>30.0</asp:ListItem>
					<asp:ListItem>30.5</asp:ListItem>
					<asp:ListItem>31.0</asp:ListItem>
					<asp:ListItem>31.5</asp:ListItem>
					<asp:ListItem>32.0</asp:ListItem>
					<asp:ListItem>32.5</asp:ListItem>
					<asp:ListItem>33.0</asp:ListItem>
					<asp:ListItem>33.5</asp:ListItem>
					<asp:ListItem>34.0</asp:ListItem>
					<asp:ListItem>34.5</asp:ListItem>
					<asp:ListItem>35.0</asp:ListItem>
					<asp:ListItem>35.5</asp:ListItem>
					<asp:ListItem>36.0</asp:ListItem>
					<asp:ListItem Selected="True">36.5</asp:ListItem>
					<asp:ListItem>37.0</asp:ListItem>
					<asp:ListItem>37.5</asp:ListItem>
					<asp:ListItem>38.0</asp:ListItem>
					<asp:ListItem>38.5</asp:ListItem>
					<asp:ListItem>39.0</asp:ListItem>
					<asp:ListItem>39.5</asp:ListItem>
					<asp:ListItem>40.0</asp:ListItem>
					<asp:ListItem>40.5</asp:ListItem>
					<asp:ListItem>41.0</asp:ListItem>
					<asp:ListItem>41.5</asp:ListItem>
					<asp:ListItem>42.0</asp:ListItem>
					<asp:ListItem>42.5</asp:ListItem>
					<asp:ListItem>43.0</asp:ListItem>
					<asp:ListItem>43.5</asp:ListItem>
					<asp:ListItem>44.0</asp:ListItem>
					<asp:ListItem>44.5</asp:ListItem>
					<asp:ListItem>45.0</asp:ListItem>
					</asp:DropDownList>
				度<br />
			<br />
				症状<asp:CheckBoxList ID="CheckBoxList1" runat="server" align="center" style="text-align: left">
					<asp:ListItem>発熱</asp:ListItem>
					<asp:ListItem>空咳</asp:ListItem>
					<asp:ListItem>倦怠感</asp:ListItem>
					<asp:ListItem>痛み</asp:ListItem>
					<asp:ListItem>喉の痛み</asp:ListItem>
					<asp:ListItem>下痢</asp:ListItem>
					<asp:ListItem>結膜炎</asp:ListItem>
					<asp:ListItem>頭痛</asp:ListItem>
					<asp:ListItem>味覚または嗅覚の消失</asp:ListItem>
					<asp:ListItem>皮膚の発疹、または手足の指の変色</asp:ListItem>
					<asp:ListItem>呼吸が苦しいまたは息切れ</asp:ListItem>
					<asp:ListItem>胸の痛みまたは圧迫感</asp:ListItem>
					<asp:ListItem>言語障害または運動機能の喪失</asp:ListItem>
					</asp:CheckBoxList>
				<br />
				備考<asp:TextBox ID="TextBox1" runat="server" Width="320px" placeholder="より詳しい症状をご記入ください。" style="text-align: left"></asp:TextBox>
				<br />
			<br />
			<asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="登録" />
            <br />
            <br />
			<asp:Label ID="Label1" runat="server"></asp:Label>
			<br />
            <br />
    </form>
</body>
</html>
