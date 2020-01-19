//이미지파일 업로드하였을때 Default 파일이름 지정
package web;

import java.io.File;
import java.io.IOException;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class DefaultFileRenamePolicy implements FileRenamePolicy{
	public File rename(File f) {
        if (createNewFile(f)) {
             return f;
        }
        String name = f.getName();
        String body = null;
        String ext = null;

        int dot = name.lastIndexOf(".");
        if (dot != -1) {
             body = name.substring(0, dot);
             ext = name.substring(dot);  // includes "."
        }
        else {
             body = name;
             ext = "";
        }

        int count = 0;
        while (!createNewFile(f) && count < 9999) {
             count++;
             String newName = body + count + ext;
             f = new File(f.getParent(), newName);
        }
        return f;
   }

   private boolean createNewFile(File f) {
        try {
              return f.createNewFile();
        }
        catch (IOException ignored) {
             return false;
        }
   }

}
