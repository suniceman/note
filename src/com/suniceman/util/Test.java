package com.suniceman.util;

import java.util.ArrayList;
import java.util.List;

public class Test {
    public static void main(String[] args) {
        // String s = Md5Util.getMd5("admin");
        // System.out.println(s);
        
        List<Integer> m = new ArrayList<Integer>();
        m.add(1);
        m.add(2);
        m.add(3);
        m.add(4);
        m.add(5);
        m.add(6);
        m.add(7);
        
        outList(m);
    }
    
    private static void outList(List<Integer> m) {
        // TODO Auto-generated method stub
        for (Object i : m) {
            System.out.println(i);
        }
    }
}
