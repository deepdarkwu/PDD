package serverlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import tool.JdbcConn;

public class Homework extends HttpServlet{
    private static final long serialVersionUID = 1L;

    private static final String UPLOAD_DIRECTORY="upload";

    private static final int MEMORY_THRESHOLD = 1024*1024*3;
    private static final int MAX_FILE_SIZE = 1024*1024*40;
    private static final int MAX_REQUEST_SIZE = 1024*1024*50;

    private String subject;

    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{

        //request.setCharacterEncoding("uft-8");
        response.setContentType("text/html；charset=utf-8");


//表单是否符合文件上传规则
//判断客户端请求是否为POST，并且enctype属性是否是“multipart/form-data"
        if(!ServletFileUpload.isMultipartContent(request)){
            PrintWriter writer = response.getWriter();
            writer.println("错误: 表单必须有 enctype=multipart/form-data.");
            writer.flush();
            return;
        }
//文件工厂类 判定初始文件内存以及文件超过内存时临时存放的位置
        DiskFileItemFactory factory = new DiskFileItemFactory();
//以byte为单位设定文件使用多少内存量后，将文件存入临时存储
        factory.setSizeThreshold(MEMORY_THRESHOLD);
//设定临时文件的存储路径
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

//ServletFileUpload 处理同意HTML文件中多文件上传的类，继承自FileUpload
        ServletFileUpload upload = new ServletFileUpload(factory);
//设置允许上传文件的最大大小
        upload.setSizeMax(MAX_REQUEST_SIZE);

        String uploadPath = "C:\\Users\\wzf\\Desktop\\upload"+File.separator ;

//根据存储路径生成文件夹

        try{
            List<FileItem> formItems = upload.parseRequest(request);

            if(formItems!=null && formItems.size()>0){
                for(FileItem item:formItems){
                    if (item.isFormField()) {
                        processFormField(item); //处理普通的表单域
                        System.out.println(subject);
                        HttpSession session = request.getSession();
                        User u = (User)session.getAttribute("user");
                        JdbcConn jdbc = new JdbcConn();
                        jdbc.setwork(u.getId(),subject);
                    }
                    else {
                        uploadPath = "C:\\Users\\wzf\\Desktop\\upload"+File.separator +subject;
                        File uploadDir = new File(uploadPath);
                        if(!uploadDir.exists()){
                            uploadDir.mkdir();
                        }
                        processUploadedFile(item,uploadPath,request); //处理上传文件
                    }

                }
            }
        }
        catch (Exception ex){
            request.setAttribute("message", "有错误 " + ex.getMessage());
        }
        //getServletContext().getRequestDispatcher("/message.jsp").forward(request, response);
        response.sendRedirect("succeed.html");
    }


    //处理普通表单域
    private void processFormField(FileItem item) {
        try {
            //如果普通表单域名称是bookname，取对应的数据
            if ("subject".equals(item.getFieldName())) {
                subject = item.getString("UTF-8").toString();

            }
            //有几个普通表单文本框通过if方式判断取值

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

    }
    //处理上传文件
    private void processUploadedFile(FileItem item, String uploadPath,HttpServletRequest request ) throws Exception {
        HttpSession session = request.getSession();
        User u = (User)session.getAttribute("user");
        String name = u.getId()+" "+u.getName();
        String fileName = new File(item.getName()).getName();
        String prefix=fileName.substring(fileName.lastIndexOf(".")+1);
        String filePath = uploadPath + File.separator + name+'.'+prefix;
        System.out.println("filePath=" + filePath);
        File storeFile = new File(filePath);
//	写入文件
        item.write(storeFile);

    }



}