<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="Payment.Config"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.net.URLDecoder"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>KẾT QUẢ THANH TOÁN</title>
        <!-- Bootstrap core CSS -->
        <link href="/vnpay_jsp/assets/bootstrap.min.css" rel="stylesheet"/>
        <!-- Custom styles for this template -->
        <link href="/vnpay_jsp/assets/jumbotron-narrow.css" rel="stylesheet"> 
        <script src="/vnpay_jsp/assets/jquery-1.11.3.min.js"></script>
        <style>
            .btn {
                background-color: #2bc5d4;
                color: #ffffff;
                border-radius: 5px;
            }
            .btn:hover {
                background-color: #e3f2e1;
            }
        </style>
    </head>
    <body>
      <%
    // Begin process return from VNPAY
    Map fields = new HashMap();
    for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
        String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
        String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
        if ((fieldValue != null) && (fieldValue.length() > 0)) {
            fields.put(fieldName, fieldValue);
        }
    }

    // Add accId and courseId to fields
    String accId = URLDecoder.decode(request.getParameter("accId"), "UTF-8");
    String courseId = URLDecoder.decode(request.getParameter("courseId"), "UTF-8");
    fields.put("accId", URLEncoder.encode(accId, StandardCharsets.US_ASCII.toString()));
    fields.put("courseId", URLEncoder.encode(courseId, StandardCharsets.US_ASCII.toString()));

    String vnp_SecureHash = request.getParameter("vnp_SecureHash");
    if (fields.containsKey("vnp_SecureHashType")) {
        fields.remove("vnp_SecureHashType");
    }
    if (fields.containsKey("vnp_SecureHash")) {
        fields.remove("vnp_SecureHash");
    }

    String signValue = Config.hashAllFields(fields);
    String date = (String)request.getParameter("vnp_PayDate");
    String money = (String)request.getParameter("vnp_Amount");
    String ndck = (String)request.getParameter("vnp_OrderInfo");
%>        <!--Begin display -->
        <div class="container">
            <div class="header clearfix">
                <h3 class="text-muted">KẾT QUẢ THANH TOÁN</h3>
            </div>
            <div class="table-responsive">
                <form action="bill" method="POST">

                    <div class="form-group">
                        <label >Mã giao dịch thanh toán:</label>
                        <label><%=request.getParameter("vnp_TxnRef")%></label>
                    </div>    
                    <div class="form-group">
                        <label >Thành tiền:</label>
                        <label><%=request.getParameter("vnp_Amount")%></label>
                    </div>  
                    <div class="form-group">
                        <label >Nội dung thanh toán:</label>
                        <label><%=request.getParameter("vnp_OrderInfo")%></label>
                    </div> 

                    <div class="form-group">
                        <label >Mã ngân hàng thanh toán:</label>
                        <label><%=request.getParameter("vnp_BankCode")%></label>
                    </div> 
                    <div class="form-group">
                        <label >Thời gian thanh toán:</label>
                        <label><%=date%></label>
                    </div> 
                    <div class="form-group">
                        <label >Tình trạng giao dịch:</label>
                        <label>
                            <%
                                boolean isSuccess = false;
                                if (!signValue.equals(vnp_SecureHash)) {
                                    if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                                        out.print("Thành công");
                                        isSuccess = true;
                                    } else {
                                        out.print("Không thành công");
                                    }

                                } else {
                                    out.print("invalid signature");
                                }
                            %></label>
                    </div> 
                    <input type="hidden" name="courseId" value="<%=courseId%>">
                    <input type="hidden" name="accId" value="<%=accId%>">
                    <input type="hidden" name="ndck" value="<%=ndck%>">
                    <input type="hidden" name="date" value="<%=date%>">
                    <input type="hidden" name="money" value="<%=money%>">


                    <%
                        if(isSuccess) {
                    %>
                    <button type="submit" class="btn btn-default">Tham gia khóa học</button>
                    <%
                    }else {
                    %>
                    <button onclick="rePay(<%=money%>,<%=courseId%>,<%=accId%>, '<%=ndck%>')"  type="button" class="btn btn-default">Quay lại thanh toán</button>
                    <%
                    }
                    %>


                </form>
            </div>
            <p>
                &nbsp;
            </p>

        </div>  

        <script>
            function rePay(money, cid, acc, ndck) {
                window.location.href = '/Project_E-Learning/vnpay_pay.jsp?price=' + money + '&cid=' + cid + '&acc=' + acc + '&ndck=' + ndck;
            }

        </script>
    </body>
</html>
