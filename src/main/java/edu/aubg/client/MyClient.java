package edu.aubg.client;


import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Executable;
import java.util.ArrayList;


public class MyClient {

    private static ArrayList<String> filePaths = new ArrayList<String>();//holds file paths
    private static ArrayList<byte[]> fileBytes = new ArrayList<byte[]>();//holds byte representations of the files

    //check if string is valid path
    private static boolean isPath(String path){
        File file = new File(path);
        return file.isDirectory();
    }

    //returns # of directories from root
    private static int dirsFromRoot(String path){
        File file = new File(path);
        int count = 0;
        while(file.getParent()!=null){
            ++count;
            file = new File(file.getParent());
        }
        return count;
    }

    //adds the file paths to filePaths
    private static void getFilePaths(String path){
        File file = new File(path);
        File[] f = file.listFiles();
        for(int i = 0; i<f.length; ++i){
            if(f[i].isFile())
                filePaths.add(f[i].getPath());
            else    if(f[i].isDirectory())
                        getFilePaths(f[i].getPath());
        }
    }

    //saves the files into bytes
    private static void getFileBytesSlow(){
        try {
            for(int i = 0; i<filePaths.size(); ++i){
                InputStream is = new FileInputStream(filePaths.get(i));
                byte[] bytes = IOUtils.toByteArray(is);
                fileBytes.add(bytes);
            }
        }
        catch (Exception ex){
            System.out.println("Error: " + ex);
        }
    }

    //combines above two methods
    private static void getFileBytes(String path){
        File file = new File(path);
        File[] f = file.listFiles();
        for(int i = 0; i<f.length; ++i){
            if(f[i].isFile()){
                try {
                    InputStream is = new FileInputStream(f[i]);
                        byte[] bytes = IOUtils.toByteArray(is);
                        fileBytes.add(bytes);
                }
                catch (Exception ex){
                    System.out.println("Error: " + ex);
                }
            }
            else    if(f[i].isDirectory())
                getFileBytes(f[i].getPath());
        }
    }


    public static void main(String [] args) {

        String path = "C:\\Users\\Momchil\\src\\upload";


        File file = new File(path);
        File[] f = file.listFiles();
        getFileBytes(path);
        
        //for (int i = 0; i < fileBytes.get(fileBytes.size()-1).length; i++) {
        //    System.out.print((char)fileBytes.get(fileBytes.size()-1)[i]);
        //}

        //if(f[0].exists()){
          //  System.gc();
            //f.delete();
        //}


        //fileBytes.get(fileBytes.size()-1);
        /*for(int i = 0; i<f.length; ++i){
            if(f[i].isFile())
                System.out.println("yes");
            else    System.out.println("no");
        }*/



        /*getFilePaths(path);
        for(int i = 0; i<filePaths.size(); ++i){
            System.out.println(filePaths.get(i));
        }*/
        //getFileBytes();





        /*try {
            InputStream is = new FileInputStream(f[1].getPath());
            byte[] bytes = IOUtils.toByteArray(is);
            for (int i = 0; i < bytes.length; i++) {
                System.out.print((char)bytes[i]);
            }
            System.out.println();
            is = new FileInputStream(f[2].getPath());
            byte[] b = IOUtils.toByteArray(is);
            for (int i = 0; i < b.length; i++) {
                System.out.print((char)b[i]);
            }
        }
        catch (Exception ex){
            System.out.println("Error: " + ex);
        }*/

        /*byte[] b = new byte[(int) file.length()];
        try {
            FileInputStream fileInputStream = new FileInputStream(file);
            fileInputStream.read(b);
            for (int i = 0; i < b.length; i++) {
                System.out.print((char)b[i]);
            }
        } catch (Exception ex) {
            System.out.println("Error: " + ex );

        }*/

        /*try{
            byte[] bFile = Files.readAllBytes(new File(path).toPath());
        }
        catch (Exception e){}*/

        /*try{
            byte[] bytesArray = new byte[(int) file.length()];
            FileInputStream fis = new FileInputStream(file);
            fis.read(bytesArray); //read file into bytes[]
            fis.close();
        }
        catch (Exception ex){

        }*/


        //System.out.println(isPath(path));
        //System.out.println(dirsFromRoot(path));




    }
}
