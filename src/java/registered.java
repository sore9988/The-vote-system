
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.SQLCustomer;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Administrator
 */
@MultipartConfig
@WebServlet(urlPatterns = {"/registered"})
public class registered extends HttpServlet {
private static final long serialVersionUID = 1L;

    public registered() {
        super();
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            
        request.setCharacterEncoding("utf-8");
        PrintWriter out=response.getWriter();
        
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        String recheckpw=request.getParameter("recheckpw");
        
        if(password.equals(recheckpw)){
        //上傳圖片
        Part part = request.getPart("photo");
        String filename = getFilename(part);
        writeTo(filename, part);
        //
        String imgurl="C:/android/code/CodeAdventure/web/function/headimg/" + filename;        
        SQLCustomer sa=new SQLCustomer(name,email,password,imgurl);
        sa.add();
        HttpSession session=request.getSession();
        request.setAttribute("SA", sa);//更動		
        response.sendRedirect("login/login.jsp");}//更動
        else
        {
            request.setAttribute("ER", "密碼確認錯誤，請重新輸入");
            response.sendRedirect("login/signup.jsp");
        }    
        }
    
        String getFilename(Part part) {
        String header = part.getHeader("Content-Disposition");
        String filename = header.substring(header.indexOf("filename=\"") + 10,
                header.lastIndexOf("\""));
        if(filename.indexOf("\\")>=0)
            filename=filename.substring(filename.lastIndexOf("\\")+1,filename.length());
        return filename;
        }
        void writeTo(String filename, Part part) throws IOException,
            FileNotFoundException {
        InputStream in = part.getInputStream();
        OutputStream out = new FileOutputStream("C:/android/code/CodeAdventure/web/function/headimg/" + filename);
        byte[] buffer = new byte[1024];
        int length = -1;
        while ((length = in.read(buffer)) != -1) {
            out.write(buffer, 0, length);
        }
        in.close();
        out.close();
    }
}
