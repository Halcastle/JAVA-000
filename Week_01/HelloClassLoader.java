package jvm;


import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Paths;

public class HelloClassLoader extends ClassLoader{

    public static void main(String[] args){
        Object s = null;
        try {
            s = new HelloClassLoader().findClass("Hello").newInstance();
            Class clazz = s.getClass();
            Method method = clazz.getMethod("hello",null);
            method.invoke(s,null);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    protected Class<?> findClass(String name) throws ClassNotFoundException {
        String fileName = "src/file/Hello.xlass";
        byte[] bytes = null;
        try {
            bytes = Files.readAllBytes(Paths.get(fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
         for(int i = 0 ;i < bytes.length ;i++)
             bytes[i] = (byte) (255 - bytes[i]);
        return  defineClass(name,bytes,0,bytes.length);

    }
}
