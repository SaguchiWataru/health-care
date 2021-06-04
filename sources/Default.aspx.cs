using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    //DB接続文字列 Web.config内に記述あり
    string healthCString;

    SqlDataAdapter healthDA; //SQLデータアダプタ

    DataSet healthDS;    //データセット
    DataTable healthDT;    //テーブル
    DataRow row;        //行

    protected void Page_Load(object sender, EventArgs e)
    {
        //DB接続文字列 Web.config内に記述あり
        healthCString = SqlDataSource1.ConnectionString;

        healthDA = new SqlDataAdapter("select * from health", healthCString);
        healthDS = new DataSet();

        try
        {   // DBファイルを開く
            healthDA.Fill(healthDS, "health");
            GridView1.DataBind();
        }
        catch (Exception er)
        {   // エラーメッセージを表示
            Label1.Text = er.Message;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {   //登録ボタン

        // データセットへの読み込み
        healthDS = new DataSet();    // データセットの定義

        try
        {   // DBファイルを開く
            healthDA.Fill(healthDS, "health");
            healthDT = healthDS.Tables["health"];
        }
        catch (Exception er) {
            Label1.Text = er.Message;
            healthDT = healthDS.Tables.Add("health");
            healthDT.Columns.Add("日時");
            healthDT.Columns.Add("お名前");
            healthDT.Columns.Add("体温");
            healthDT.Columns.Add("症状");
            healthDT.Columns.Add("備考");
        }

        // 新しい行をテーブルに追加する
        row = healthDT.NewRow();
        row["日時"] = DateTime.Today.ToString("yyyy年MM月dd日(ddd)") + "<br />" + DateTime.Now.ToString("tthh時mm分ss秒");
        row["お名前"] = TextBox2.Text;
        row["体温"] = DropDownList1.Text;

		String healthMessage = null;

		foreach (ListItem item in CheckBoxList1.Items)
		{
			if (item.Selected)
			{
				healthMessage += item.Value + ", ";
			}
		}

		if (healthMessage == null)
		{
			healthMessage = "なし";

			if (TextBox1.Text != "")
			{
				healthMessage = "あり";
			}
		}


		row["症状"] = healthMessage;
		row["備考"] = TextBox1.Text;

        healthDT.Rows.Add(row);

        // データをデータベースファイルに書き出す
        new SqlCommandBuilder(healthDA);     // insert用コマンド自動作成
        healthDA.Update(healthDS, "health");   //DBの更新

        // GridViewの表示を更新する
        GridView1.DataBind();

		// Label1.Text = healthMessage;
	}
}
