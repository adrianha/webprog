<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file = "process/connect.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	String query = "";
	if(request.getParameter("dlloption") != null)
	{
		if(request.getParameter("dlloption").equals("all"))
		{
			query = "SELECT TrHeader.IDHeader,Karyawan, format(Tanggal, 'dd/mmm/yyyy') as Waktu, Barang, Qty FROM TrHeader INNER JOIN TrDetail on val(TrDetail.IDHeader) = TrHeader.IDHeader where MONTH(Tanggal)>="+request.getParameter("ddlfrom")+"and  MONTH(Tanggal)<="+request.getParameter("ddlto");
		}
		else if(request.getParameter("dlloption").equals("sum"))
		{
			query = "SELECT TrHeader.IDHeader,Karyawan, format(Tanggal, 'dd/mmm/yyyy') as Waktu, SUM(Qty) as Total FROM TrHeader INNER JOIN TrDetail on val(TrDetail.IDHeader) = TrHeader.IDHeader where MONTH(Tanggal)>="+request.getParameter("ddlfrom")+"and  MONTH(Tanggal)<="+request.getParameter("ddlto")+" group by TrHeader.IDHeader,Karyawan,Tanggal";
		}
		else if(request.getParameter("dlloption").equals("avg"))
		{
			query = "SELECT TrHeader.IDHeader,Karyawan, format(Tanggal, 'dd/mmm/yyyy') as Waktu, AVG(Qty) as Total FROM TrHeader INNER JOIN TrDetail on val(TrDetail.IDHeader) = TrHeader.IDHeader where MONTH(Tanggal)>="+request.getParameter("ddlfrom")+"and  MONTH(Tanggal)<="+request.getParameter("ddlto")+" group by TrHeader.IDHeader,Karyawan,Tanggal";
		}
	}
	else
	{
		query = "SELECT * FROM TrHeader INNER JOIN TrDetail on val(TrDetail.IDHeader) = TrHeader.IDHeader";
	}
	
	ResultSet rs = st.executeQuery(query);
	ResultSetMetaData meta = rs.getMetaData();
	int column = meta.getColumnCount();
	
%>

<body>
<form method="get" action="glsc.jsp">
<div style="width:600px;text-align: center; margin:25px 10px 0px 250px;">

<div>
<b>from : </b>
<select name="ddlfrom">
  <option value="1">Januari</option>
  <option value="2">Febuari</option>
  <option value="3">Maret</option>
  <option value="4">April</option>
  <option value="5">Mei</option>
  <option value="6">Juni</option>
  <option value="7">Juli</option>
  <option value="8">Agustus</option>
  <option value="9">September</option>
  <option value="10">Oktober</option>
  <option value="11">November</option>
  <option value="12">Desember</option>
</select>
<b>to : </b>
<select name="ddlto">
  <option value="1">Januari</option>
  <option value="2">Febuari</option>
  <option value="3">Maret</option>
  <option value="4">April</option>
  <option value="5">Mei</option>
  <option value="6">Juni</option>
  <option value="7">Juli</option>
  <option value="8">Agustus</option>
  <option value="9">September</option>
  <option value="10">Oktober</option>
  <option value="11">November</option>
  <option value="12">Desember</option>
</select>

<select name="dlloption">
  <option value="all">All</option>
  <option value="sum">Sum</option>
  <option value="avg">Avg</option>
</select>
<input type="submit" value="executed" name="btn" />
</div>

<b>Transaction</b>
</div>
<table style="width:600px;align=left; margin:25px 10px 0px 250px;" border=1>
<tr>
	<%for(int i=1;i<=column;i++)
	{
	%>
	<th style="padding:0px 25px 0px 25px;"><%=meta.getColumnName(i)%></th>
	<%
	}
	%>
</tr>
	<%
	try {
		while(rs.next()){
  %>
 <tr>
	<%for(int i=1;i<=column;i++)
	{
	%>
	<td><%=rs.getString(i)%></td>
	<%
	}
	%>
</tr>
  	<%
		}
	}
	catch(Exception ex) {
		}
		rs.close();
		st.close();
		con.close();
	%>
</table>
</form>
</body>