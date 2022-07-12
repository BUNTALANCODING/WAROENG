<%-- 
Document   : index
Created on : Jul 10, 2022, 12:29:15 AM
Author     : Asus
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.produk"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
 
    if(request.getParameter("submit")!=null)
    {
    String namacos = request.getParameter("cos");
        String nama = request.getParameter("barang");
        String harga = request.getParameter("harga");
        String jumlah = request.getParameter("jumlah");
        String bayar = request.getParameter("hartot");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/waroeng","root","");
        pst = con.prepareStatement("insert into report(NamaCostumer, NamaBarang, HargaBarang, JumlahBarang, HargaBayar)values(?,?,?,?,?)");
       pst.setString(1, namacos);
        pst.setString(2, nama);
        pst.setString(3, harga);
        pst.setString(4, jumlah);
        pst.setString(5, bayar);
        pst.executeUpdate();  
        
        %>

<%            
    }
   %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="CSS/index.css" rel="stylesheet" type="text/css" />
    <link href="CSS/AdminMenu.css" rel="stylesheet" type="text/css" />
    <title>Waroeng</title>
</head>

<body>
    <main>
        <section>
            <div class="halamanutama">
                <header>
                    <h1>Welcome Karyawan <%=session.getAttribute("userid")%></h1>
                    <a href="index.jsp"><button class="btnlogout">Logout</button></a>
                </header>
                </br>

                <%
                        produk pm = new produk();
                        List <produk> data = new ArrayList<produk>();
                        String ket = request.getParameter("ket");
                        if (ket == null) {
                            data = pm.tampil();
                        }
                        for (int x = 0; x < data.size(); x++) {
                    %>
                <table width="75%" border="1" align="center">
                    <tr>
                        <td>
                            <form name="ModelDetail" method="POST" action="kontrol_barang" align="center">
                                Kode Produk : <%=data.get(x).getSTS_produk()%> <input type="hidden" name="sts_produk"
                                    value="<%=data.get(x).getSTS_produk()%>"><br>
                                Nama Produk : <%=data.get(x).getNm_produk()%><input type="hidden" name="nm_produk"
                                    value="<%=data.get(x).getNm_produk()%>"><br>
                                Harga : <%=data.get(x).getHarga_produk()%> <input type="hidden" name="harga"
                                    value="<%=data.get(x).getHarga_produk()%>"><br>
                            </form>
                        </td>
                    </tr>
                </table>
                <% }%>
                </br>
                </br>
                
                <h3>===========Detail pembelian===========</h3>
                </br>

                <form>
                    <label class="form-label">Nama Costumer</label>
                    <input type="text" class="form-control" placeholder="Nama Costumer" name="cos" id="cos" required></br>
                    <label class="form-label">Nama Barang</label>
                    <input type="text" class="form-control" placeholder="Nama Barang" name="barang" id="barang"
                        required></br>
                    <label class="form-label">Harga Barang</label>
                    <input type="text" class="form-control" placeholder="Harga" name="harga" id="harga" required></br>
                    <label class="form-label">Jumlah</label>
                    <input type="text" class="form-control" placeholder="Jumlah" name="jumlah" id="jumlah" required></br>
                    <label class="form-label">Harga Yang harus di bayar</label>
                    <input type="text" class="form-control" placeholder="Harga Total" name="hartot" id="hartot"
                        required></br>
                    <input type="submit" id="submit" value="submit" name="submit" class="btnlogout">
                </form>
                </br></br>

                <h3>========Harga yang harus di bayar========</h3>
                </br>
                <label>Total Bayar</label></br>
                <textarea id="total"></textarea></br>
                <label>Diskon</label></br>
                <textarea id="dis"></textarea></br>
                <label>Bayar</label></br>
                <textarea id="bayar"></textarea></br>
                </br></br>

                <footer>
                    <button class="btncari" onclick="hasil()">proses</button>
                </footer>
            </div>
        </section>
    </main>
    <script src="js/penjualan.js" type="text/javascript"></script>
</body>

</html>